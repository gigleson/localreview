import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/data/data_source/local_datasource/auth_local_data_source.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);

  /// **Get Current User from Local Storage**
  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() async {
    try {
      final currentUser = await _authLocalDataSource.getCurrentUser();
      return Right(currentUser);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  /// **Login User Locally**
  @override
  Future<Either<Failure, String>> loginUser(String email, String password) async {
    try {
      final token = await _authLocalDataSource.loginUser(email, password);
      return Right(token);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  /// **Register User in Local Storage**
  @override
  Future<Either<Failure, void>> registerUser(AuthEntity user) async {
    try {
      await _authLocalDataSource.registerUser(user);
      return const Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  /// **Logout User (Clears Local Data)**
  @override
  Future<Either<Failure, void>> logoutUser() async {
    try {
      await _authLocalDataSource.logoutUser();
      return const Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  /// **Get User by ID from Local Storage**
  @override
  Future<Either<Failure, AuthEntity>> getUserById(String userId) async {
    try {
      final user = await _authLocalDataSource.getUserById(userId);
      return Right(user);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  /// **Get All Users Stored Locally**
  @override
  Future<Either<Failure, List<AuthEntity>>> getSuggestedUsers() async {
    try {
      final users = await _authLocalDataSource.getAllUsers();
      return Right(users);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  /// **Edit Profile in Local Storage**
  @override
  Future<Either<Failure, void>> editProfile(AuthEntity user, String? profileImagePath) async {
    try {
      await _authLocalDataSource.editProfile(user, profileImagePath);
      return const Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  /// **Follow or Unfollow a User (Locally)**
  @override
  Future<Either<Failure, void>> followOrUnfollow(String targetUserId) async {
    try {
      await _authLocalDataSource.followOrUnfollow(targetUserId);
      return const Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }
}
