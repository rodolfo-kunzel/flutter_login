import 'package:flutter/material.dart';
import 'package:flutter_login/core/routes/app_router.dart';
import 'package:flutter_login/core/service_locator.dart';
import 'package:flutter_login/core/theme/bloc/theme_bloc.dart';
import 'package:flutter_login/core/theme/bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ThemeBloc>(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter App',
            theme: state.themeData,
            initialRoute: '/',
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
