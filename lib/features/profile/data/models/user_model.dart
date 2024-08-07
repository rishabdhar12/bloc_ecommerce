import 'package:bloc_ecommerce/features/profile/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.username,
    required super.email,
    required super.password,
    required super.isAdmin,
    required super.name,
    required super.phoneNo,
    required super.otp,
    required super.id,
    required super.v,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        email: json["email"],
        password: json["password"] ?? "",
        isAdmin: json["isAdmin"],
        name: json["name"],
        phoneNo: json["phoneNo"],
        otp: json["otp"],
        id: json["_id"],
        v: json["__v"],
        token: json["token"] ?? "",
      );
}
