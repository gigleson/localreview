import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localreview/features/auth/presentation/view/login/login_screen_view.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:localreview/features/auth/presentation/view_model/login/login_bloc.dart';

class MockLoginBloc extends Mock implements LoginBloc {}


class FakeLoginStudentEvent extends Fake implements LoginStudentEvent {}

void main() {

  late MockLoginBloc mockLoginBloc;

  setUp(() {
    mockLoginBloc = MockLoginBloc();
  });

  setUpAll(() {
    registerFallbackValue(FakeLoginStudentEvent());
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<LoginBloc>.value(
        value: mockLoginBloc,
        child: const LoginScreenView(),
      ),
    );
  }

  testWidgets('Renders LoginScreenView correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Welcome Back,'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
  });

  // testWidgets('Validates form fields correctly', (WidgetTester tester) async {
  //   await tester.pumpWidget(createWidgetUnderTest());

  //   // Ensure email field is visible
  //   final emailField = find.byKey(Key('emailField'));
  //   await tester.ensureVisible(emailField);
  //   await tester.tap(emailField);
  //   await tester.enterText(emailField, '');
  //   await tester.pump();

  //   // Check for validation message
  //   expect(find.text('Please enter an email'), findsOneWidget);
  // });
  
  // testWidgets('Triggers login event when form is valid',
  //     (WidgetTester tester) async {
  //      await tester.pumpWidget(createWidgetUnderTest());

  //   // Ensure email and password fields are visible
  //   final emailField = find.byKey(Key('emailField'));
  //   final passwordField = find.byKey(Key('passwordField'));
  //   final loginButton = find.text('Login');

  //   await tester.ensureVisible(emailField);
  //   await tester.enterText(emailField, 'test@example.com');

  //   await tester.ensureVisible(passwordField);
  //   await tester.enterText(passwordField, 'password123');

  //   await tester.ensureVisible(loginButton);
  //   await tester.tap(loginButton);
  //   await tester.pumpAndSettle();

  //   // Verify login event is fired
  //   verify(() => mockLoginBloc.add(any())).called(1);
  // });
}
