import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_login/core/utils/error_handlers/error_handler.dart';
import 'package:flutter_login/domain/use_cases/login_use_case.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(const LoginState.initial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<LoginState> emit) async {
    emit(const LoginState.loading());
    try {
      final id = await loginUseCase.call(email: event.email, password: event.password);
      emit(LoginState.success(id));
    } catch (e) {
      emit(LoginState.failure(ErrorHandler.handle(e as Exception)));
    }
  }
}
