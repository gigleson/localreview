import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:localreview/app/shared_prefs/token_shared_prefs.dart';
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
import 'package:localreview/features/post/data/data_source/remote_data_source/post_remote_data_source.dart';
import 'package:localreview/features/post/data/repository/post_remote_repository.dart';
import 'package:localreview/features/post/domain/use_case/AddCommentUseCase.dart';
import 'package:localreview/features/post/domain/use_case/AddPostUseCase.dart';
import 'package:localreview/features/post/domain/use_case/BookmarkPostUseCase.dart';
import 'package:localreview/features/post/domain/use_case/DeletePostUseCase.dart';
import 'package:localreview/features/post/domain/use_case/DislikePostUseCase.dart';
import 'package:localreview/features/post/domain/use_case/GetAllPostsUseCase.dart';
import 'package:localreview/features/post/domain/use_case/GetCommentsUseCase.dart';
import 'package:localreview/features/post/domain/use_case/GetUserPostsUseCase.dart';
import 'package:localreview/features/post/domain/use_case/LikePostUseCase.dart';
import 'package:localreview/features/post/presentation/view_model/bloc/post_bloc.dart';
import 'package:localreview/features/profile/data/data_source/remote_datasource/user_remote_profile_data_source.dart';
import 'package:localreview/features/profile/data/repository/user_remote_pofile_repository.dart';
import 'package:localreview/features/profile/domain/use_case/create_user_profile_usecase.dart';
import 'package:localreview/features/profile/domain/use_case/upload_image_usecase.dart';
import 'package:localreview/features/profile/presentation/view_model/user_profile/user_profile_bloc.dart';
import 'package:localreview/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();
  await _initApiService();
  await _initSharedPreferences();
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initOnbordingDependencies();
  await _initSplashScreenDependencies();
  await _initUserProfileDependencies();
  await _initPostDependencies(); 
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
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
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      // getIt<AuthLocalRepository>(),
      getIt<AuthRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      postBloc: getIt<PostBloc>(),
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
_initPostDependencies() {
  // **Remote Data Source**
  getIt.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSource(dio:getIt<Dio>(),userSharedPrefs: getIt<TokenSharedPrefs>()),
  );

  // **Local Data Source (Hive)**
  // getIt.registerLazySingleton<PostLocalDataSource>(
  //   () => PostLocalDataSource(getIt<HiveService>()),
  // );

  // **Remote Repository**
  getIt.registerLazySingleton<PostRemoteRepository>(
    () => PostRemoteRepository(getIt<PostRemoteDataSource>()),
  );

  // **Local Repository**
  // getIt.registerLazySingleton<PostLocalRepository>(
  //   () => PostLocalRepository(getIt<PostLocalDataSource>()),
  // );

  // **Use Cases**
  getIt.registerLazySingleton<AddPostUseCase>(
    () => AddPostUseCase(getIt<PostRemoteRepository>()),
  );

  getIt.registerLazySingleton<GetAllPostsUseCase>(
    () => GetAllPostsUseCase(getIt<PostRemoteRepository>()),
  );

  getIt.registerLazySingleton<GetUserPostsUseCase>(
    () => GetUserPostsUseCase(getIt<PostRemoteRepository>()),
  );

  getIt.registerLazySingleton<LikePostUseCase>(
    () => LikePostUseCase(getIt<PostRemoteRepository>()),
  );

  getIt.registerLazySingleton<DislikePostUseCase>(
    () => DislikePostUseCase(getIt<PostRemoteRepository>()),
  );

  getIt.registerLazySingleton<AddCommentUseCase>(
    () => AddCommentUseCase(getIt<PostRemoteRepository>()),
  );

  getIt.registerLazySingleton<GetCommentsUseCase>(
    () => GetCommentsUseCase(getIt<PostRemoteRepository>()),
  );

  getIt.registerLazySingleton<DeletePostUseCase>(
    () => DeletePostUseCase(getIt<PostRemoteRepository>()),
  );

  getIt.registerLazySingleton<BookmarkPostUseCase>(
    () => BookmarkPostUseCase(getIt<PostRemoteRepository>()),
  );


  getIt.registerFactory<PostBloc>(
    () => PostBloc(
      addPostUseCase: getIt<AddPostUseCase>(),
      getAllPostsUseCase: getIt<GetAllPostsUseCase>(),
      getUserPostsUseCase: getIt<GetUserPostsUseCase>(),
      likePostUseCase: getIt<LikePostUseCase>(),
      dislikePostUseCase: getIt<DislikePostUseCase>(),
      addCommentUseCase: getIt<AddCommentUseCase>(),
      getCommentsUseCase: getIt<GetCommentsUseCase>(),
      deletePostUseCase: getIt<DeletePostUseCase>(),
      bookmarkPostUseCase: getIt<BookmarkPostUseCase>(),
    ),
  );
}

