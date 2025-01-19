import 'package:flutter/material.dart';
import 'package:localreview/app/app.dart';
import 'package:localreview/app/di/di.dart';
import 'package:localreview/core/network/hive_service.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(const App());
} 