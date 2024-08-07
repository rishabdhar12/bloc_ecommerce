import 'package:bloc_ecommerce/core/constants/strings.dart';
import 'package:bloc_ecommerce/features/register/data/models/register_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part "register_datasource.g.dart";

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class RegisterApiService {
  factory RegisterApiService(Dio dio) = _RegisterApiService;

  @POST('/user/register')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<RegistrationModel> register(
      @Body() Map<String, dynamic> registerParams);
}
