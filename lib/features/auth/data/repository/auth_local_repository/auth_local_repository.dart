import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/data/data_source/local_datasource/auth_local_data_source.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';


class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() async {
    try {
      final currentUser = await _authLocalDataSource.getCurrentUser();
      return Right(currentUser);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> loginUser(
    String email,
    String password,
  ) async {
    try {
      final token = await _authLocalDataSource.loginUser(email, password);
      return Right(token);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> registerUser(AuthEntity user) async {
    try {
      return Right(_authLocalDataSource.registerUser(user));
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<AuthEntity>>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, AuthEntity>> getUserById(String userId) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }
  

  // @override  
  // Future<Either<Failure, String>> uploadProfilePicture(File file) async {
  //   // TODO: implement uploadProfilePicture
  //   throw UnimplementedError();
  // }
}
