import 'package:dio/dio.dart';
import 'package:localreview/app/constant/api_endpoint.dart';
import 'package:localreview/app/shared_prefs/token_shared_prefs.dart';
import 'package:localreview/features/post/data/data_source/post_data_source.dart';
import 'package:localreview/features/post/data/model/post_api_modle.dart';
import 'package:localreview/features/post/domain/entity/post_entity.dart';

class PostRemoteDataSource implements IPostDataSource {
  final Dio _dio;
  final TokenSharedPrefs _userSharedPrefs;

  PostRemoteDataSource(
      {required Dio dio, required TokenSharedPrefs userSharedPrefs})
      : _dio = dio,
        _userSharedPrefs = userSharedPrefs;

  Future<String> sharedPrefUserId() async {
    final userId = await _userSharedPrefs.getToken();
    return userId.fold(
      (l) => throw Exception(l),
      (r) => r,
    );
  }

  /// **Add a New Post**
  @override
  Future<void> addPost(PostEntity post) async {
    try {
      FormData formData = FormData.fromMap({
        "caption": post.caption,
        "rating": post.rating,
        "image":
            await MultipartFile.fromFile(post.imageUrl, filename: "post.jpg"),
      });

      Response response = await _dio.post(
        ApiEndpoints.addPost,
        data: formData,
      );

      if (response.statusCode != 201) {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Fetch All Posts**
  @override
  Future<List<PostEntity>> getAllPosts() async {
    try {
      Response response = await _dio.get(ApiEndpoints.getAllPosts);
      if (response.statusCode == 200) {
        return (response.data["posts"] as List)
            .map((e) => PostApiModel.fromJson(e).toEntity())
            .toList();
      }
      throw Exception(response.statusMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Fetch User Posts**
  @override
  Future<List<PostEntity>> getUserPosts() async {
    try {
      Response response = await _dio.get(ApiEndpoints.getUserPosts);
      if (response.statusCode == 200) {
        return (response.data["posts"] as List)
            .map((e) => PostApiModel.fromJson(e).toEntity())
            .toList();
      }
      throw Exception(response.statusMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Like a Post**
  @override
  Future<void> likePost(String postId) async {
    try {
      Response response = await _dio.get("${ApiEndpoints.likePost}/$postId");
      if (response.statusCode != 200) {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Dislike a Post**
  @override
  Future<void> dislikePost(String postId) async {
    try {
      Response response = await _dio.get("${ApiEndpoints.dislikePost}/$postId");
      if (response.statusCode != 200) {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Add a Comment to a Post**
  @override
  Future<void> addComment(String postId, String comment) async {
    try {
      Response response = await _dio
          .post("${ApiEndpoints.addComment}/$postId", data: {"text": comment});
      if (response.statusCode != 201) {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Get Comments for a Post**
  @override
  Future<List<String>> getComments(String postId) async {
    try {
      Response response = await _dio.get("${ApiEndpoints.getComments}/$postId");
      if (response.statusCode == 200) {
        return List<String>.from(
            response.data["comments"].map((e) => e["text"]));
      }
      throw Exception(response.statusMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Delete a Post**
  @override
  Future<void> deletePost(String postId) async {
    try {
      Response response =
          await _dio.delete("${ApiEndpoints.deletePost}/$postId");
      if (response.statusCode != 200) {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Bookmark a Post**
  @override
  Future<void> bookmarkPost(String postId) async {
    try {
      Response response =
          await _dio.get("${ApiEndpoints.bookmarkPost}/$postId");
      if (response.statusCode != 200) {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
