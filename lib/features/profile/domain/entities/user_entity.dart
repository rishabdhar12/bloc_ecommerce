import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String username;
  final String email;
  final String password;
  final bool isAdmin;
  final String name;
  final String phoneNo;
  final String otp;
  final String id;
  final int v;
  final String token;

  const UserEntity({
    required this.username,
    required this.email,
    required this.password,
    required this.isAdmin,
    required this.name,
    required this.phoneNo,
    required this.otp,
    required this.id,
    required this.v,
    required this.token,
  });

  @override
  List<Object> get props =>
      [username, email, password, isAdmin, name, phoneNo, otp, id, v, token];
}
