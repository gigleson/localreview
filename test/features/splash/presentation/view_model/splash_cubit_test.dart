import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localreview/features/onbording/presentation/view/onbording_screen_view.dart';
import 'package:localreview/features/onbording/presentation/view_model/onbordign_cubit.dart';
import 'package:localreview/features/splash/presentation/view/splash_screen_view.dart';
import 'package:localreview/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockOnboardingCubit extends Mock implements OnboardingCubit {}

void main() {
  late MockOnboardingCubit mockOnboardingCubit;
  late SplashCubit splashCubit;

  setUp(() {
    mockOnboardingCubit = MockOnboardingCubit();
    splashCubit = SplashCubit(mockOnboardingCubit);
  });

  testWidgets('SplashCubit navigates to OnboardingScreenView', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<SplashCubit>.value(
          value: splashCubit,
          child: const SplashScreenView(),
        ),
      ),
    );

    await tester.pumpAndSettle(); // Wait for navigation to complete

    expect(find.byType(OnboardingScreenView), findsOneWidget);
  });
}
