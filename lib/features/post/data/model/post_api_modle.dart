import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:localreview/features/post/domain/entity/post_entity.dart';

PostApiModel postApiModelFromJson(String str) => PostApiModel.fromJson(json.decode(str));
String postApiModelToJson(PostApiModel data) => json.encode(data.toJson());

@JsonSerializable()
class PostApiModel {
  @JsonKey(name: "_id")
  final String id;
  final String author;
  final String image;
  final String caption;
  final List<String> likes;
  final List<String> comments;
  final int rating;
  final String createdAt;

  PostApiModel({
    required this.id,
    required this.author,
    required this.image,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.rating,
    required this.createdAt,
  });

  /// **Convert JSON to `PostApiModel`**
  factory PostApiModel.fromJson(Map<String, dynamic> json) => PostApiModel(
        id: json["_id"],
        author: json["author"],
        image: json["image"],
        caption: json["caption"] ?? '',
        likes: List<String>.from(json["likes"] ?? []),
        comments: List<String>.from(json["comments"] ?? []),
        rating: json["rating"] ?? 1,
        createdAt: json["createdAt"],
      );

  /// **Convert `PostApiModel` to JSON**
  Map<String, dynamic> toJson() => {
        "_id": id,
        "author": author,
        "image": image,
        "caption": caption,
        "likes": likes,
        "comments": comments,
        "rating": rating,
        "createdAt": createdAt,
      };

  /// **Convert `PostApiModel` to `PostEntity`**
  PostEntity toEntity() {
    return PostEntity(
      id: id,
      authorId: author,
      imageUrl: image,
      caption: caption,
      likes: likes,
      comments: comments,
      rating: rating,
      createdAt: DateTime.parse(createdAt),
    );
  }

  /// **Convert `PostEntity` to `PostApiModel`**
  factory PostApiModel.fromEntity(PostEntity postEntity) {
    return PostApiModel(
      id: postEntity.id,
      author: postEntity.authorId,
      image: postEntity.imageUrl,
      caption: postEntity.caption,
      likes: postEntity.likes,
      comments: postEntity.comments,
      rating: postEntity.rating,
      createdAt: postEntity.createdAt.toIso8601String(),
    );
  }
}
