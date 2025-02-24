import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/data/data_source/remote_datasource/auth_remote_data_sourse.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> loginUser(
      String username, String password) async {
    try {
      final user = await _authRemoteDataSource.loginUser(username, password);
      return Right(user);
    } catch (e) {
      return Left(
        LocalDatabaseFailure(
          message: 'Login failed: $e',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> registerUser(AuthEntity authEntity) async {
    try {
      await _authRemoteDataSource.registerUser(authEntity);
      return const Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
