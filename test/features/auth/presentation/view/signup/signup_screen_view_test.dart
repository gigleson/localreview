import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localreview/features/auth/presentation/view/signup/signup_screen_view.dart';
import 'package:localreview/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterBloc extends Mock implements RegisterBloc {}

void main() {
  group('SignupScreenView', () {
    late RegisterBloc registerBloc;

    setUp(() {
      registerBloc = MockRegisterBloc();
    });

    testWidgets('should display the correct widgets', (WidgetTester tester) async {
      // Build the SignupScreenView inside a BlocProvider to provide the RegisterBloc
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<RegisterBloc>(
            create: (_) => registerBloc,
            child: const SignupScreenView(),
          ),
        ),
      );

      // Check if the form fields are displayed
      expect(find.text('Create Your Account'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(4)); // 4 fields: Name, Email, Password, Confirm Password
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    // testWidgets('should call RegisterBloc when the form is valid and submitted', (WidgetTester tester) async {
    //   // Build the SignupScreenView inside a BlocProvider to provide the RegisterBloc
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: BlocProvider<RegisterBloc>(
    //         create: (_) => registerBloc,
    //         child: const SignupScreenView(),
    //       ),
    //     ),
    //   );

    //   // Enter some valid data in the form fields
    //   await tester.enterText(find.byType(TextFormField).at(0), 'John Doe'); // Name
    //   await tester.enterText(find.byType(TextFormField).at(1), 'john.doe@example.com'); // Email
    //   await tester.enterText(find.byType(TextFormField).at(2), 'password123'); // Password
    //   await tester.enterText(find.byType(TextFormField).at(3), 'password123'); // Confirm Password

    //   // Tap the submit button
    //   await tester.tap(find.byType(ElevatedButton));
    //   await tester.pump();

    //   // Verify that the RegisterBloc event is called (this ensures that form submission is handled)
    //   verify(registerBloc.add(RegisterUserEvent(
    //     context: anyNamed('context'),
    //     email: 'john.doe@example.com',
    //     userName: 'John Doe',
    //     password: 'password123',
    //   ))).called(1);
    // // });

    // testWidgets('should show validation error if fields are empty', (WidgetTester tester) async {
    //   // Build the SignupScreenView inside a BlocProvider to provide the RegisterBloc
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: BlocProvider<RegisterBloc>(
    //         create: (_) => registerBloc,
    //         child: const SignupScreenView(),
    //       ),
    //     ),
    //   );

    //   // Tap the submit button without entering any text
    //   await tester.tap(find.byType(ElevatedButton));
    //   await tester.pump();

    //   // Verify if validation error messages are shown
    //   expect(find.text('Name is required'), findsOneWidget);
    //   expect(find.text('Email is required'), findsOneWidget);
    //   expect(find.text('Password is required'), findsOneWidget);
    //   expect(find.text('Passwords do not match'), findsOneWidget);
    // });
  });
}
