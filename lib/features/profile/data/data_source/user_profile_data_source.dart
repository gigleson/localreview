import 'dart:io';

import 'package:localreview/features/profile/domain/entity/user_profile_entity.dart';

abstract interface class IUserProfileDataSource {
  Future<void> createUserProfile(UserProfileEntity userinfo);

  Future<String> uploadProfilePicture(File file);
}
