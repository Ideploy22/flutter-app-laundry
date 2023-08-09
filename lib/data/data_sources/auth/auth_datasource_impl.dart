import 'package:app_laundry/data/clients/http_client.dart';
import 'package:app_laundry/data/data_sources/auth/auth_datasource.dart';
import 'package:app_laundry/data/models/user/user_model.dart';
import 'package:app_laundry/domain/constants/app_endpoints.dart';
import 'package:app_laundry/domain/entities/user/user_entity.dart';
import 'package:ideploy_package/ideploy_package.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final HttpClient _http;

  AuthDataSourceImpl({
    required FirebaseAuth firebaseAuth,
    required HttpClient http,
  })  : _firebaseAuth = firebaseAuth,
        _http = http;

  Future<UserEntity> _backendSignIn() async {
    try {
      final Response<dynamic> response =
          await _http.httpPatch(AppEndpoints.login.path);
      final Map<String, dynamic> json =
          Map<String, dynamic>.from(response.data);
      return UserModel.fromJson(json).toEntity();
    } catch (error) {
      await _firebaseAuth.signOut();
      rethrow;
    }
  }

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final UserEntity user = await _backendSignIn();
      await _firebaseAuth.currentUser?.getIdToken(true);
      return user;
    } catch (error) {
      rethrow;
    }
  }

  Future<UserEntity> _getUserByToken() async {
    try {
      final Response<dynamic> response =
          await _http.httpGet(AppEndpoints.getUserByToken.path);
      final Map<String, dynamic> json =
          Map<String, dynamic>.from(response.data);
      return UserModel.fromJson(json).toEntity();
    } catch (error) {
      await _firebaseAuth.signOut();
      rethrow;
    }
  }

  @override
  Future<UserEntity?> initializeUser() async {
    try {
      final User? fireUser = await _firebaseAuth.authStateChanges().first;
      if (fireUser == null) {
        return null;
      }

      await _firebaseAuth.currentUser?.getIdToken(true);
      final UserEntity user = await _getUserByToken();
      return user;
    } catch (error) {
      rethrow;
    }
  }
}
