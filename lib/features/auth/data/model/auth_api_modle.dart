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
  String? createdAt;
  String? lastLogin;
  String? status;

  AuthApiModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.createdAt,
    required this.lastLogin,
    required this.status,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) => AuthApiModel(
        id: json["_id"] as String?,
        email: json["email"] as String,
        username: json["username"] as String,
        password: json["password"] as String,
        createdAt: json["createdAt"] as String?,
        lastLogin: json["lastLogin"] as String?,
        status: json["status"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "username": username,
        "password": password,
        "createdAt": createdAt,
        "lastLogin": lastLogin,
        "status": status,
      };

  AuthEntity toEntity() {
    return AuthEntity(
      email: email,
      userName: username,
      password: password,
      createdAt: createdAt!,
      lastLogin: lastLogin!,
      status: status!,
    );
  }

  factory AuthApiModel.fromEntity(AuthEntity authEntity) {
    return AuthApiModel(
        id: authEntity.userId,
        createdAt: authEntity.createdAt,
        email: authEntity.email,
        lastLogin: authEntity.lastLogin,
        password: authEntity.password,
        status: authEntity.status,
        username: authEntity.userName);
  }
  @override
  List<Object?> get props => [
        id,
        email,
        username,
        password,
        lastLogin,
        status,
        createdAt,
      ];
}
