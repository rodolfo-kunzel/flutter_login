import 'package:flutter_login/domain/entities/user.dart';
import 'package:flutter_login/domain/repository/user_repository.dart';

abstract class GetUserInfoUseCase {
  Future<User> call(int id);
}

class GetUserInfoUseCaseImpl implements GetUserInfoUseCase {
  final UserRepository userRepository;

  GetUserInfoUseCaseImpl({required this.userRepository});

  @override
  Future<User> call(int id) {
    return userRepository.getUser(id);
  }
}
