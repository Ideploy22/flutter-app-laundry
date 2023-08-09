// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_LoginControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$canceledAtom =
      Atom(name: '_LoginControllerBase.canceled', context: context);

  @override
  bool get canceled {
    _$canceledAtom.reportRead();
    return super.canceled;
  }

  @override
  set canceled(bool value) {
    _$canceledAtom.reportWrite(value, super.canceled, () {
      super.canceled = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_LoginControllerBase.signIn', context: context);

  @override
  Future<void> signIn(
      {required String email,
      required String password,
      required void Function(UserEntity) onSuccess}) {
    return _$signInAsyncAction.run(() =>
        super.signIn(email: email, password: password, onSuccess: onSuccess));
  }

  late final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase', context: context);

  @override
  void cancelLogin() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.cancelLogin');
    try {
      return super.cancelLogin();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
