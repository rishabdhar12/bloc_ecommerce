import 'package:bloc_ecommerce/core/constants/strings.dart';
import 'package:bloc_ecommerce/features/login/data/models/login_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'login_datasource.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @GET("/user/login")
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<LoginModel> login(@Body() Map<String, dynamic> loginParams);
}
