import 'package:bloc_ecommerce/features/login/domain/usecase/login_usecase.dart';
import 'package:bloc_ecommerce/features/login/presentation/blocs/login_event.dart';
import 'package:bloc_ecommerce/features/login/presentation/blocs/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteLoginBloc extends Bloc<RemoteLoginEvent, RemoteLoginState> {
  final LoginUsecase _loginUsecase;

  RemoteLoginBloc(this._loginUsecase) : super(LoginInitialState()) {
    on<UserLogin>(onLoginUser);
  }

  void onLoginUser(UserLogin event, Emitter<RemoteLoginState> emit) async {
    emit(const LoginLoadingState());

    final response = await _loginUsecase(event.loginParams);
    response.fold(
      (failure) => emit(LoginErrorState(failure.message)),
      (success) => emit(LoginFinishedState(success)),
    );
  }
}
