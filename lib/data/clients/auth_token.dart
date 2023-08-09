import 'dart:convert';
import 'dart:io';

import 'package:app_laundry/data/clients/http_client_extension.dart';
import 'package:app_laundry/data/clients/rsa_client.dart';
import 'package:app_laundry/domain/constants/globals.dart';
import 'package:app_laundry/domain/entities/auth/security_entity.dart';
import 'package:ideploy_package/ideploy_package.dart';

@injectable
class AuthToken {
  final HiveInterface _hive;
  final FirebaseAuth _firebaseAuth;
  final RSAClient _rsaClient;
  final FlutterSecureStorage _secureStorage;
  final FirebaseStorage _fireStorage;

  AuthToken({
    required HiveInterface hive,
    required FirebaseAuth firebaseAuth,
    required RSAClient rsaClient,
    required FlutterSecureStorage secureStorage,
    required FirebaseStorage fireStorage,
  })  : _hive = hive,
        _firebaseAuth = firebaseAuth,
        _rsaClient = rsaClient,
        _secureStorage = secureStorage,
        _fireStorage = fireStorage;

  bool _isExpired(String token) {
    return JwtDecoder.isExpired(token);
  }

  Future<String> _renewToken() async {
    User? fireUser = _firebaseAuth.currentUser;
    fireUser ??= await _firebaseAuth.authStateChanges().first;

    final String? token = await fireUser?.getIdToken(true);
    _hive.box(StorageKeys.mainBox).put(StorageKeys.token, token).ignore();
    return token ?? '';
  }

  Future<String> getToken() async {
    String? token = _hive.box(StorageKeys.mainBox).get(StorageKeys.token);
    if (token == null || _isExpired(token)) {
      token = await _renewToken();
    }

    return token;
  }

  Future<String?> getCertificate() async {
    final String? cert =
        await _secureStorage.read(key: StorageKeys.certificate);
    return cert?.replaceAll('\r', '').replaceAll('\n', '');
  }

  Future<Map<String, dynamic>> makeDataHash() async {
    final User? user = await _firebaseAuth.authStateChanges().first;
    final Map<String, dynamic> dataHash = <String, dynamic>{
      'id': null,
      'firebaseId': user?.uid,
      'email': user?.email,
      'tenants': <String>[],
    };

    await _hive.box(StorageKeys.mainBox).put(StorageKeys.dataHash, dataHash);
    return dataHash;
  }

  Future<String?> makeHash() async {
    final dynamic hiveHash =
        _hive.box(StorageKeys.mainBox).get(StorageKeys.dataHash);
    final Map<String, dynamic> dataHash = hiveHash != null
        ? Map<String, dynamic>.from(hiveHash)
        : await makeDataHash();
    dataHash['timestamp'] = DateTime.now().millisecondsSinceEpoch;
    final String encodedData = jsonEncode(dataHash);
    final String? hash = await _rsaClient.encrypt(encodedData);
    return hash;
  }

  Future<SecurityEntity?> getSecurityData() async {
    final String? cert = await getCertificate();
    final String? hash = await makeHash();

    if (hash == null || cert == null) {
      return null;
    }

    return SecurityEntity(
      hash: hash,
      certificate: cert,
    );
  }

  Future<void> downloadSecretFile({
    required String storageReference,
    required String firebaseReference,
  }) async {
    try {
      final Directory dir = await getTemporaryDirectory();
      final String path = '${dir.path}/secrets/$storageReference.pem';
      File file = File(path);
      if (!file.existsSync()) {
        file = await File(path).create(recursive: true);
      }

      final DownloadTask result =
          _fireStorage.ref(firebaseReference).writeToFile(file);
      await result.whenComplete(() => {});
      final String value = await file.readAsString();

      await _secureStorage.write(key: storageReference, value: value);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> _downloadCertificate() async {
    return downloadSecretFile(
      storageReference: StorageKeys.certificate,
      firebaseReference: FirebaseStorageKeys.certificate,
    );
  }

  Future<void> _downloadPublicKey() async {
    return downloadSecretFile(
      storageReference: StorageKeys.publicKey,
      firebaseReference: FirebaseStorageKeys.publicKey,
    );
  }

  Future<SecurityEntity> downloadSecurityData() async {
    await Future.wait(<Future<void>>[
      _downloadCertificate(),
      _downloadPublicKey(),
    ]);

    final SecurityEntity? result = await getSecurityData();
    return result!;
  }

  Future<Response<dynamic>> _retry(
    SecurityEntity data,
    Dio dio,
    RequestOptions requestOptions,
  ) async {
    requestOptions.headers[HeadersKeys.hash] = data.hash;
    requestOptions.headers[HeadersKeys.xClientCert] = data.certificate;

    final Options options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<void> onErrorInterceptor(
    DioException error,
    ErrorInterceptorHandler handler,
    Dio dio,
  ) async {
    if (error.response != null &&
        (error.response as Response<dynamic>).authMessageError) {
      final SecurityEntity? data = await downloadSecurityData();
      if (data != null) {
        final Response<dynamic> response =
            await _retry(data, dio, error.requestOptions);
        handler.resolve(response);
        return;
      }
    }
    handler.reject(error);
  }
}
