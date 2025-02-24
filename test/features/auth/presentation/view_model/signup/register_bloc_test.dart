import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/use_case/register_user.dart';
import 'package:localreview/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:mocktail/mocktail.dart';

import 'signin_usecase.moke.dart';

// Create a dummy instance of RegisterUserParams
class RegisterUserParamsFake extends Fake implements RegisterUserParams {}

// Create a mock class for BuildContext
class MockBuildContext extends Mock implements BuildContext {}

void main() {
  // Register fallback value for RegisterUserParams
  setUpAll(() {
    registerFallbackValue(RegisterUserParamsFake());
  });

  late RegisterBloc registerBloc;
  late MockRegisterUseCase mockRegisterUseCase;

  setUp(() {
    mockRegisterUseCase = MockRegisterUseCase();
    registerBloc = RegisterBloc(registerUseCase: mockRegisterUseCase);
  });

  group('RegisterBloc', () {
    test('initial state is RegisterState.initial()', () {
      expect(registerBloc.state, RegisterState.initial());
    });

    // blocTest<RegisterBloc, RegisterState>(
    //   'emits [loading, success] when registration is successful',
    //   build: () {
    //     when(() => mockRegisterUseCase.call(any())).thenAnswer(
    //         (_) async => const Right(true)); // Return Right for success
    //     return registerBloc;
    //   },
    //   act: (bloc) {
    //     bloc.add(RegisterStudent(
    //       context: MockBuildContext(), // Use the mock context here
    //       email: 'test@example.com',
    //       userName: 'Test User',
    //       password: 'password123',
    //       createdAt: DateTime.now().toString(),
    //       lastLogin: DateTime.now().toString(),
    //       status: 'active',
    //     ));
    //   },
    //   expect: () => [
    //     registerBloc.state.copyWith(isLoading: true),
    //     registerBloc.state.copyWith(isLoading: false, isSuccess: true),
    //   ],
    // );

    blocTest<RegisterBloc, RegisterState>(
      'emits [loading, failure] when registration fails due to LocalDatabaseFailure',
      build: () {
        // Return Left with LocalDatabaseFailure
        when(() => mockRegisterUseCase.call(any())).thenAnswer(
            (_) async => const Left(ApiFailure(message: 'Database error')));
        return registerBloc;
      },
      act: (bloc) {
        bloc.add(RegisterStudent(
          context: MockBuildContext(),
          email: 'test@example.com',
          userName: 'Test User',
          password: 'password123',
          createdAt: DateTime.now().toString(),
          lastLogin: DateTime.now().toString(),
          status: 'active',
        ));
      },
      expect: () => [
        registerBloc.state.copyWith(isLoading: true),
        registerBloc.state.copyWith(isLoading: false, isSuccess: false),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [loading, failure] when registration fails due to ApiFailure',
      build: () {
        // Return Left with ApiFailure
        when(() => mockRegisterUseCase.call(any())).thenAnswer((_) async =>
            const Left(ApiFailure(message: 'API error', statusCode: 500)));
        return registerBloc;
      },
      act: (bloc) {
        bloc.add(RegisterStudent(
          context: MockBuildContext(),
          email: 'test@example.com',
          userName: 'Test User',
          password: 'password123',
          createdAt: DateTime.now().toString(),
          lastLogin: DateTime.now().toString(),
          status: 'active',
        ));
      },
      expect: () => [
        registerBloc.state.copyWith(isLoading: true),
        registerBloc.state.copyWith(isLoading: false, isSuccess: false),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [loading, failure] when registration fails due to SharedPrefsFailure',
      build: () {
        // Return Left with SharedPrefsFailure
        when(() => mockRegisterUseCase.call(any())).thenAnswer((_) async =>
            const Left(SharedPrefsFailure(message: 'SharedPrefs error')));
        return registerBloc;
      },
      act: (bloc) {
        bloc.add(RegisterStudent(
          context: MockBuildContext(),
          email: 'test@example.com',
          userName: 'Test User',
          password: 'password123',
          createdAt: DateTime.now().toString(),
          lastLogin: DateTime.now().toString(),
          status: 'active',
        ));
      },
      expect: () => [
        registerBloc.state.copyWith(isLoading: true),
        registerBloc.state.copyWith(isLoading: false, isSuccess: false),
      ],
    );
  });
}
