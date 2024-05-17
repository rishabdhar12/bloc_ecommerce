import 'package:bloc_ecommerce/features/register/domain/entities/register_entity.dart';

class RegistrationModel extends RegistrationEntity {
  const RegistrationModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
    required super.avatar,
    required super.password,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        avatar: json["avatar"],
        password: json["password"],
      );
}
