// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_plugin_pos_integration/export.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:ideploy_package/domain/use_cases/db/get_language_usecase.dart'
    as _i5;
import 'package:ideploy_package/domain/use_cases/db/set_language_usecase.dart'
    as _i4;
import 'package:ideploy_package/ideploy_package.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;
import 'package:permission_handler/permission_handler.dart' as _i8;

import '../data/clients/auth_token.dart' as _i11;
import '../data/clients/http_client.dart' as _i12;
import '../data/clients/rsa_client.dart' as _i9;
import '../data/clients/third_modules.dart' as _i21;
import '../data/data_sources/auth/auth_datasource.dart' as _i13;
import '../data/data_sources/auth/auth_datasource_impl.dart' as _i14;
import '../data/repositories/auth/auth_repository_impl.dart' as _i16;
import '../domain/entities/permissions/permissions.dart' as _i7;
import '../domain/repositories/auth/auth_repository.dart' as _i15;
import '../domain/use_cases/auth/get_current_user.dart' as _i17;
import '../domain/use_cases/auth/sing_in.dart' as _i18;
import '../presentation/app/controller/app_controller.dart' as _i3;
import '../presentation/login/controller/login_controller.dart' as _i20;
import '../presentation/spash/controller/splash_controller.dart' as _i19;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppController>(_i3.AppController(
    setLanguage: gh<_i4.SetLanguage>(),
    getLanguage: gh<_i5.GetLanguage>(),
  ));
  gh.factory<_i6.FlutterPluginPosIntegration>(() => registerModule.posPlugin);
  gh.factory<Map<_i7.PermissionsType, _i8.Permission>>(
      () => registerModule.permissions);
  gh.factory<_i9.RSAClient>(
      () => _i9.RSAClient(secureStorage: gh<_i10.FlutterSecureStorage>()));
  gh.factory<_i11.AuthToken>(() => _i11.AuthToken(
        hive: gh<_i10.HiveInterface>(),
        firebaseAuth: gh<_i10.FirebaseAuth>(),
        rsaClient: gh<_i9.RSAClient>(),
        secureStorage: gh<_i10.FlutterSecureStorage>(),
        fireStorage: gh<_i10.FirebaseStorage>(),
      ));
  gh.factory<_i12.HttpClient>(() => _i12.HttpClient(
        dio: gh<_i10.Dio>(),
        authToken: gh<_i11.AuthToken>(),
      ));
  gh.factory<_i13.AuthDataSource>(() => _i14.AuthDataSourceImpl(
        firebaseAuth: gh<_i10.FirebaseAuth>(),
        http: gh<_i12.HttpClient>(),
      ));
  gh.factory<_i15.AuthRepository>(
      () => _i16.UserRepositoryImpl(authDataSource: gh<_i13.AuthDataSource>()));
  gh.factory<_i17.GetCurrentUserUseCase>(
      () => _i17.GetCurrentUserUseCase(repository: gh<_i15.AuthRepository>()));
  gh.factory<_i18.SignInUseCase>(
      () => _i18.SignInUseCase(repository: gh<_i15.AuthRepository>()));
  gh.factory<_i19.SplashController>(() => _i19.SplashController(
      getCurrentUserUseCase: gh<_i17.GetCurrentUserUseCase>()));
  gh.factory<_i20.LoginController>(
      () => _i20.LoginController(signInUseCase: gh<_i18.SignInUseCase>()));
  return getIt;
}

class _$RegisterModule extends _i21.RegisterModule {}
