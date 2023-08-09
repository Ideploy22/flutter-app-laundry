import 'package:app_laundry/domain/entities/user/user_entity.dart';
import 'package:app_laundry/domain/repositories/auth/auth_repository.dart';
import 'package:ideploy_package/ideploy_package.dart';

@injectable
class SignInUseCase {
  final AuthRepository _repository;

  SignInUseCase({required AuthRepository repository})
      : _repository = repository;

  Future<EitherOf<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return _repository.signIn(email: email, password: password);
  }
}
