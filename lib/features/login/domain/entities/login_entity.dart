import 'package:bloc_ecommerce/features/profile/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String status;
  final String message;
  final UserEntity user;

  const LoginEntity({
    required this.status,
    required this.message,
    required this.user,
  });

  @override
  List<Object?> get props => [status, message, user];
}
