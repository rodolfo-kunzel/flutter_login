import 'dart:developer';

import 'package:flutter_login/core/errors/custom_exceptions.dart';
import 'package:flutter_login/core/utils/constants/app_constansts.dart';

class ErrorHandler {
  static String handle(Exception e) {
    if (e is NetworkException) {
      log('$kNetworkError ${e.message}');
      return kCheckInternetConnection;
    } else if (e is ServerException) {
      log('$kServerError ${e.message}');
      return kServerUserError;
    } else if (e is AuthenticationException) {
      log('$kAuthenticationError ${e.message}');
      return kInvalidCredentials;
    } else {
      log('$kUnknownError ${e.toString()}');
      return kUnexpectedError;
    }
  }
}
