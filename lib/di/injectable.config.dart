// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_plugin_pos_integration/export.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:ideploy_package/domain/use_cases/db/get_language_usecase.dart'
    as _i5;
import 'package:ideploy_package/domain/use_cases/db/set_language_usecase.dart'
    as _i4;
import 'package:ideploy_package/ideploy_package.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;
import 'package:permission_handler/permission_handler.dart' as _i9;

import '../data/clients/auth_token.dart' as _i12;
import '../data/clients/http_client.dart' as _i13;
import '../data/clients/rsa_client.dart' as _i10;
import '../data/clients/third_modules.dart' as _i22;
import '../data/data_sources/auth/auth_datasource.dart' as _i14;
import '../data/data_sources/auth/auth_datasource_impl.dart' as _i15;
import '../data/repositories/auth/auth_repository_impl.dart' as _i17;
import '../domain/entities/permissions/permissions.dart' as _i8;
import '../domain/repositories/auth/auth_repository.dart' as _i16;
import '../domain/use_cases/auth/get_current_user.dart' as _i18;
import '../domain/use_cases/auth/sing_in.dart' as _i19;
import '../presentation/app/controller/app_controller.dart' as _i3;
import '../presentation/configuration/controller/configuration_controller.dart'
    as _i6;
import '../presentation/login/controller/login_controller.dart' as _i21;
import '../presentation/spash/controller/splash_controller.dart' as _i20;

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
  gh.factory<_i6.ConfigurationController>(() => _i6.ConfigurationController());
  gh.factory<_i7.FlutterPluginPosIntegration>(() => registerModule.posPlugin);
  gh.factory<Map<_i8.PermissionsType, _i9.Permission>>(
      () => registerModule.permissions);
  gh.factory<_i10.RSAClient>(
      () => _i10.RSAClient(secureStorage: gh<_i11.FlutterSecureStorage>()));
  gh.factory<_i12.AuthToken>(() => _i12.AuthToken(
        hive: gh<_i11.HiveInterface>(),
        firebaseAuth: gh<_i11.FirebaseAuth>(),
        rsaClient: gh<_i10.RSAClient>(),
        secureStorage: gh<_i11.FlutterSecureStorage>(),
        fireStorage: gh<_i11.FirebaseStorage>(),
      ));
  gh.factory<_i13.HttpClient>(() => _i13.HttpClient(
        dio: gh<_i11.Dio>(),
        authToken: gh<_i12.AuthToken>(),
      ));
  gh.factory<_i14.AuthDataSource>(() => _i15.AuthDataSourceImpl(
        firebaseAuth: gh<_i11.FirebaseAuth>(),
        http: gh<_i13.HttpClient>(),
      ));
  gh.factory<_i16.AuthRepository>(
      () => _i17.UserRepositoryImpl(authDataSource: gh<_i14.AuthDataSource>()));
  gh.factory<_i18.GetCurrentUserUseCase>(
      () => _i18.GetCurrentUserUseCase(repository: gh<_i16.AuthRepository>()));
  gh.factory<_i19.SignInUseCase>(
      () => _i19.SignInUseCase(repository: gh<_i16.AuthRepository>()));
  gh.factory<_i20.SplashController>(() => _i20.SplashController(
      getCurrentUserUseCase: gh<_i18.GetCurrentUserUseCase>()));
  gh.factory<_i21.LoginController>(
      () => _i21.LoginController(signInUseCase: gh<_i19.SignInUseCase>()));
  return getIt;
}

class _$RegisterModule extends _i22.RegisterModule {}
