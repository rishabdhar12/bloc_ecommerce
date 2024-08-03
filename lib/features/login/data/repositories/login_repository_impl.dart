import 'package:bloc_ecommerce/core/errors/error_handler.dart';
import 'package:bloc_ecommerce/core/errors/failure.dart';
import 'package:bloc_ecommerce/features/login/data/datasource/login_datasource.dart';
import 'package:bloc_ecommerce/features/login/domain/entities/login_entity.dart';
import 'package:bloc_ecommerce/features/login/domain/repositories/login_repository.dart';
import 'package:bloc_ecommerce/features/login/dto/login_params.dart';
import 'package:fpdart/fpdart.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApiService _loginApiService;

  LoginRepositoryImpl(this._loginApiService);

  @override
  Future<Either<Failure, LoginEntity>> login(LoginParams loginParams) async {
    try {
      final response = await _loginApiService.login(loginParams.toJson());
      return right(response);
    } catch (error) {
      return left(ErrorHandler.handle(error).failure);
    }
  }
}
