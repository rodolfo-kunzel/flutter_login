import 'package:flutter/material.dart';

// Base URL
const String kBaseUrl = 'https://reqres.in/api';

// Endpoints
const String kRegisterEndpoint = 'register';
const String kSignInEndpoint = 'singin';
const String kLoginEndpoint = 'login';
const String kUserEndpoint = 'users';
const String kUserLogout = 'logout';

// Headers
const String kApplicationJson = 'application/json';
const String kContentType = 'Content-Type';

//Hero Tag
const String kHeroTag = 'HeroLogo';

//Images Path
const String kLogoPath = 'assets/image/tecnofit_logo.png';
const String kBackIcon = 'assets/image/back_arrow.svg';

//Images App Text
const String kConfirmPassword = 'Confirmar senha';
const String kRegister = 'Registro';
const String kPassword = 'Senha';
const String kLogin = 'Log in';
const String kEmail = 'E-mail';

// Error Messages
const String kRequestFailedStatusCode = 'Request failed with status: ';
const String kInvalidStatusCode = 'Received invalid status code';
const String kConnectionTimeout = 'Connection timeout occurred';
const String kAuthenticationError = 'Authentication error:';
const String kReceiveTimeout = 'Receive timeout occurred';
const String kRequestCancelled = 'Request was cancelled';
const String kSendTimeout = 'Send timeout occurred';
const String kRequestFailed = 'Request failed';
const String kMissingFields = 'Missing Fields';
const String kResponseData = 'Response data: ';
const String kNetworkError = 'Network error:';
const String kUnknownError = 'Unknown error:';
const String kTokenIsNull = 'Token is null';
const String kServerError = 'Server error:';

// User Messages
const String kServerUserError =
    'O servidor está indisponível no momento. Por favor, tente novamente mais tarde.';
const String kCheckInternetConnection =
    'Por favor, verifique sua conexão com a internet e tente novamente.';
const String kInvalidCredentials =
    'Credenciais inválidas. Por favor, verifique seu email e senha.';
const String kUnexpectedError =
    'Ocorreu um erro inesperado. Por favor, tente novamente.';
const String kPasswordMinCaracters = 'Senha deve ter pelo menos 6 caractéres';
const String kRegisterSuccessMessage = 'Usuário foi registrado com sucesso';
const String kUserInfoUnavailable = 'Informação do usuário indisponiel';
const String kEnterValidEmail = 'Por favor, insira um e-mail válido';
const String kPasswordsDontmatch = 'Senhas estão diferentes';
const String kEnterPassword = 'Por favor, insira a senha';
const String kEnterEmail = 'Por favor, insira o e-mail';
const String kRegisterError = 'Erro no registro';
const String kLoginError = 'Erro no login';
const String kSuccess = 'Sucesso';
const String kOk = 'Ok';

// Logging
const String kErrorOccurred = 'An error occurred: ';

// App Colors Light Theme
const Color kLightScaffoldBackgroundColor = Color(0xFFFFFFFF);
const Color kLightDialogBackgroundColor = Color(0xFFFFFFFF);
const Color klightHeadlineTextColor = Color(0xFF232823);
const Color kLightAppBarThemeColor = Color(0xFF232823);
const Color kLightTitleTextColor = Color(0xFF9B51E0);
const Color klightBodyTextColor = Color(0xFFFFFFFF);
const Color kLightAppIconColor = Color(0xFF232823);
const Color kLightButtomColor = Color(0xFF232823);
const Color kLightBorderColor = Color(0xFF232823);
const Color kLightFocusColor = Color(0xFF9B51E0);
const Color kLightFocusText = Color(0xFF9B51E0);

const int kLightPrimaryColor = 0xFF232823;
MaterialColor kLightSwatch =
    MaterialColor(kLightPrimaryColor, getColorSwatch(kLightPrimaryColor));

// App Colors Dark Theme
const Color kDarkScaffoldBackgroundColor = Color(0xFF232823);
const Color kDarkDialogBackgroundColor = Color(0xFF232823);
const Color klightDisplayMediumColor = Color(0xFFFFFFFF);
const Color kDarkHeadlineTextColor = Color(0xFF232823);
const Color kDarkAppBarThemeColor = Color(0xFFF5EB64);
const Color kDarkTitleTextColor = Color(0xFFF5EB64);
const Color kDarkBodyTextColor = Color(0xFF232823);
const Color kDarkAppIconColor = Color(0xFFF5EB64);
const Color kDarkButtomColor = Color(0xFFF5EB64);
const Color kDarkBorderColor = Color(0xFFF5EB64);
const Color kDarkFocusColor = Color(0xFFF5EB64);
const Color kDarkFocusText = Color(0xFFF5EB64);

const int kDarkPrimaryColor = 0xFFF5EB64;
MaterialColor kDarkSwatch =
    MaterialColor(kDarkPrimaryColor, getColorSwatch(kDarkPrimaryColor));

Map<int, Color> getColorSwatch(int primaryValue) {
  return {
    50: Color(primaryValue).withOpacity(0.1),
    100: Color(primaryValue).withOpacity(0.2),
    200: Color(primaryValue).withOpacity(0.3),
    300: Color(primaryValue).withOpacity(0.4),
    400: Color(primaryValue).withOpacity(0.5),
    500: Color(primaryValue).withOpacity(0.6),
    600: Color(primaryValue).withOpacity(0.7),
    700: Color(primaryValue).withOpacity(0.8),
    800: Color(primaryValue).withOpacity(0.9),
    900: Color(primaryValue).withOpacity(1.0),
  };
}

// App Generic Colors
const Color kErrorColor = Color.fromARGB(255, 247, 78, 78);
