import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_login/presentation/initial/page/initial_page.dart';
import 'package:flutter_login/presentation/login/page/login_page.dart';
import 'package:flutter_login/presentation/register/page/register_page.dart';
import 'package:flutter_login/presentation/starting/page/starting_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const StartingPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case '/initial':
        final userId =
            Random().nextInt(12) + 1; //Gerando uma id válida da API aleatória
        return MaterialPageRoute(builder: (_) => InitialPage(userId: userId));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
