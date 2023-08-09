import 'package:app_laundry/domain/entities/user/user_entity.dart';

abstract class AuthDataSource {
  Future<UserEntity> signIn({
    required String email,
    required String password,
  });

  Future<UserEntity?> initializeUser();
}
