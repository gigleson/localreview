
import 'package:localreview/features/post/domain/entity/post_entity.dart';

abstract interface class IPostDataSource {
  Future<void> addPost(PostEntity post);
  Future<List<PostEntity>> getAllPosts();
  Future<List<PostEntity>> getUserPosts();
  Future<void> likePost(String postId);
  Future<void> dislikePost(String postId);
  Future<void> addComment(String postId, String comment);
  Future<List<String>> getComments(String postId);
  Future<void> deletePost(String postId);
  Future<void> bookmarkPost(String postId);
}
