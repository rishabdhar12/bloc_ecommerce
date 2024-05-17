import 'package:bloc_ecommerce/core/dto/registration_params.dart';

abstract class RemoteRegisterEvent {
  const RemoteRegisterEvent();
}

class UserRegister extends RemoteRegisterEvent {
  final RegistrationParams registrationParams;

  const UserRegister({required this.registrationParams});
}

class CheckUser extends RemoteRegisterEvent {}
