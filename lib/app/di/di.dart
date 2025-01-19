import 'package:get_it/get_it.dart';
import 'package:localreview/core/network/hive_service.dart';
import 'package:localreview/features/auth/data/data_source/local_datasource/batch_local_data_source.dart';
import 'package:localreview/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:localreview/features/auth/domain/use_case/login_usecase.dart';
import 'package:localreview/features/auth/domain/use_case/register_user.dart';
import 'package:localreview/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:localreview/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:localreview/features/home/presentation/view_model/home_cubit.dart';
import 'package:localreview/features/onbording/presentation/view_model/onbordign_cubit.dart';
import 'package:localreview/features/splash/presentation/view_model/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();

  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initOnbordingDependencies();
  await _initSplashScreenDependencies();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initRegisterDependencies() {
  // init local data source
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  // init local repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  // register use usecase
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      getIt<AuthLocalRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
    ),
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initLoginDependencies() async {
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthLocalRepository>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<OnboardingCubit>()),
  );
}

_initOnbordingDependencies() async {
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(getIt<LoginBloc>()),
  );
}
