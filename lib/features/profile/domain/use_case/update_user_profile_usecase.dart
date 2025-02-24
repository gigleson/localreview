import 'package:dartz/dartz.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';

import 'package:localreview/features/profile/domain/entity/user_profile_entity.dart';

import 'package:localreview/features/profile/domain/repository/user_profile_repository.dart';

class UpdateUserUseCase implements UsecaseWithParams<void, UserProfileEntity> {
  final IUserProfileRepository _repository;

  UpdateUserUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(UserProfileEntity entity) {
    return _repository.updateUser(entity);
  }
}
