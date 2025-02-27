

import 'package:localreview/features/auth/domain/entity/auth_entity.dart';



abstract interface class IAuthDataSource {
  Future<String> loginUser(String username, String password);

  Future<void> registerUser(AuthEntity user);

  Future<AuthEntity> getCurrentUser();
  Future<AuthEntity> getUserById(String userId);
  Future<List<AuthEntity>> getAllUsers();

}
