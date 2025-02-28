import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';

/// **Edit Profile Params**
class EditProfileParams extends Equatable {
  final AuthEntity user;
  final String? profileImagePath;

  const EditProfileParams({
    required this.user,
    this.profileImagePath,
  });

  @override
  List<Object?> get props => [user, profileImagePath];
}

/// **Edit Profile Use Case**
class EditProfileUseCase implements UsecaseWithParams<void, EditProfileParams> {
  final IAuthRepository repository;

  EditProfileUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(EditProfileParams params) {
    return repository.editProfile(params.user, params.profileImagePath);
  }
}
