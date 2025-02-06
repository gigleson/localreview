import 'package:hive_flutter/hive_flutter.dart';
import 'package:localreview/app/constant/hive_table_constant.dart';
import 'package:localreview/features/auth/data/model/auth_hive_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<void> init() async {
    // Initialize the database
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}_localreview';

    Hive.init(path);

    // Register Adapters

    Hive.registerAdapter(AuthHiveModelAdapter());
  }

/*
  register box
  {
    fname : "asd",
    lname : "asd",
    batch : {batchId : 1, batchName : "Batch 1"},
    courses : [{courseId : 1, courseName : "Course 1"}, {courseId : 2, courseName : "Course 2"}],
  }
*/

// OR

/*
 {
    fname : "asd",
    lname : "asd",
    batch : 1,
    courses : [1,3,4],
  }
*/

  // Auth Queries
  Future<void> register(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(auth.userId, auth);
  }

  Future<void> deleteAuth(String id) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.delete(id);
  }

  Future<List<AuthHiveModel>> getAllAuth() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    return box.values.toList();
  }

  // Login using username and password
  Future<AuthHiveModel?> login(String username, String password) async {
    // var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
    // var auth = box.values.firstWhere(
    //     (element) =>
    //         element.username == username && element.password == password,
    //     orElse: () => AuthHiveModel.initial());
    // return auth;

    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var user = box.values.firstWhere((element) =>
        element.userName == username && element.password == password);
    box.close();
    return user;
  }

  // Future<void> clearAll() async {
  //   await Hive.deleteBoxFromDisk(HiveTableConstant.batchBox);
  //   await Hive.deleteBoxFromDisk(HiveTableConstant.courseBox);
  //   await Hive.deleteBoxFromDisk(HiveTableConstant.studentBox);
  // }

  // // Clear Student Box
  // Future<void> clearStudentBox() async {
  //   await Hive.deleteBoxFromDisk(HiveTableConstant.studentBox);
  // }

  // Future<void> close() async {
  //   await Hive.close();
  // }
}
