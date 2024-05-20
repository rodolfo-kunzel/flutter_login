part of 'register_bloc.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  final RegisterStatus status;
  final String token;
  final String error;

  const RegisterState._({
    this.status = RegisterStatus.initial,
    this.token = '',
    this.error = '',
  });

  const RegisterState.initial() : this._();

  const RegisterState.loading() : this._(status: RegisterStatus.loading);

  const RegisterState.success(String token) : this._(status: RegisterStatus.success, token: token);

  const RegisterState.failure(String error) : this._(status: RegisterStatus.failure, error: error);

  @override
  List<Object> get props => [status, token, error];
}
