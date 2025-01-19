import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localreview/app/di/di.dart';
import 'package:localreview/features/splash/presentation/view/splash_screen_view.dart';
import 'package:localreview/features/splash/presentation/view_model/splash_cubit.dart';

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
        home: BlocProvider.value(
          value: getIt<SplashCubit>(),
          child: const SplashScreenView(),
        ));
  }
}
