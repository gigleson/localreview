import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/post/domain/repository/post_repository.dart';

class AddCommentUseCase implements UsecaseWithParams<void, AddCommentParams> {
  final IPostRepository repository;

  AddCommentUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(AddCommentParams params) {
    return repository.addComment(params.postId, params.comment);
  }
}

class AddCommentParams extends Equatable {
  final String postId;
  final String comment;

  const AddCommentParams({required this.postId, required this.comment});

  @override
  List<Object> get props => [postId, comment];
}
