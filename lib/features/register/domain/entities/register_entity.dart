import 'package:bloc_ecommerce/features/profile/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class RegistrationEntity extends Equatable {
  final String status;
  final String message;
  final UserEntity user;

  const RegistrationEntity({
    required this.status,
    required this.message,
    required this.user,
  });

  @override
  List<Object?> get props => [status, message, user];
}
