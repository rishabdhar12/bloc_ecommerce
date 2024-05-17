import 'package:bloc_ecommerce/features/register/domain/entities/register_entity.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteRegisterState extends Equatable {
  final RegistrationEntity? registrationEntity;
  // final DioException? dioException;

  const RemoteRegisterState({this.registrationEntity});

  @override
  List<Object> get props => [registrationEntity!];
}

class RegisterInitialState extends RemoteRegisterState {}

class RegisterLoadingState extends RemoteRegisterState {
  const RegisterLoadingState();
}

class RegisterFinishedState extends RemoteRegisterState {
  const RegisterFinishedState(RegistrationEntity registrationEntity)
      : super(registrationEntity: registrationEntity);
}

class RegisterErrorState extends RemoteRegisterState {
  final String message;
  const RegisterErrorState(this.message);
}
