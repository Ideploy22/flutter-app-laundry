import 'dart:async';

import 'package:app_laundry/domain/entities/user/user_entity.dart';
import 'package:app_laundry/domain/use_cases/auth/sing_in.dart';
import 'package:ideploy_package/app_global.dart';
import 'package:ideploy_package/ideploy_package.dart';

part 'login_controller.g.dart';

@injectable
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final SignInUseCase _signInUseCase;

  _LoginControllerBase({required SignInUseCase signInUseCase})
      : _signInUseCase = signInUseCase;

  @observable
  bool loading = false;

  @observable
  bool canceled = false;

  void _clear() {
    loading = false;
    canceled = false;
  }

  void _startLoading() {
    loading = true;
  }

  void _stopLoading() {
    loading = false;
  }

  void _cancelLogin() {
    canceled = true;
  }

  @action
  Future<void> signIn({
    required String email,
    required String password,
    required void Function(UserEntity) onSuccess,
  }) async {
    _clear();
    _startLoading();
    final EitherOf<Failure, UserEntity> response = await _signInUseCase.call(
      email: email,
      password: password,
    );
    response.get(
      (Failure error) {
        AppGlobal.instance.streamError.add(error);
      },
      (UserEntity user) {
        if (!canceled) {
          onSuccess(user);
        }
      },
    );
    _stopLoading();
  }

  @action
  void cancelLogin() {
    _cancelLogin();
    _stopLoading();
  }
}
