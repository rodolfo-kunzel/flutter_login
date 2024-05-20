import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/core/service_locator.dart';
import 'package:flutter_login/core/utils/constants/app_constansts.dart';
import 'package:flutter_login/presentation/initial/bloc/initial_bloc.dart';
import 'package:flutter_login/presentation/widgets/custom_dialog.dart';
import 'package:flutter_login/presentation/widgets/default_page_layout.dart';
import 'package:flutter_login/presentation/widgets/profile_image.dart';
import 'package:flutter_login/presentation/widgets/buttons/theme_toggle_button.dart';

class InitialPage extends StatelessWidget {
  final int userId;

  const InitialPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<InitialBloc>()..add(LoadUserInfo(userId)),
        child: const InitialContent(),
      ),
    );
  }
}

class InitialContent extends StatelessWidget {
  const InitialContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitialBloc, InitialState>(
      listener: (context, state) {
        if (state.status == InitialStatus.failure) {
          CustomDialog.show(
            context,
            title: kLoginError,
            message: state.error,
          );
        }
        if (state.status == InitialStatus.loggedOut) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }
      },
      child: DefaultPageLayout(
        child: BlocBuilder<InitialBloc, InitialState>(
          builder: (context, state) {
            if (state.status == InitialStatus.loading) {
              return const CircularProgressIndicator();
            }
            if (state.status == InitialStatus.loaded && state.user != null) {
              final user = state.user!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ThemeToggleButton(),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => _logout(context),
                        icon: const Icon(Icons.logout),
                      ),
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
                  ProfileImage(imageUrl: user.avatar),
                  const SizedBox(height: 8),
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$kEmail: ${user.email}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 16),
                  ),
                ],
              );
            }
            return const Center(child: Text(kUserInfoUnavailable));
          },
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    context.read<InitialBloc>().add(LogoutRequested());
  }
}
