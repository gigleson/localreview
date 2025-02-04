import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:localreview/features/profile/domain/entity/user_profile_entity.dart';

UserApiProfileModel authApiModelFromJson(String str) =>
    UserApiProfileModel.fromJson(json.decode(str));

String authApiModelToJson(UserApiProfileModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class UserApiProfileModel {
  String? bio;
  String? image;

  UserApiProfileModel({this.bio, this.image});

  factory UserApiProfileModel.fromJson(Map<String, dynamic> json) =>
      UserApiProfileModel(
        bio: json["bio"] as String?,
        image: json["image"] as String,
      );

  Map<String, dynamic> toJson() => {
        "bio": bio,
        "image": image,
      };

  UserProfileEntity toEntity() {
    return UserProfileEntity(
      bio: bio,
      image: image,
    );
  }

  factory UserApiProfileModel.fromEntity(UserProfileEntity userProfileEntity) {
    return UserApiProfileModel(
      bio: userProfileEntity.bio,
      image: userProfileEntity.image,
    );
  }
  @override
  List<Object?> get props => [
        bio,
        image,
      ];
}
