import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/core/service_locator.dart';
import 'package:flutter_login/core/utils/constants/app_constansts.dart';
import 'package:flutter_login/presentation/register/bloc/register_bloc.dart';
import 'package:flutter_login/presentation/widgets/agreement_text.dart';
import 'package:flutter_login/presentation/widgets/buttons/app_button.dart';
import 'package:flutter_login/presentation/widgets/custom_dialog.dart';
import 'package:flutter_login/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_login/presentation/widgets/default_page_layout.dart';
import 'package:flutter_login/presentation/widgets/buttons/return_button.dart';
import 'package:flutter_login/presentation/widgets/buttons/theme_toggle_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<RegisterBloc>(),
        child: const RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.failure) {
          CustomDialog.show(
            context,
            title: kRegisterError,
            message: state.error,
          );
        }
        if (state.status == RegisterStatus.success) {
          CustomDialog.show(
            context,
            title: kSuccess,
            message: kRegisterSuccessMessage,
          );
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          });
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
              Text(kRegister, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 24),
              CustomTextFormField.email(
                controller: emailController,
              ),
              const SizedBox(height: 8),
              CustomTextFormField.password(
                controller: passwordController,
              ),
              const SizedBox(height: 8),
              CustomTextFormField.password(
                labelText: kConfirmPassword,
                controller: confirmPasswordController,
              ),
              const SizedBox(height: 24),
              BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  return AppButton.filled(
                    onTap: () => _onRegister(),
                    text: kRegister,
                    isLoading: state.status == RegisterStatus.loading,
                  );
                },
              ),
              const SizedBox(height: 16),
              const AgreementText(),
            ],
          ),
        ),
      ),
    );
  }

  void _onRegister() {
    if (_formKey.currentState?.validate() ?? false) {
      if (passwordController.text == confirmPasswordController.text) {
        context.read<RegisterBloc>().add(
              RegisterRequested(
                email: emailController.text,
                password: passwordController.text,
              ),
            );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(kPasswordsDontmatch)),
        );
      }
    }
  }
}
