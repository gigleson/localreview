import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';

import 'package:localreview/features/post/data/data_source/remote_data_source/post_remote_data_source.dart';
import 'package:localreview/features/post/domain/entity/post_entity.dart';
import 'package:localreview/features/post/domain/repository/post_repository.dart';

class PostRemoteRepository implements IPostRepository {
  final PostRemoteDataSource _postRemoteDataSource;

  PostRemoteRepository(this._postRemoteDataSource);

  /// **Add New Post**
  @override
  Future<Either<Failure, void>> addPost(PostEntity post) async {
    try {
      await _postRemoteDataSource.addPost(post);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Fetch All Posts**
  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    try {
      final posts = await _postRemoteDataSource.getAllPosts();
      return Right(posts);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Fetch User's Posts**
  @override
  Future<Either<Failure, List<PostEntity>>> getUserPosts() async {
    try {
      final posts = await _postRemoteDataSource.getUserPosts();
      return Right(posts);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Like a Post**
  @override
  Future<Either<Failure, void>> likePost(String postId) async {
    try {
      await _postRemoteDataSource.likePost(postId);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Dislike a Post**
  @override
  Future<Either<Failure, void>> dislikePost(String postId) async {
    try {
      await _postRemoteDataSource.dislikePost(postId);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Add a Comment**
  @override
  Future<Either<Failure, void>> addComment(String postId, String comment) async {
    try {
      await _postRemoteDataSource.addComment(postId, comment);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Fetch Comments for a Post**
  @override
  Future<Either<Failure, List<String>>> getComments(String postId) async {
    try {
      final comments = await _postRemoteDataSource.getComments(postId);
      return Right(comments);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Delete a Post**
  @override
  Future<Either<Failure, void>> deletePost(String postId) async {
    try {
      await _postRemoteDataSource.deletePost(postId);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Bookmark a Post**
  @override
  Future<Either<Failure, void>> bookmarkPost(String postId) async {
    try {
      await _postRemoteDataSource.bookmarkPost(postId);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
