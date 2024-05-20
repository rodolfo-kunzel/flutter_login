import 'package:flutter_login/domain/repository/user_repository.dart';

abstract class LoginUseCase {
  Future<String> call({required String email, required String password});
}

class LoginUseCaseImpl implements LoginUseCase {
  final UserRepository userRepository;

  LoginUseCaseImpl({required this.userRepository});

  @override
  Future<String> call({required String email, required String password}) {
    return userRepository.signIn(email: email, password: password);
  }
}
