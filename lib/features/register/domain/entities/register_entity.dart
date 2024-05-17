import 'package:equatable/equatable.dart';

class RegistrationEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String role;
  final String avatar;
  final String password;

  const RegistrationEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.avatar,
    required this.password,
  });

  @override
  List<Object?> get props => [id, name, email, password, role, avatar];
}
