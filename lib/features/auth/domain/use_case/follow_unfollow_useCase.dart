import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';

/// **Follow/Unfollow Params**
class FollowUnfollowParams extends Equatable {
  final String userId;

  const FollowUnfollowParams({required this.userId});

  @override
  List<Object> get props => [userId];
}

/// **Follow/Unfollow Use Case**
class FollowUnfollowUseCase implements UsecaseWithParams<void, FollowUnfollowParams> {
  final IAuthRepository repository;

  FollowUnfollowUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(FollowUnfollowParams params) {
    return repository.followOrUnfollow(params.userId);
  }
}
