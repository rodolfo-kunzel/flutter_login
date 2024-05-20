import 'package:flutter/material.dart';
import 'package:flutter_login/core/utils/constants/app_constansts.dart';
import 'package:flutter_login/presentation/widgets/buttons/app_button.dart';
import 'package:flutter_login/presentation/widgets/buttons/theme_toggle_button.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ThemeToggleButton(),
                const Spacer(),
                Hero(
                  tag: kHeroTag,
                  child: Image.asset(
                    kLogoPath,
                    fit: BoxFit.contain,
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppButton.outlined(
                            onTap: () => Navigator.pushNamed(context, '/login'),
                            text: kLogin,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AppButton.filled(
                            onTap: () =>
                                Navigator.pushNamed(context, '/register'),
                            text: kRegister,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
