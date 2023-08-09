import 'package:app_laundry/domain/entities/user/user_entity.dart';
import 'package:app_laundry/domain/repositories/auth/auth_repository.dart';
import 'package:ideploy_package/ideploy_package.dart';

@injectable
class GetCurrentUserUseCase {
  final AuthRepository _repository;

  GetCurrentUserUseCase({required AuthRepository repository})
      : _repository = repository;

  Future<EitherOf<Failure, UserEntity?>> call() {
    return _repository.initializeUser();
  }
}
