import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:localreview/core/network/api_service.dart';
import 'package:localreview/core/network/hive_service.dart';
import 'package:localreview/features/auth/data/data_source/local_datasource/auth_local_data_source.dart';
import 'package:localreview/features/auth/data/data_source/remote_datasource/auth_remote_data_sourse.dart';
import 'package:localreview/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:localreview/features/auth/data/repository/auth_remote_repository/auth_remote_repository.dart';
import 'package:localreview/features/auth/domain/use_case/login_usecase.dart';
import 'package:localreview/features/auth/domain/use_case/register_user.dart';
import 'package:localreview/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:localreview/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:localreview/features/home/presentation/view_model/home_cubit.dart';
import 'package:localreview/features/onbording/presentation/view_model/onbordign_cubit.dart';
import 'package:localreview/features/profile/data/data_source/remote_datasource/user_remote_profile_data_source.dart';
import 'package:localreview/features/profile/data/repository/user_remote_pofile_repository.dart';
import 'package:localreview/features/profile/domain/use_case/create_user_profile_usecase.dart';
import 'package:localreview/features/profile/domain/use_case/upload_image_usecase.dart';
import 'package:localreview/features/profile/presentation/view_model/user_profile/user_profile_bloc.dart';
import 'package:localreview/features/splash/presentation/view_model/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();
  await _initApiService();
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initOnbordingDependencies();
  await _initSplashScreenDependencies();
  await _initUserProfileDependencies();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initRegisterDependencies() {
  // init local data source
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );
  // init local repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );
  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );

  // register use usecase
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      // getIt<AuthLocalRepository>(),
      getIt<AuthRemoteRepository>(),
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
      // getIt<AuthLocalRepository>(),
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      userProfileBloc: getIt<UserProfileBloc>(),
      // userProfileBloc: getIt<UserProfileBloc>(), 
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

_initApiService() {
  // Remote Data Source
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initUserProfileDependencies() async {
  getIt.registerLazySingleton<UserRemoteProfineDataSource>(
      () => UserRemoteProfineDataSource(getIt<Dio>()));

  getIt.registerLazySingleton<UserRemoteProfileRepository>(
    () => UserRemoteProfileRepository(getIt<UserRemoteProfineDataSource>()),
  );

  // register use usecase
  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(
      getIt<UserRemoteProfileRepository>(),
    ),
  );
  getIt.registerLazySingleton<CreateUserProfileUseCase>(
    () => CreateUserProfileUseCase(
      // getIt<AuthLocalRepository>(),
      getIt<UserRemoteProfileRepository>(),
    ),
  );

  getIt.registerFactory<UserProfileBloc>(
    () => UserProfileBloc(
      createUserProfileUseCase: getIt<CreateUserProfileUseCase>(),
      uploadImageUsecase: getIt<UploadImageUsecase>(),
    ),
  );
}
