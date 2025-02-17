import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';

import 'package:localreview/features/profile/data/data_source/remote_datasource/user_remote_profile_data_source.dart';
import 'package:localreview/features/profile/domain/entity/user_profile_entity.dart';
import 'package:localreview/features/profile/domain/repository/user_profile_repository.dart';

class UserRemoteProfileRepository implements IUserProfileRepository {
  final UserRemoteProfineDataSource _userRemoteProfineDataSource;

  UserRemoteProfileRepository(this._userRemoteProfineDataSource);



  @override

  @override
  Future<Either<Failure, void>> createUserProfile(UserProfileEntity userinfo) async{
     try {
      await _userRemoteProfineDataSource.createUserProfile(userinfo);
      return const Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }
    @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    try {
      final imageName = await _userRemoteProfineDataSource.uploadProfilePicture(file);
      return Right(imageName);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProfilePicture() {
    // TODO: implement deleteProfilePicture
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateProfilePicture(File file) {
    // TODO: implement updateProfilePicture
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateUser(UserProfileEntity entity) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
  
}
