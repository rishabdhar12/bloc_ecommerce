import 'package:bloc_ecommerce/features/profile/data/models/user_model.dart';
import 'package:bloc_ecommerce/features/register/domain/entities/register_entity.dart';

class RegistrationModel extends RegistrationEntity {
  const RegistrationModel({
    required super.status,
    required super.message,
    required super.user,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        status: json["status"],
        message: json["message"],
        user: UserModel.fromJson(json["user"]),
      );
}
