import 'package:bloc_ecommerce/core/errors/failure.dart';
import 'package:bloc_ecommerce/core/usecase/usecase.dart';
import 'package:bloc_ecommerce/features/login/domain/entities/login_entity.dart';
import 'package:bloc_ecommerce/features/login/domain/repositories/login_repository.dart';
import 'package:bloc_ecommerce/features/login/dto/login_params.dart';
import 'package:fpdart/fpdart.dart';

class LoginUsecase extends BaseUsecase<LoginEntity, LoginParams> {
  final LoginRepository _loginRepository;

  LoginUsecase(this._loginRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(LoginParams params) async {
    return await _loginRepository.login(params);
  }
}
