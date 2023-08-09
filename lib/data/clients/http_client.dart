import 'package:app_laundry/data/clients/auth_token.dart';
import 'package:app_laundry/domain/constants/globals.dart';
import 'package:app_laundry/domain/entities/auth/security_entity.dart';
import 'package:app_laundry/domain/validator/validator.dart';
import 'package:ideploy_package/app_global.dart';
import 'package:ideploy_package/ideploy_package.dart';

@injectable
class HttpClient {
  final Dio _dio;
  final AuthToken _authToken;

  HttpClient({required Dio dio, required AuthToken authToken})
      : _dio = dio,
        _authToken = authToken {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) =>
          _requestInterceptor(options, handler),
      onError: (DioException error, ErrorInterceptorHandler handler) {
        // if (error.response != null) {
        //   // TODO(auth): deslogar usuario do firebase;
        //   return;
        // }

        _authToken.onErrorInterceptor(error, handler, dio);
      },
    ));
  }

  Future<String?> _renewToken() async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      User? firebaseUser = _auth.currentUser;
      firebaseUser ??= await _auth.authStateChanges().first;

      final String? _token = await firebaseUser?.getIdToken(true);
      await Hive.box(StorageKeys.mainBox).put(StorageKeys.token, _token);
      return _token;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> _handleToken(RequestOptions options) async {
    if (options.headers.containsKey(HeadersKeys.requiresToken)) {
      String? token = Hive.box(StorageKeys.mainBox).get(StorageKeys.token);
      if (token == null || JwtDecoder.isExpired(token)) {
        token = await _renewToken();
      }
      options.headers
          .addAll(<String, String>{HeadersKeys.authorization: 'Bearer $token'});
      options.headers.remove(HeadersKeys.requiresToken);
    }
  }

  Future<void> _handleAuthHashCerts(RequestOptions options) async {
    try {
      SecurityEntity? security = await _authToken.getSecurityData();
      security ??= await _authToken.downloadSecurityData();
      options.headers.addAll(<String, String>{HeadersKeys.hash: security.hash});
      options.headers.addAll(
        <String, String>{HeadersKeys.xClientCert: security.certificate},
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<void> _requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    await _handleToken(options);
    await _handleAuthHashCerts(options);
    return handler.next(options);
  }

  Options _buildOptions(bool requiresToken, {bool downloadFile = false}) {
    final Map<String, dynamic> _headers = <String, dynamic>{};
    if (requiresToken) {
      _headers[HeadersKeys.requiresToken] = requiresToken;
    } else {
      _headers[HeadersKeys.xApiKey] = AppGlobal.instance.xApiKey;
    }

    if (downloadFile) {
      return Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        headers: _headers,
      );
    }

    return Options(
      headers: _headers,
    );
  }

  Future<Response<dynamic>> httpGet(
    String endpoint, {
    bool requiresToken = true,
    bool downloadFile = false,
  }) {
    final String url = '${AppGlobal.instance.baseUrl}/$endpoint';
    final Options options =
        _buildOptions(requiresToken, downloadFile: downloadFile);
    return _dio.get(url, options: options);
  }

  Future<Response<dynamic>> httpPost(
    String endpoint, {
    dynamic body,
    bool requiresToken = true,
  }) {
    try {
      final String url = '${AppGlobal.instance.baseUrl}/$endpoint';
      final Options options = _buildOptions(requiresToken);
      return _dio.post(url, options: options, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> httpPut(String endpoint, {dynamic body}) {
    try {
      final String url = '${AppGlobal.instance.baseUrl}/$endpoint';
      final Options options = _buildOptions(true);
      return _dio.put(url, options: options, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> httpPatch(
    String endpoint, {
    dynamic body,
    bool requiresToken = true,
  }) {
    try {
      final String url = '${AppGlobal.instance.baseUrl}/$endpoint';
      final Options options = _buildOptions(requiresToken);
      return _dio.patch(url, options: options, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> httpDelete(String endpoint) {
    try {
      final String url = '${AppGlobal.instance.baseUrl}/$endpoint';
      final Options options = _buildOptions(true);
      return _dio.delete(url, options: options);
    } catch (e) {
      rethrow;
    }
  }

  ServerFailure parseDioError(DioException error) {
    if (error.response!.statusCode! >= 400 &&
        error.response!.statusCode! <= 500) {
      final Map<String, dynamic> data = error.response?.data;
      throw ServerFailure(
        message: Validators().serverMessage(
          data['error'] ?? data['cause'] ?? data['message'] ?? '',
        ),
      );
    } else {
      throw error.response?.data;
    }
  }
}
