// Usecase Code
import 'package:dartz/dartz.dart';

import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';

import 'package:localreview/features/profile/domain/repository/user_profile_repository.dart';

class DeleteProfilePictureUseCase implements UsecaseWithoutParams<void> {
  final IUserProfileRepository _repository;

  DeleteProfilePictureUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() {
    return _repository.deleteProfilePicture();
  }
}
