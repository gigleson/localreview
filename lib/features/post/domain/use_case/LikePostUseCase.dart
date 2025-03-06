import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/post/domain/repository/post_repository.dart';

class LikePostUseCase implements UsecaseWithParams<void, LikePostParams> {
  final IPostRepository repository;

  LikePostUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(LikePostParams params) {
    return repository.likePost(params.postId);
  }
}

class LikePostParams extends Equatable {
  final String postId;

  const LikePostParams({required this.postId});

  @override
  List<Object> get props => [postId];
}
