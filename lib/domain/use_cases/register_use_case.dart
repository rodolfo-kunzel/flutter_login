import 'package:flutter_login/domain/repository/user_repository.dart';

abstract class RegisterUseCase {
  Future<String> call({required String email, required String password});
}

class RegisterUseCaseImpl implements RegisterUseCase {
  final UserRepository userRepository;

  RegisterUseCaseImpl({required this.userRepository});

  @override
  Future<String> call({required String email, required String password}) {
    return userRepository.register(email: email, password: password);
  }
}
