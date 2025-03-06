import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/post/domain/repository/post_repository.dart';

class GetCommentsUseCase implements UsecaseWithParams<List<String>, GetCommentsParams> {
  final IPostRepository repository;

  GetCommentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(GetCommentsParams params) {
    return repository.getComments(params.postId);
  }
}

class GetCommentsParams extends Equatable {
  final String postId;

  const GetCommentsParams({required this.postId});

  @override
  List<Object> get props => [postId];
}
