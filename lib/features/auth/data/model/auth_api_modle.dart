import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';

AuthApiModel authApiModelFromJson(String str) =>
    AuthApiModel.fromJson(json.decode(str));

String authApiModelToJson(AuthApiModel data) => json.encode(data.toJson());

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: "_id")
  String? id;
  String email;
  String username;
  String password;
  String profilePicture;
  String bio;
  String? gender;
  List<String> followers;
  List<String> following;
  List<String> posts;
  List<String> bookmarks;

  AuthApiModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.profilePicture,
    required this.bio,
    this.gender,
    required this.followers,
    required this.following,
    required this.posts,
    required this.bookmarks,
  });

  /// Convert JSON to AuthApiModel
  factory AuthApiModel.fromJson(Map<String, dynamic> json) => AuthApiModel(
        id: json["_id"] as String?,
        email: json["email"] as String,
        username: json["username"] as String,
        password: json["password"] as String,
        profilePicture: json["profilePicture"] ?? '',
        bio: json["bio"] ?? '',
        gender: json["gender"] as String?,
        followers: (json["followers"] as List<dynamic>).map((e) => e.toString()).toList(),
        following: (json["following"] as List<dynamic>).map((e) => e.toString()).toList(),
        posts: (json["posts"] as List<dynamic>).map((e) => e.toString()).toList(),
        bookmarks: (json["bookmarks"] as List<dynamic>).map((e) => e.toString()).toList(),
      );

  /// Convert AuthApiModel to JSON
  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "username": username,
        "password": password,
        "profilePicture": profilePicture,
        "bio": bio,
        "gender": gender,
        "followers": followers,
        "following": following,
        "posts": posts,
        "bookmarks": bookmarks,
      };

  /// Convert API Model to AuthEntity
  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      email: email,
      username: username,
      password: password,
      profilePicture: profilePicture,
      bio: bio,
      gender: gender,
      followers: followers,
      following: following,
      posts: posts,
      bookmarks: bookmarks,
    );
  }

  /// Convert AuthEntity to API Model
  factory AuthApiModel.fromEntity(AuthEntity authEntity) {
    return AuthApiModel(
      id: authEntity.id,
      email: authEntity.email,
      username: authEntity.username,
      password: authEntity.password,
      profilePicture: authEntity.profilePicture,
      bio: authEntity.bio,
      gender: authEntity.gender,
      followers: authEntity.followers,
      following: authEntity.following,
      posts: authEntity.posts,
      bookmarks: authEntity.bookmarks,
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        username,
        password,
        profilePicture,
        bio,
        gender,
        followers,
        following,
        posts,
        bookmarks,
      ];
}
