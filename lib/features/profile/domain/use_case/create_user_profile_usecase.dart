import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/profile/domain/entity/user_profile_entity.dart';
import 'package:localreview/features/profile/domain/repository/user_profile_repository.dart';

class CreateUserProfileParams extends Equatable {
  final String bio;
  final String image;

  const CreateUserProfileParams({
    required this.bio,
    required this.image,
  });

  //intial constructor
  const CreateUserProfileParams.initial({
    required this.bio,
    required this.image,
  });
  const CreateUserProfileParams.empty()
      : bio = "_empty.bio",
        image = "_empty.image";

  @override
  List<Object?> get props => [bio, image];
}

class CreateUserProfileUseCase
    implements UsecaseWithParams<void, CreateUserProfileParams> {
  final IUserProfileRepository repository;

  CreateUserProfileUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateUserProfileParams params) {
    final userProfileEntity = UserProfileEntity(
      bio: params.bio,
      image: params.image,
    );
    return repository.createUserProfile(userProfileEntity);
  }
}
