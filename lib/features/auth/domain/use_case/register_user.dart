import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String email;
  final String userName;
  final String password;
  final String status;
  final String lastLogin;
  final String createdAt;

  const RegisterUserParams({
    required this.email,
    required this.userName,
    required this.password,
    required this.createdAt,
    required this.lastLogin,
    required this.status,
  });

  //intial constructor
  const RegisterUserParams.initial({
    required this.email,
    required this.userName,
    required this.password,
    required this.createdAt,
    required this.lastLogin,
    required this.status,
  });
  const RegisterUserParams.empty()
      : email = "_empty.string",
        password = "_empty.string",
        userName = "_empty.userName",
        lastLogin = "_empty.lastLogin",
        status = "_empty.status",
        createdAt = "_empty.createdAt";

  @override
  List<Object?> get props =>
      [email, userName, createdAt, lastLogin, status, password];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      email: params.email,
      userName: params.userName,
      createdAt: params.createdAt,
      lastLogin: params.lastLogin,
      status: params.status,
      password: params.password,
    );
    return repository.registerUser(authEntity);
  }
}
