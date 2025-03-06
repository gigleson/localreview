import 'package:dartz/dartz.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/post/domain/entity/post_entity.dart';
import 'package:localreview/features/post/domain/repository/post_repository.dart';

class GetAllPostsUseCase implements UsecaseWithoutParams<List<PostEntity>> {
  final IPostRepository repository;

  GetAllPostsUseCase(this.repository);

  @override
  Future<Either<Failure, List<PostEntity>>> call() {
    return repository.getAllPosts();
  }
}
