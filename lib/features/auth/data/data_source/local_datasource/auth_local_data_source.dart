import 'package:localreview/core/network/hive_service.dart';
import 'package:localreview/features/auth/data/data_source/auth_data_source.dart';
import 'package:localreview/features/auth/data/model/auth_hive_model.dart';

import 'package:localreview/features/auth/domain/entity/auth_entity.dart';

class AuthLocalDataSource implements IAuthDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  /// **Get Current User from Local Storage**
  @override
  Future<AuthEntity> getCurrentUser() async {
    try {
      final user = await _hiveService.getCurrentUser();
      if (user != null) {
        return Future.value(user.toEntity());
      } else {
        return Future.error("No user found in local storage.");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  /// **Login User from Local Storage**
  @override
  Future<String> loginUser(String email, String password) async {
    try {
      final user = await _hiveService.login(email, password);
      if (user != null) {
        return Future.value("Success");
      } else {
        return Future.error("Invalid email or password.");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  /// **Register User in Local Storage**
  @override
  Future<void> registerUser(AuthEntity user) async {
    try {
      final authHiveModel = AuthHiveModel.fromEntity(user);
      await _hiveService.register(authHiveModel);
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }

  /// **Get All Users from Local Storage**
  @override
  Future<List<AuthEntity>> getAllUsers() async {
    try {
      final users = await _hiveService.getAllAuth();
      return users.map((user) => user.toEntity()).toList();
    } catch (e) {
      return Future.error(e);
    }
  }

  /// **Get User by ID from Local Storage**
  @override
  Future<AuthEntity> getUserById(String userId) async {
    try {
      final users = await _hiveService.getAllAuth();
      final user = users.firstWhere((u) => u.userId == userId, orElse: () => AuthHiveModel.initial());
      if (user.userId == "") {
        return Future.error("User not found.");
      }
      return Future.value(user.toEntity());
    } catch (e) {
      return Future.error(e);
    }
  }

  /// **Logout User from Local Storage**
  @override
  Future<void> logoutUser() async {
    try {
      await _hiveService.clearAuthBox();
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }

  /// **Edit Profile in Local Storage (Only for Offline Mode)**
  @override
  Future<void> editProfile(AuthEntity user, String? profileImagePath) async {
    try {
      final authHiveModel = AuthHiveModel.fromEntity(user);
      await _hiveService.register(authHiveModel);
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }

  /// **Follow or Unfollow User (Locally)**
  @override
  Future<void> followOrUnfollow(String targetUserId) async {
    try {
      final currentUser = await getCurrentUser();
      if (currentUser.following.contains(targetUserId)) {
        currentUser.following.remove(targetUserId);
      } else {
        currentUser.following.add(targetUserId);
      }
      await editProfile(currentUser, null);
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }
  
  @override
  Future<List<AuthEntity>> getSuggestedUsers() {
    // TODO: implement getSuggestedUsers
    throw UnimplementedError();
  }
}
