import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:localreview/core/common/snackbar/my_snackbar.dart';
import 'package:localreview/features/auth/domain/use_case/register_user.dart';
import 'package:localreview/features/auth/presentation/view_model/login/login_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;
  // final LoginBloc _loginBloc;
  RegisterBloc({
    required RegisterUseCase registerUseCase,
  })  : _registerUseCase = registerUseCase,
        super(RegisterState.initial()) {
    on<RegisterStudent>(_onRegisterEvent);

    // on<NavigateHomeScreenEvent>(
    //   (event, emit) {
    //     Navigator.pushReplacement(
    //       event.context,
    //       MaterialPageRoute(
    //         builder: (context) => BlocProvider.value(
    //           value: _homeCubit,
    //           child: event.destination,
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  void _onRegisterEvent(
    RegisterStudent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _registerUseCase.call(RegisterUserParams(
      userName: event.userName,
      email: event.email,
      password: event.password,
      createdAt: event.createdAt,
      lastLogin: event.lastLogin,
      status: event.status,
    ));

    result.fold(
      (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
      (r) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
            context: event.context, message: "Registration Successful");
      },
    );
  }
}
