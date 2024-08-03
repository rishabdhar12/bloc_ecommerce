import 'package:bloc_ecommerce/core/errors/error_handler.dart';
import 'package:bloc_ecommerce/core/errors/failure.dart';
import 'package:bloc_ecommerce/features/register/data/datasources/remote/register_datasource.dart';
import 'package:bloc_ecommerce/features/register/domain/entities/register_entity.dart';
import 'package:bloc_ecommerce/features/register/domain/repositories/register_repository.dart';
import 'package:bloc_ecommerce/features/register/dto/registration_params.dart';
import 'package:fpdart/fpdart.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterApiService _registerApiService;

  RegisterRepositoryImpl(this._registerApiService);
  @override
  Future<Either<Failure, RegistrationEntity>> register(
      RegistrationParams registrationParams) async {
    try {
      final response =
          await _registerApiService.register(registrationParams.toJson());
      return right(response);
    } catch (error) {
      return left(ErrorHandler.handle(error).failure);
    }
  }
}
