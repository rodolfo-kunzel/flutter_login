import 'package:flutter_login/core/theme/bloc/theme_bloc.dart';
import 'package:flutter_login/data/remote/api.dart';
import 'package:flutter_login/data/user_repository_impl.dart';
import 'package:flutter_login/domain/repository/user_repository.dart';
import 'package:flutter_login/domain/use_cases/get_user_info_use_case.dart';
import 'package:flutter_login/domain/use_cases/login_use_case.dart';
import 'package:flutter_login/domain/use_cases/logout_use_case.dart';
import 'package:flutter_login/domain/use_cases/register_use_case.dart';
import 'package:flutter_login/presentation/initial/bloc/initial_bloc.dart';
import 'package:flutter_login/presentation/login/bloc/login_bloc.dart';
import 'package:flutter_login/presentation/register/bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Register API
  getIt.registerLazySingleton<ApiImplementation>(() => ApiImplementation());

  // Register repositories
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(api: getIt<ApiImplementation>()));

  // Register use cases
  getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCaseImpl(userRepository: getIt<UserRepository>()));
  getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCaseImpl(userRepository: getIt<UserRepository>()));
  getIt.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCaseImpl(userRepository: getIt<UserRepository>()));
  getIt.registerLazySingleton<GetUserInfoUseCase>(
      () => GetUserInfoUseCaseImpl(userRepository: getIt<UserRepository>()));

  // Register blocs
  getIt.registerFactory(() => ThemeBloc());
  getIt.registerFactory(() => LoginBloc(loginUseCase: getIt<LoginUseCase>()));
  getIt.registerFactory(
      () => RegisterBloc(registerUseCase: getIt<RegisterUseCase>()));
  getIt.registerFactory(() => InitialBloc(
        getUserInfoUseCase: getIt<GetUserInfoUseCase>(),
        logoutUseCase: getIt<LogoutUseCase>(),
      ));
}
