import 'package:bloc_ecommerce/features/login/domain/entities/login_entity.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteLoginState extends Equatable {
  final LoginEntity? loginEntity;

  const RemoteLoginState({this.loginEntity});

  @override
  List<Object> get props => [loginEntity!];
}

class LoginInitialState extends RemoteLoginState {}

class LoginLoadingState extends RemoteLoginState {
  const LoginLoadingState();
}

class LoginFinishedState extends RemoteLoginState {
  const LoginFinishedState(LoginEntity loginEntity)
      : super(loginEntity: loginEntity);
}

class LoginErrorState extends RemoteLoginState {
  final String message;
  const LoginErrorState(this.message);
}
