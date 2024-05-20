import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_login/core/utils/error_handlers/error_handler.dart';
import 'package:flutter_login/domain/use_cases/register_use_case.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc({required this.registerUseCase}) : super(const RegisterState.initial()) {
    on<RegisterRequested>(_onRegisterRequested);
  }

  Future<void> _onRegisterRequested(RegisterRequested event, Emitter<RegisterState> emit) async {
    emit(const RegisterState.loading());
    try {
      final token = await registerUseCase.call(email: event.email, password: event.password);
      emit(RegisterState.success(token));
    } catch (e) {
       emit(RegisterState.failure(ErrorHandler.handle(e as Exception)));
    }
  }
}