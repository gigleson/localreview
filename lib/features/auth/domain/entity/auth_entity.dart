import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String username;
  final String email;
  final String password;
  final String profilePicture;
  final String bio;
  final String? gender;
  final List<String> followers;
  final List<String> following;
  final List<String> posts;
  final List<String> bookmarks;

  const AuthEntity({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.bio,
    this.gender,
    required this.followers,
    required this.following,
    required this.posts,
    required this.bookmarks,
  });

  /// Convert JSON to UserEntity
  factory AuthEntity.fromJson(Map<String, dynamic> json) {
    return AuthEntity(
      id: json['_id'] as String?,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      profilePicture: json['profilePicture'] ?? '',
      bio: json['bio'] ?? '',
      gender: json['gender'] as String?,
      followers: (json['followers'] as List<dynamic>).map((e) => e.toString()).toList(),
      following: (json['following'] as List<dynamic>).map((e) => e.toString()).toList(),
      posts: (json['posts'] as List<dynamic>).map((e) => e.toString()).toList(),
      bookmarks: (json['bookmarks'] as List<dynamic>).map((e) => e.toString()).toList(),
    );
  }

  /// Convert UserEntity to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'password': password,
      'profilePicture': profilePicture,
      'bio': bio,
      'gender': gender,
      'followers': followers,
      'following': following,
      'posts': posts,
      'bookmarks': bookmarks,
    };
  }

  /// Empty UserEntity for default values
  const AuthEntity.empty()
      : id = "_empty.id",
        username = "_empty.username",
        email = "_empty.email",
        password = "_empty.password",
        profilePicture = "_empty.profilePicture",
        bio = "_empty.bio",
        gender = null,
        followers = const [],
        following = const [],
        posts = const [],
        bookmarks = const [];

  @override
  List<Object?> get props => [id, username, email, profilePicture, bio, gender, followers, following, posts, bookmarks];
}
