import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String email;
  final String userName;
  final String password;
  final String status;
  final String lastLogin;
  final String createdAt;

  const AuthEntity({
    this.userId,
    required this.email,
    required this.userName,
    required this.password,
    required this.createdAt,
    required this.lastLogin,
    required this.status,
  });
  factory AuthEntity.fromJson(Map<String, dynamic> json) {
    return AuthEntity(
        userId: json['username'] as String,
        email: json['email'] as String,
        createdAt: json['email'] as String,
        lastLogin: json['email'] as String,
        status: json['email'] as String,
        userName: json['email'] as String,

        // userId: json['userId'] as String?,
        password: json['password'] as String);
  }

  const AuthEntity.empty()
      : userId = "_empty.userId",
        email = "_empty.email",
        userName = "_empty.userName",
        password = "_empty.password",
        createdAt = "_empty.createdAt",
        lastLogin = "_empty.lastLogin",
        status = "_empty.status";

  @override
  List<Object?> get props => [userId];
}
