import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:localreview/app/constant/hive_table_constant.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';

part "auth_hive_model.g.dart";

@HiveType(typeId: HiveTableConstant.authTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? userId;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String username;

  @HiveField(3)
  final String password;

  @HiveField(4)
  final String profilePicture;

  @HiveField(5)
  final String bio;

  @HiveField(6)
  final String? gender;

  @HiveField(7)
  final List<String> followers;

  @HiveField(8)
  final List<String> following;

  @HiveField(9)
  final List<String> posts;

  @HiveField(10)
  final List<String> bookmarks;

  AuthHiveModel({
    String? userId,
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
  }) : userId = userId ?? const Uuid().v4();

  /// **Empty Constructor for Defaults**
  const AuthHiveModel.initial()
      : userId = "",
        email = "",
        username = "",
        password = "",
        profilePicture = "",
        bio = "",
        gender = null,
        followers = const [],
        following = const [],
        posts = const [],
        bookmarks = const [];

  /// **Convert from `AuthEntity` to `AuthHiveModel`**
  factory AuthHiveModel.fromEntity(AuthEntity authEntity) {
    return AuthHiveModel(
      userId: authEntity.id,
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

  /// **Convert from `AuthHiveModel` to `AuthEntity`**
  AuthEntity toEntity() {
    return AuthEntity(
      id: userId,
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

  @override
  List<Object?> get props => [
        userId,
        email,
        username,
        profilePicture,
        bio,
        gender,
        followers,
        following,
        posts,
        bookmarks,
      ];
}
