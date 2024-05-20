import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_login/core/utils/constants/app_constansts.dart';

class DioErrorHandler {
  static String handle(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return kConnectionTimeout;
      case DioExceptionType.sendTimeout:
        return kSendTimeout;
      case DioExceptionType.badResponse:
        log('$kResponseData ${dioException.response?.data}');
        return '$kInvalidStatusCode: ${dioException.response?.statusCode}';
      case DioExceptionType.cancel:
        return kRequestCancelled;
      case DioExceptionType.unknown:
      default:
        return '$kRequestFailed ${dioException.message}';
    }
  }
}
