import 'package:app_laundry/domain/constants/globals.dart';
import 'package:ideploy_package/ideploy_package.dart';

@injectable
class RSAClient {
  final FlutterSecureStorage _secureStorage;

  RSAClient({
    required FlutterSecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  Future<String?> getPublicKey() async {
    final String? result =
        await _secureStorage.read(key: StorageKeys.publicKey);
    return result;
  }

  Future<String?> encrypt(String message) async {
    try {
      final String? key = await getPublicKey();
      if (key == null) {
        return null;
      }

      final String result =
          await RSA.encryptOAEP(message, '', Hash.SHA256, key);
      return result;
    } catch (error) {
      rethrow;
    }
  }
}
