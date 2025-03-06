import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';

import 'package:localreview/features/post/domain/entity/post_entity.dart';
import 'package:localreview/features/post/domain/repository/post_repository.dart';

class AddPostUseCase implements UsecaseWithParams<void, AddPostParams> {
  final IPostRepository repository;

  AddPostUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(AddPostParams params) {
    return repository.addPost(params.post);
  }
}

class AddPostParams extends Equatable {
  final PostEntity post;
  

  const AddPostParams({required this.post});

  @override
  List<Object> get props => [post];
}
