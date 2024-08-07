import 'dart:developer';

import 'package:bloc_ecommerce/features/register/domain/usecases/register_usecase.dart';
import 'package:bloc_ecommerce/features/register/presentation/bloc/register_event.dart';
import 'package:bloc_ecommerce/features/register/presentation/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteRegisterBloc
    extends Bloc<RemoteRegisterEvent, RemoteRegisterState> {
  final RegisterUsecase _registerUsecase;

  RemoteRegisterBloc(this._registerUsecase) : super(RegisterInitialState()) {
    on<UserRegister>(onRegisterUser);
  }

  void onRegisterUser(
      UserRegister event, Emitter<RemoteRegisterState> emit) async {
    emit(const RegisterLoadingState());

    final response = await _registerUsecase(event.registrationParams);
    response.fold(
      (failure) {
        log(failure.message);
        emit(RegisterErrorState(failure.message));
      },
      (success) => emit(RegisterFinishedState(success)),
    );
  }
}
