import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';

import 'package:localreview/features/profile/domain/repository/user_profile_repository.dart';

class UpdateProfilePictureUseCase implements UsecaseWithParams<String, File> {
  final IUserProfileRepository _repository;

  UpdateProfilePictureUseCase(this._repository);

  @override
  Future<Either<Failure, String>> call(File file) {
    return _repository.updateProfilePicture(file);
  }
}