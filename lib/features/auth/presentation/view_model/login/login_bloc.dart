import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localreview/core/common/snackbar/my_snackbar.dart';
import 'package:localreview/features/auth/domain/use_case/login_usecase.dart';
import 'package:localreview/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:localreview/features/home/presentation/view/navbar_view.dart';
import 'package:localreview/features/home/presentation/view_model/home_cubit.dart';
import 'package:localreview/features/profile/presentation/view/user_profile_view.dart';
import 'package:localreview/features/profile/presentation/view_model/user_profile/user_profile_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegisterBloc _registerBloc;
  final HomeCubit _homeCubit;
  final UserProfileBloc _userProfileBloc;
  final LoginUseCase _loginUseCase;

  LoginBloc({
    required RegisterBloc registerBloc,
    required HomeCubit homeCubit,
    required LoginUseCase loginUseCase,
    required UserProfileBloc userProfileBloc,
  })  : _registerBloc = registerBloc,
        _homeCubit = homeCubit,
        _loginUseCase = loginUseCase,
        _userProfileBloc = userProfileBloc,
        super(LoginState.initial()) {
    on<NavigateRegisterScreenEvent>(
      (event, emit) {
        Navigator.push(
          event.context,
          MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: _registerBloc),
              ],
              child: event.destination,
            ),
          ),
        );
      },
    );

    on<NavigateHomeScreenEvent>(
      (event, emit) {
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _homeCubit,
              child: event.destination,
            ),
          ),
        );
      },
    );

    on<LoginStudentEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        final result = await _loginUseCase(
          LoginParams(
            email: event.username,
            password: event.password,
          ),
        );

        result.fold(
          (failure) {
            emit(state.copyWith(isLoading: false, isSuccess: false));
            showMySnackBar(
              context: event.context,
              message: "Invalid Credentials",
              color: Colors.red,
            );
          },
          (token) {
            emit(state.copyWith(isLoading: false, isSuccess: true));
            // add(
            //   NavigateHomeScreenEvent(
            //     context: event.context,
            //     destination: const BottomNavationView(),
            //   ),
            // );
            add(
              NavigateUserProfileScreenEvent(
                context: event.context,
                destination: const ProfileScreen(), // Your user profile screen
              ),
            );

            //_homeCubit.setToken(token);
          },
        );
      },
    );
    on<NavigateUserProfileScreenEvent>(
      (event, emit) {
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _userProfileBloc, // Ensure _userProfileBloc is registered
              child: event.destination,
            ),
          ),
        );
      },
    );
  }
}
