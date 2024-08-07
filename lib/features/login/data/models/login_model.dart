import 'package:bloc_ecommerce/features/login/domain/entities/login_entity.dart';
import 'package:bloc_ecommerce/features/profile/data/models/user_model.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.status,
    required super.message,
    required super.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        user: UserModel.fromJson(json["user"]),
      );
}
