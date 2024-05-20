import 'package:flutter_login/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUser(int id);
  Future<String> register({required String email, required String password});
  Future<String> signIn({required String email, required String password});
  Future<void> logout();
}