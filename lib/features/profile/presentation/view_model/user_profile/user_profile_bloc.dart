import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:localreview/core/common/snackbar/my_snackbar.dart';
import 'package:localreview/features/profile/domain/use_case/create_user_profile_usecase.dart';
import 'package:localreview/features/profile/domain/use_case/upload_image_usecase.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final CreateUserProfileUseCase _createUserProfileUseCase;
  final UploadImageUsecase _uploadImageUsecase;

  UserProfileBloc({
    required createUserProfileUseCase,
    required uploadImageUsecase,
  })  : _createUserProfileUseCase = createUserProfileUseCase,
        _uploadImageUsecase = uploadImageUsecase,
        super(UserProfileState.initial()) {
    on<UploadImage>(_onLoadImage);
    on<CreateUserProfile>(_onCreateUserProfile);
  }


void _onCreateUserProfile(
    CreateUserProfile event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createUserProfileUseCase.call(CreateUserProfileParams(
      bio: event.bio!,
      image: state.imageName!,
    ));

    result.fold(
      (l) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        showMySnackBar(
            context: event.context, message: l.message, color: Colors.red);
      },
      (r) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
            context: event.context, message: "Registration Successful");
      },
    );
  }

  void _onLoadImage(
    UploadImage event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _uploadImageUsecase.call(
      UploadImageParams(
        file: event.file,
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
      (r) {
        emit(state.copyWith(isLoading: false, isSuccess: true, imageName: r));
      },
    );
  }
}