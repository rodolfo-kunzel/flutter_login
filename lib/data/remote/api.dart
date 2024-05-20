import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_login/core/errors/custom_exceptions.dart';
import 'package:flutter_login/core/utils/error_handlers/dio_error_handler.dart';
import 'package:flutter_login/data/dto/user_dto.dart';
import 'package:flutter_login/core/utils/constants/app_constansts.dart';

abstract class Api {
  Future<String> signIn({required String email, required String password});
  Future<String> register({required String email, required String password});
  Future<void> logout();
  Future<UserDto> getUser({required int id});
}

class ApiImplementation implements Api {
  final Dio dio;

  ApiImplementation({Dio? dio}) : dio = dio ?? Dio();

  @override
  Future<UserDto> getUser({required int id}) async {
    try {
      final Response<Map<String, dynamic>> request =
          await dio.get('$kBaseUrl/users/$id');

      if (request.statusCode != 200 || request.data == null) {
        throw Exception('$kRequestFailedStatusCode ${request.statusCode}');
      }

      final user = UserDto.fromJson(request.data!['data']);
      return user;
    } on DioException catch (dioException) {
      final errorMessage = DioErrorHandler.handle(dioException);
      throw NetworkException(errorMessage);
    } catch (e) {
      final errorMessage = '$kErrorOccurred ${e.toString()}';
      log(errorMessage);
      throw UnknownException(errorMessage);
    }
  }

  @override
  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      final response = await dio.post('$kBaseUrl/$kSignInEndpoint', data: {
        'email': email,
        'password': password,
      });

      final String id = response.data['id'];

      if (id.isEmpty) throw AuthenticationException;

      return id;
    } on DioException catch (dioException) {
      final errorMessage = DioErrorHandler.handle(dioException);
      throw NetworkException(errorMessage);
    } catch (e) {
      final errorMessage = '$kErrorOccurred ${e.toString()}';
      log(errorMessage);
      throw AuthenticationException('Failed to sign in: ${e.toString()}');
    }
  }

  @override
  Future<String> register(
      {required String email, required String password}) async {
    try {
      final response = await dio.post('$kBaseUrl/register', data: {
        'email': email,
        'password': password,
      });

      final String token = response.data['token'];

      if (token.isEmpty) throw AuthenticationException;

      return token;
    } on DioException catch (dioException) {
      final errorMessage = DioErrorHandler.handle(dioException);
      throw NetworkException(errorMessage);
    } catch (e) {
      final errorMessage = '$kErrorOccurred ${e.toString()}';
      log(errorMessage);
      throw AuthenticationException('Failed to sign in: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await dio.post('$kBaseUrl/logout');
    } on DioException catch (dioException) {
      final errorMessage = DioErrorHandler.handle(dioException);
      throw NetworkException(errorMessage);
    } catch (e) {
      final errorMessage = '$kErrorOccurred ${e.toString()}';
      log(errorMessage);
      throw ServerException('Failed to sign in: ${e.toString()}');
    }
  }
}
