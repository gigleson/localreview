// import 'package:localreview/core/network/hive_service.dart';

// import 'package:localreview/features/post/data/data_source/post_data_source.dart';
// import 'package:localreview/features/post/data/model/post_hive_modle.dart';
// import 'package:localreview/features/post/domain/entity/post_entity.dart';

// class PostLocalDataSource implements IPostDataSource {
//   final HiveService _hiveService;

//   PostLocalDataSource(this._hiveService);

//   /// **Add Post to Local Storage**
//   @override
//   Future<void> addPost(PostEntity post) async {
//     try {
//       final postModel = PostHiveModel.fromEntity(post);
//       await _hiveService.storePost(postModel);
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   /// **Get All Posts from Local Storage**
//   @override
//   Future<List<PostEntity>> getAllPosts() async {
//     try {
//       List<PostHiveModel> postModels = await _hiveService.getAllPosts();
//       return postModels.map((e) => e.toEntity()).toList();
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   /// **Get User's Posts from Local Storage**
//   @override
//   Future<List<PostEntity>> getUserPosts() async {
//     try {
//       List<PostHiveModel> postModels = await _hiveService.getUserPosts();
//       return postModels.map((e) => e.toEntity()).toList();
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   /// **Like a Post in Local Storage (Dummy Implementation)**
//   @override
//   Future<void> likePost(String postId) async {
//     throw UnimplementedError();
//   }

//   /// **Dislike a Post in Local Storage (Dummy Implementation)**
//   @override
//   Future<void> dislikePost(String postId) async {
//     throw UnimplementedError();
//   }

//   /// **Add a Comment in Local Storage (Dummy Implementation)**
//   @override
//   Future<void> addComment(String postId, String comment) async {
//     throw UnimplementedError();
//   }

//   /// **Get Comments from Local Storage (Dummy Implementation)**
//   @override
//   Future<List<String>> getComments(String postId) async {
//     throw UnimplementedError();
//   }

//   /// **Delete a Post from Local Storage**
//   @override
//   Future<void> deletePost(String postId) async {
//     try {
//       await _hiveService.deletePost(postId);
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   /// **Bookmark a Post in Local Storage (Dummy Implementation)**
//   @override
//   Future<void> bookmarkPost(String postId) async {
//     throw UnimplementedError();
//   }
// }
