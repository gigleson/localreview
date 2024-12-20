import 'package:flutter/material.dart';
import 'package:localreview/view/splash_screen_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Ubantu Normal",
      ),
      title: "Local Review",
      home: const SplashScreenView(),
    );
  }
}
