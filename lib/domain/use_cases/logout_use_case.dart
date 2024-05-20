import 'package:flutter_login/domain/repository/user_repository.dart';

abstract class LogoutUseCase {
  Future<void> call();
}

class LogoutUseCaseImpl implements LogoutUseCase {
  final UserRepository userRepository;

  LogoutUseCaseImpl({required this.userRepository});

  @override
  Future<void> call() {
    return userRepository.logout();
  }
}

