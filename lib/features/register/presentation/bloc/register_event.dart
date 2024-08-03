import 'package:bloc_ecommerce/features/register/dto/registration_params.dart';

abstract class RemoteRegisterEvent {
  const RemoteRegisterEvent();
}

class UserRegister extends RemoteRegisterEvent {
  final RegistrationParams registrationParams;

  const UserRegister({required this.registrationParams});
}
