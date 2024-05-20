part of 'initial_bloc.dart';

sealed class InitialEvent extends Equatable {
  const InitialEvent();

  @override
  List<Object> get props => [];
}

final class LoadUserInfo extends InitialEvent {
  final int userId;

  const LoadUserInfo(this.userId);

  @override
  List<Object> get props => [userId];
}


final class LogoutRequested extends InitialEvent {}
