import 'dart:async';

import 'package:app_laundry/domain/entities/user/user_entity.dart';
import 'package:ideploy_package/domain/entities/language/language.dart';
import 'package:ideploy_package/domain/use_cases/db/get_language_usecase.dart';
import 'package:ideploy_package/domain/use_cases/db/set_language_usecase.dart';
import 'package:ideploy_package/presentation/translate/translate.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

@singleton
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final SetLanguage _setLanguage;
  final GetLanguage _getLanguage;

  _AppControllerBase({
    required SetLanguage setLanguage,
    required GetLanguage getLanguage,
  })  : _setLanguage = setLanguage,
        _getLanguage = getLanguage;

  @observable
  Language language = Language.portuguese;

  @observable
  UserEntity? user;

  @action
  void setUser(UserEntity value) {
    user = value;
  }

  @action
  Future<void> initializeApp({UserEntity? user}) async {
    try {
      final Language language =
          _getLanguage().getOrElse(() => Language.portuguese);
      await changeLanguage(language);
      if (user != null) {
        setUser(user);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> changeLanguage(Language value) async {
    await I18nTranslate.refresh(value.locale);
    language = value;
    _setLanguage(value);
  }
}
