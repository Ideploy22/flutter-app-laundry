import 'dart:async';

import 'package:app_laundry/domain/entities/user/user_entity.dart';
import 'package:ideploy_package/domain/entities/either_of/either_of.dart';
import 'package:ideploy_package/domain/entities/failure/failure.dart';

abstract class AuthRepository {
  Future<EitherOf<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  });

  Future<EitherOf<Failure, UserEntity?>> initializeUser();
}
