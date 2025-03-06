import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/post/domain/repository/post_repository.dart';

class DeletePostUseCase implements UsecaseWithParams<void, DeletePostParams> {
  final IPostRepository repository;

  DeletePostUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeletePostParams params) {
    return repository.deletePost(params.postId);
  }
}

class DeletePostParams extends Equatable {
  final String postId;

  const DeletePostParams({required this.postId});

  @override
  List<Object> get props => [postId];
}
