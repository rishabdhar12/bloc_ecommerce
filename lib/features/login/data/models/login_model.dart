import 'package:bloc_ecommerce/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.accessToken,
    required super.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );
}
