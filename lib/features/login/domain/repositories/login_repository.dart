import 'package:bloc_ecommerce/core/errors/failure.dart';
import 'package:bloc_ecommerce/features/login/domain/entities/login_entity.dart';
import 'package:bloc_ecommerce/features/login/dto/login_params.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> login(LoginParams loginParams);
}
