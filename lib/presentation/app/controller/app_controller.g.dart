// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppController on _AppControllerBase, Store {
  late final _$languageAtom =
      Atom(name: '_AppControllerBase.language', context: context);

  @override
  Language get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(Language value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_AppControllerBase.user', context: context);

  @override
  UserEntity? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserEntity? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$initializeAppAsyncAction =
      AsyncAction('_AppControllerBase.initializeApp', context: context);

  @override
  Future<void> initializeApp({UserEntity? user}) {
    return _$initializeAppAsyncAction
        .run(() => super.initializeApp(user: user));
  }

  late final _$changeLanguageAsyncAction =
      AsyncAction('_AppControllerBase.changeLanguage', context: context);

  @override
  Future<void> changeLanguage(Language value) {
    return _$changeLanguageAsyncAction.run(() => super.changeLanguage(value));
  }

  late final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase', context: context);

  @override
  void setUser(UserEntity value) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
