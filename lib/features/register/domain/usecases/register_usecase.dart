import 'package:bloc_ecommerce/core/dto/registration_params.dart';
import 'package:bloc_ecommerce/core/errors/failure.dart';
import 'package:bloc_ecommerce/core/usecase/usecase.dart';
import 'package:bloc_ecommerce/features/register/domain/entities/register_entity.dart';
import 'package:bloc_ecommerce/features/register/domain/repositories/register_repository.dart';
import 'package:fpdart/fpdart.dart';

class RegisterUsecase
    extends BaseUsecase<RegistrationEntity, RegistrationParams> {
  final RegisterRepository _registerRepository;

  RegisterUsecase(this._registerRepository);

  @override
  Future<Either<Failure, RegistrationEntity>> call(
      RegistrationParams params) async {
    return await _registerRepository.register(params);
  }
}
