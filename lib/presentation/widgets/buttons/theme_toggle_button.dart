import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/core/theme/bloc/theme_bloc.dart';
import 'package:flutter_login/core/theme/bloc/theme_event.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.brightness_6,
        size: 40,
        color: Theme.of(context).iconTheme.color,
      ),
      onPressed: () {
        context.read<ThemeBloc>().add(ToggleThemeEvent());
      },
    );
  }
}
