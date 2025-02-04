import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/profile/domain/entity/user_profile_entity.dart';



abstract interface class IUserProfileRepository {
  Future<Either<Failure,void>> createUserProfile(UserProfileEntity userinfo);  
  Future<Either<Failure, String>> uploadProfilePicture(File file);
}