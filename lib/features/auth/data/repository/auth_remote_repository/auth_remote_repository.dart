import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/data/data_source/remote_datasource/auth_remote_data_sourse.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  /// **Login User**
  @override
  Future<Either<Failure, String>> loginUser(String email, String password) async {
    try {
      final token = await _authRemoteDataSource.loginUser(email, password);
      return Right(token);
    } catch (e) {
      return Left(ApiFailure(message: 'Login failed: $e'));
    }
  }

  /// **Register User**
  @override
  Future<Either<Failure, void>> registerUser(AuthEntity authEntity) async {
    try {
      await _authRemoteDataSource.registerUser(authEntity);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Logout User**
  @override
  Future<Either<Failure, void>> logoutUser() async {
    try {
      await _authRemoteDataSource.logoutUser();
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Get Current User**
  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() async {
    try {
      final authEntity = await _authRemoteDataSource.getCurrentUser();
      return Right(authEntity);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Get User by ID**
  @override
  Future<Either<Failure, AuthEntity>> getUserById(String userId) async {
    try {
      final authEntity = await _authRemoteDataSource.getUserById(userId);
      return Right(authEntity);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Get Suggested Users**
  @override
  Future<Either<Failure, List<AuthEntity>>> getSuggestedUsers() async {
    try {
      final authEntities = await _authRemoteDataSource.getSuggestedUsers();
      return Right(authEntities);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Edit Profile**
  @override
  Future<Either<Failure, void>> editProfile(AuthEntity user, String? profileImagePath) async {
    try {
      await _authRemoteDataSource.editProfile(user, profileImagePath);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// **Follow or Unfollow a User**
  @override
  Future<Either<Failure, void>> followOrUnfollow(String targetUserId) async {
    try {
      await _authRemoteDataSource.followOrUnfollow(targetUserId);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
