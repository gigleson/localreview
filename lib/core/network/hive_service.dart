import 'package:hive_flutter/hive_flutter.dart';
import 'package:localreview/app/constant/hive_table_constant.dart';
import 'package:localreview/features/auth/data/model/auth_hive_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}/localreview';

    Hive.init(path);

    // Register Adapters
    Hive.registerAdapter(AuthHiveModelAdapter());

    // Open the User Box
    await Hive.openBox<AuthHiveModel>(HiveTableConstant.authBox);
  }

  /// **Register a User in Hive**
  Future<void> register(AuthHiveModel auth) async {
    var box = Hive.box<AuthHiveModel>(HiveTableConstant.authBox);
    await box.put(auth.userId, auth);
  }

  /// **Delete User from Hive**
  Future<void> deleteAuth(String id) async {
    var box = Hive.box<AuthHiveModel>(HiveTableConstant.authBox);
    await box.delete(id);
  }

  /// **Get All Users from Hive**
  Future<List<AuthHiveModel>> getAllAuth() async {
    var box = Hive.box<AuthHiveModel>(HiveTableConstant.authBox);
    return box.values.toList();
  }

  /// **Login Using Username & Password**
  Future<AuthHiveModel?> login(String email, String password) async {
    var box = Hive.box<AuthHiveModel>(HiveTableConstant.authBox);
    var user = box.values.firstWhere(
      (element) => element.email == email && element.password == password,
      orElse: () => AuthHiveModel.initial(),
    );
    return user.userId == "" ? null : user;
  }

  /// **Get Current User from Hive**
  Future<AuthHiveModel?> getCurrentUser() async {
    var box = Hive.box<AuthHiveModel>(HiveTableConstant.authBox);
    return box.isNotEmpty ? box.values.first : null;
  }

  /// **Clear User Box**
  Future<void> clearAuthBox() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.authBox);
  }
}
