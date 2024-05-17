import 'package:bloc_ecommerce/core/constants/strings.dart';
import 'package:bloc_ecommerce/features/register/data/models/register_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/retrofit.dart';

part "register_datasource.g.dart";

String baseUrlPath = dotenv.env['BASE_URL']!;

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class RegisterApiService {
  factory RegisterApiService(Dio dio) = _RegisterApiService;

  @POST('auth/login')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<RegistrationModel> register(
      @Body() Map<String, dynamic> registerParams);
}
