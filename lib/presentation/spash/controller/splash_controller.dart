import 'package:app_laundry/domain/entities/user/user_entity.dart';
import 'package:app_laundry/domain/use_cases/auth/get_current_user.dart';
import 'package:ideploy_package/app_global.dart';
import 'package:ideploy_package/ideploy_package.dart';

part 'splash_controller.g.dart';

@injectable
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  _SplashControllerBase({required GetCurrentUserUseCase getCurrentUserUseCase})
      : _getCurrentUserUseCase = getCurrentUserUseCase;

  @action
  Future<void> initializeUser({
    required void Function(UserEntity) onUserLogged,
    required void Function() onUserNotLogged,
  }) async {
    final EitherOf<Failure, UserEntity?> response =
        await _getCurrentUserUseCase.call();
    response.get(
      (Failure failure) {
        AppGlobal.instance.streamError.add(failure);
        onUserNotLogged();
      },
      (UserEntity? user) {
        if (user != null) {
          onUserLogged(user);
        } else {
          onUserNotLogged();
        }
      },
    );
  }
}
