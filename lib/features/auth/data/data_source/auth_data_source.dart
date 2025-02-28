import 'package:localreview/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthDataSource {
  /// **Logs in a user and returns a session token**
  Future<String> loginUser(String email, String password);

  /// **Registers a new user**
  Future<void> registerUser(AuthEntity user);

  /// **Logs out the current user**
  Future<void> logoutUser();

  /// **Fetches the current logged-in user (from API or Hive)**
  Future<AuthEntity> getCurrentUser();

  /// **Fetches a user by ID from the API**
  Future<AuthEntity> getUserById(String userId);

  /// **Fetches suggested users from the API**
  Future<List<AuthEntity>> getSuggestedUsers();

  /// **Edits the user profile (with optional image upload)**
  Future<void> editProfile(AuthEntity user, String? profileImagePath);

  /// **Follows or unfollows a user**
  Future<void> followOrUnfollow(String targetUserId);
}
