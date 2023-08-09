import 'dart:async';

import 'package:app_laundry/data/data_sources/auth/auth_datasource.dart';
import 'package:app_laundry/domain/entities/user/user_entity.dart';
import 'package:app_laundry/domain/repositories/auth/auth_repository.dart';
import 'package:ideploy_package/ideploy_package.dart';

@Injectable(as: AuthRepository)
class UserRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  UserRepositoryImpl({required AuthDataSource authDataSource})
      : _authDataSource = authDataSource;

  @override
  Future<EitherOf<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserEntity user =
          await _authDataSource.signIn(email: email, password: password);
      return resolve(user);
    } catch (error) {
      return reject(ServerFailure(message: 'failures.auth'));
    }
  }

  @override
  Future<EitherOf<Failure, UserEntity?>> initializeUser() async {
    try {
      final UserEntity? user = await _authDataSource.initializeUser();
      return resolve(user);
    } catch (error) {
      return reject(ServerFailure(message: 'failures.auth'));
    }
  }
}
