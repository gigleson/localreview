import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localreview/features/onbording/presentation/view/onbording_screen_view.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localreview/features/onbording/presentation/view_model/onbordign_cubit.dart';


class MockOnboardingCubit extends Mock implements OnboardingCubit {
  @override
  Stream<void> get stream => Stream.empty(); // Fix for null stream issue
}

class FakeBuildContext extends Fake implements BuildContext {} // Create a fake BuildContext

void main() {
  late MockOnboardingCubit mockOnboardingCubit;

  setUpAll(() {
    registerFallbackValue(FakeBuildContext()); // Fix for BuildContext issue
  });

  setUp(() {
    mockOnboardingCubit = MockOnboardingCubit();
  });

  testWidgets('navigates to login when Get Started is tapped', (WidgetTester tester) async {
    when(() => mockOnboardingCubit.navigateToLogin(any())).thenReturn(null); // Mock navigation function

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<OnboardingCubit>.value(
          value: mockOnboardingCubit,
          child: const OnboardingScreenView(),
        ),
      ),
    );

    // Navigate to last page
    for (int i = 0; i < 2; i++) {
      await tester.drag(find.byType(PageView), const Offset(-500, 0));
      await tester.pumpAndSettle();
    }

    // Tap "Get Started" button
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Verify navigation was called
    verify(() => mockOnboardingCubit.navigateToLogin(any())).called(1);
  });

  testWidgets('navigates to next page when Next button is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<OnboardingCubit>.value(
          value: mockOnboardingCubit,
          child: const OnboardingScreenView(),
        ),
      ),
    );

    // Tap "Next" button twice to reach the last screen
    for (int i = 0; i < 2; i++) {
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
    }

    // Ensure "Get Started" button is now visible
    expect(find.text('Get Started'), findsOneWidget);
  });
  // testWidgets('navigates to login when Get Started is tapped', (WidgetTester tester) async {
  //   when(() => mockOnboardingCubit.navigateToLogin(any())).thenReturn(null); // Mock navigation function

  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: BlocProvider<OnboardingCubit>.value(
  //         value: mockOnboardingCubit,
  //         child: const OnboardingScreenView(),
  //       ),
  //     ),
  //   );

  //   // Navigate to last page
  //   await tester.drag(find.byType(PageView), const Offset(-500, 0));
  //   await tester.pumpAndSettle();

  //   // Tap "Get Started" button
  //   await tester.tap(find.text('Get Started'));
  //   await tester.pumpAndSettle();

  //   // Verify navigation was called
  //   verify(() => mockOnboardingCubit.navigateToLogin(any())).called(1);
  // });
}
