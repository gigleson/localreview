import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, String>> loginUser(String email, String password);
  Future<Either<Failure, void>> registerUser(AuthEntity user);
  Future<Either<Failure, void>> logoutUser();
  Future<Either<Failure, AuthEntity>> getCurrentUser();
  Future<Either<Failure, AuthEntity>> getUserById(String userId);
  Future<Either<Failure, List<AuthEntity>>> getSuggestedUsers();
  Future<Either<Failure, void>> editProfile(AuthEntity user, String? profileImagePath);
  Future<Either<Failure, void>> followOrUnfollow(String targetUserId);
}
