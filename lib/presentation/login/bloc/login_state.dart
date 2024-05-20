part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final LoginStatus status;
  final String id;
  final String error;

  const LoginState._({
    this.status = LoginStatus.initial,
    this.id = '',
    this.error = '',
  });

  const LoginState.initial() : this._();

  const LoginState.loading() : this._(status: LoginStatus.loading);

  const LoginState.success(String id)
      : this._(status: LoginStatus.success, id: id);

  const LoginState.failure(String error)
      : this._(status: LoginStatus.failure, error: error);

  @override
  List<Object> get props => [status, id, error];
}
