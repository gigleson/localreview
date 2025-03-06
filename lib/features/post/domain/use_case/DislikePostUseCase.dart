import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';

import 'package:localreview/features/post/domain/repository/post_repository.dart';

class DislikePostUseCase implements UsecaseWithParams<void, DislikePostParams> {
  final IPostRepository repository;

  DislikePostUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DislikePostParams params) {
    return repository.dislikePost(params.postId);
  }
}

class DislikePostParams extends Equatable {
  final String postId;

  const DislikePostParams({required this.postId});

  @override
  List<Object> get props => [postId];
}
