part of 'initial_bloc.dart';

enum InitialStatus { loading, loaded, failure, loggedOut }

class InitialState extends Equatable {
  final InitialStatus status;
  final User? user;
  final String error;

  const InitialState._({
    this.status = InitialStatus.loading,
    this.user,
    this.error = '',
  });

  const InitialState.loading() : this._();

  const InitialState.loaded(User? user) : this._(status: InitialStatus.loaded, user: user);

  const InitialState.failure(String error) : this._(status: InitialStatus.failure, error: error);

  const InitialState.loggedOut() : this._(status: InitialStatus.loggedOut);

  @override
  List<Object?> get props => [status, user, error];
}
