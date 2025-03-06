import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:localreview/app/constant/hive_table_constant.dart';

import 'package:localreview/features/post/domain/entity/post_entity.dart';

// part "post_hive_model.g.dart";

@HiveType(typeId: HiveTableConstant.posteId)
class PostHiveModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String authorId;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final String caption;
  @HiveField(4)
  final List<String> likes;
  @HiveField(5)
  final List<String> comments;
  @HiveField(6)
  final int rating;
  @HiveField(7)
  final String createdAt;

  PostHiveModel({
    required this.id,
    required this.authorId,
    required this.imageUrl,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.rating,
    required this.createdAt,
  });

  /// **Convert `PostHiveModel` to `PostEntity`**
  PostEntity toEntity() {
    return PostEntity(
      id: id,
      authorId: authorId,
      imageUrl: imageUrl,
      caption: caption,
      likes: likes,
      comments: comments,
      rating: rating,
      createdAt: DateTime.parse(createdAt),
    );
  }

  /// **Convert `PostEntity` to `PostHiveModel`**
  factory PostHiveModel.fromEntity(PostEntity postEntity) {
    return PostHiveModel(
      id: postEntity.id,
      authorId: postEntity.authorId,
      imageUrl: postEntity.imageUrl,
      caption: postEntity.caption,
      likes: postEntity.likes,
      comments: postEntity.comments,
      rating: postEntity.rating,
      createdAt: postEntity.createdAt.toIso8601String(),
    );
  }

  @override
  List<Object?> get props => [id, authorId, imageUrl, caption, likes, comments, rating, createdAt];
}
