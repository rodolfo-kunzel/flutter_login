import 'package:flutter_login/core/utils/error_handlers/error_handler.dart';
import 'package:flutter_login/data/remote/api.dart';
import 'package:flutter_login/domain/entities/user.dart';
import 'package:flutter_login/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final Api api;

  UserRepositoryImpl({required this.api});

  @override
  Future<User> getUser(int id) async {
    try {
      final userDto = await api.getUser(id: id);
      return User(
        id: userDto.id,
        email: userDto.email,
        firstName: userDto.firstName,
        lastName: userDto.lastName,
        avatar: userDto.avatar,
      );
    } catch (e) {
      throw Exception(ErrorHandler.handle(e as Exception));
    }
  }

  @override
  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      final response = await api.signIn(email: email, password: password);
      return response;
    } catch (e) {
      throw Exception(ErrorHandler.handle(e as Exception));
    }
  }

  @override
  Future<String> register(
      {required String email, required String password}) async {
    try {
      final response = await api.register(email: email, password: password);
      return response;
    } catch (e) {
      throw Exception(ErrorHandler.handle(e as Exception));
    }
  }

  @override
  Future<void> logout() async {
    try {
      await api.logout();
    } catch (e) {
      throw Exception(ErrorHandler.handle(e as Exception));
    }
  }
}
