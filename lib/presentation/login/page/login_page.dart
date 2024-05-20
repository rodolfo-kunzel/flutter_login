import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/core/service_locator.dart';
import 'package:flutter_login/core/utils/constants/app_constansts.dart';
import 'package:flutter_login/presentation/login/bloc/login_bloc.dart';
import 'package:flutter_login/presentation/widgets/buttons/app_button.dart';
import 'package:flutter_login/presentation/widgets/custom_dialog.dart';
import 'package:flutter_login/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_login/presentation/widgets/default_page_layout.dart';
import 'package:flutter_login/presentation/widgets/buttons/return_button.dart';
import 'package:flutter_login/presentation/widgets/buttons/theme_toggle_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<LoginBloc>(),
        child: const LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.failure) {
          CustomDialog.show(
            context,
            title: kLoginError,
            message: state.error,
          );
        }
        if (state.status == LoginStatus.success) {
          Navigator.pushNamed(context, '/initial', arguments: state.id);
        }
        if (state.status == LoginStatus.loading) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      child: DefaultPageLayout(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ThemeToggleButton(),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  const ReturnButton(),
                  const Spacer(),
                  Hero(
                    tag: kHeroTag,
                    child: Image.asset(
                      kLogoPath,
                      scale: 3,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(kLogin, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 24),
              CustomTextFormField.email(controller: emailController),
              const SizedBox(height: 8),
              CustomTextFormField.password(
                  controller: passwordController),
              const SizedBox(height: 24),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return AppButton.filled(
                    onTap: () => _onLogin(),
                    text: kLogin,
                    isLoading: state.status == LoginStatus.loading,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginBloc>().add(
            LoginRequested(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
    }
  }
}
