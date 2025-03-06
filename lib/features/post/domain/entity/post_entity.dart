import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String id;
  final String authorId;
  final String imageUrl;
  final String caption;
  final List<String> likes;
  final List<String> comments;
  final int rating;
  final DateTime createdAt;

  const PostEntity({
    required this.id,
    required this.authorId,
    required this.imageUrl,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.rating,
    required this.createdAt,
  });

  /// **Convert JSON to `PostEntity`**
  factory PostEntity.fromJson(Map<String, dynamic> json) {
    return PostEntity(
      id: json['_id'],
      authorId: json['author'],
      imageUrl: json['image'],
      caption: json['caption'] ?? '',
      likes: List<String>.from(json['likes'] ?? []),
      comments: List<String>.from(json['comments'] ?? []),
      rating: json['rating'] ?? 1,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  /// **Convert `PostEntity` to JSON**
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'author': authorId,
      'image': imageUrl,
      'caption': caption,
      'likes': likes,
      'comments': comments,
      'rating': rating,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, authorId, imageUrl, caption, likes, comments, rating, createdAt];
}
    