import 'package:bloc_ecommerce/core/errors/failure.dart';
import 'package:bloc_ecommerce/features/register/domain/entities/register_entity.dart';
import 'package:bloc_ecommerce/features/register/dto/registration_params.dart';
import 'package:fpdart/fpdart.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegistrationEntity>> register(
      RegistrationParams registrationParams);
}
