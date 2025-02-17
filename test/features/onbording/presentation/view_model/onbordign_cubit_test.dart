import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:localreview/features/auth/presentation/view/login/login_screen_view.dart';
import 'package:localreview/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:localreview/features/onbording/presentation/view_model/onbordign_cubit.dart';

class MockLoginBloc extends Mock implements LoginBloc {}

void main() {
  late MockLoginBloc mockLoginBloc;
  late OnboardingCubit onboardingCubit;

  setUp(() {
    mockLoginBloc = MockLoginBloc();
    onboardingCubit = OnboardingCubit(mockLoginBloc);
  });

testWidgets('OnboardingCubit navigates to LoginScreenView', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: BlocProvider<OnboardingCubit>.value(
        value: onboardingCubit,
        child: Builder(
          builder: (context) {
            // Delay navigation until after build is complete
            WidgetsBinding.instance.addPostFrameCallback((_) {
              onboardingCubit.navigateToLogin(context);
            });
            return const Scaffold(body: Text('Onboarding Screen'));
          },
        ),
      ),
    ),
  );

  await tester.pumpAndSettle(); // Wait for navigation

  expect(find.byType(LoginScreenView), findsOneWidget);
});

}
