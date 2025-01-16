import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:localreview/app/constant/hive_table_constant.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModle extends Equatable {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String userName;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final String status;
  @HiveField(5)
  final String lastLogin;
  @HiveField(6)
  final String createdAt;

  AuthHiveModle({
    String? userId,
    required this.email,
    required this.userName,
    required this.password,
    required this.createdAt,
    required this.lastLogin,
    required this.status,
  }) : userId = userId ?? const Uuid().v4();

  const AuthHiveModle.initail()
      : userId = "",
        email = "",
        userName = "",
        password = "",
        status = "",
        createdAt = "",
        lastLogin = "";

  factory AuthHiveModle.fromEntity(AuthEntity authEntity) {
    return AuthHiveModle(
        userId: authEntity.userId,
        createdAt: authEntity.createdAt,
        email: authEntity.email,
        lastLogin: authEntity.lastLogin,
        password: authEntity.password,
        status: authEntity.status,
        userName: authEntity.userName);
  }

  AuthEntity toEntity() {
    return AuthEntity(
        email: email,
        userName: userName,
        password: password,
        createdAt: createdAt,
        lastLogin: lastLogin,
        status: status);
  }

  @override

  List<Object?> get props => [userId];
}
