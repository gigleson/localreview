import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:localreview/core/common/snackbar/my_snackbar.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/use_case/register_user.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterUserEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc({
    required RegisterUseCase registerUseCase,
  })  : _registerUseCase = registerUseCase,
        super(RegisterState.initial()) {
    on<RegisterUserEvent>(_onRegisterEvent);
  }

  /// **Handle Registration Event**
  void _onRegisterEvent(
    RegisterUserEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _registerUseCase.call(
      RegisterParams(
        user: AuthEntity(
          id: null, // ID will be generated on the backend
          username: event.userName,
          email: event.email,
          password: event.password,
          profilePicture: "",
          bio: "",
          gender: null,
          followers: const [],
          following: const [],
          posts: const [],
          bookmarks: const [],
        ),
      ),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        showMySnackBar(
          context: event.context,
          message: "Registration Failed: ${failure.message}",
        );
      },
      (_) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
          context: event.context,
          message: "Registration Successful",
        );
      },
    );
  }
}
