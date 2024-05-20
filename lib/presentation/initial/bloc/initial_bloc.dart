import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_login/core/utils/error_handlers/error_handler.dart';
import 'package:flutter_login/domain/entities/user.dart';
import 'package:flutter_login/domain/use_cases/get_user_info_use_case.dart';
import 'package:flutter_login/domain/use_cases/logout_use_case.dart';

part 'initial_event.dart';
part 'initial_state.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  final GetUserInfoUseCase getUserInfoUseCase;
  final LogoutUseCase logoutUseCase;

  InitialBloc({required this.getUserInfoUseCase, required this.logoutUseCase})
      : super(const InitialState.loading()) {
    on<LoadUserInfo>(_onLoadUserInfo);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoadUserInfo(
      LoadUserInfo event, Emitter<InitialState> emit) async {
    try {
      final user = await getUserInfoUseCase.call(event.userId);
      emit(InitialState.loaded(user));
    } catch (e) {
      emit(InitialState.failure(ErrorHandler.handle(e as Exception)));
    }
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<InitialState> emit) async {
    try {
      await logoutUseCase.call();
      emit(const InitialState.loggedOut());
    } catch (e) {
      emit(InitialState.failure(ErrorHandler.handle(e as Exception)));
    }
  }
}
