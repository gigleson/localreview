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

  @override
  List<Object?> get props =>[userId];
}
