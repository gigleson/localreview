import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/profile/domain/entity/user_profile_entity.dart';

abstract interface class IUserProfileRepository {
  Future<Either<Failure, void>> createUserProfile(UserProfileEntity userinfo);
  Future<Either<Failure, String>> uploadProfilePicture(File file);
  Future<Either<Failure, void>> deleteProfilePicture();
  Future<Either<Failure, void>> updateUser(UserProfileEntity entity); 

  Future<Either<Failure, String>> updateProfilePicture(File file);
}
