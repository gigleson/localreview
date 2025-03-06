import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/post/domain/entity/post_entity.dart';

abstract interface class IPostRepository {
  Future<Either<Failure, void>> addPost(PostEntity post);
  Future<Either<Failure, List<PostEntity>>> getAllPosts();
  Future<Either<Failure, List<PostEntity>>> getUserPosts();
  Future<Either<Failure, void>> likePost(String postId);
  Future<Either<Failure, void>> dislikePost(String postId);
  Future<Either<Failure, void>> addComment(String postId, String comment);
  Future<Either<Failure, List<String>>> getComments(String postId);
  Future<Either<Failure, void>> deletePost(String postId);
  Future<Either<Failure, void>> bookmarkPost(String postId);
}
