import 'package:bloc_ecommerce/core/dto/login_params.dart';

abstract class RemoteLoginEvent {
  const RemoteLoginEvent();
}

class UserLogin extends RemoteLoginEvent {
  final LoginParams loginParams;

  const UserLogin({required this.loginParams});
}
