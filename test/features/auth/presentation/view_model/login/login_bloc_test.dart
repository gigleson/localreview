import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localreview/features/auth/presentation/view/signup/signup_screen_view.dart';
import 'package:mocktail/mocktail.dart';
import 'package:localreview/features/auth/presentation/view/login/login_screen_view.dart';
import 'package:localreview/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:localreview/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:localreview/features/home/presentation/view/navbar_view.dart';
import 'package:localreview/features/home/presentation/view_model/home_cubit.dart';
import 'package:localreview/features/profile/presentation/view/user_profile_view.dart';
import 'package:localreview/features/profile/presentation/view_model/user_profile/user_profile_bloc.dart';
import 'package:localreview/features/auth/domain/use_case/login_usecase.dart';

class MockRegisterBloc extends Mock implements RegisterBloc {}
class MockHomeCubit extends Mock implements HomeCubit {}
class MockUserProfileBloc extends Mock implements UserProfileBloc {}
class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() {
  late MockRegisterBloc mockRegisterBloc;
  late MockHomeCubit mockHomeCubit;
  late MockUserProfileBloc mockUserProfileBloc;
  late MockLoginUseCase mockLoginUseCase;
  late LoginBloc loginBloc;

  setUp(() {
    mockRegisterBloc = MockRegisterBloc();
    mockHomeCubit = MockHomeCubit();
    mockUserProfileBloc = MockUserProfileBloc();
    mockLoginUseCase = MockLoginUseCase();
    loginBloc = LoginBloc(
      registerBloc: mockRegisterBloc,
      homeCubit: mockHomeCubit,
      loginUseCase: mockLoginUseCase,
      userProfileBloc: mockUserProfileBloc,
    );
  });

  testWidgets('LoginBloc navigates to RegisterScreenView', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginBloc>.value(
          value: loginBloc,
          child: Builder(
            builder: (context) {
              loginBloc.add(NavigateRegisterScreenEvent(
                context: context,
                destination: const SignupScreenView(),
              ));
              return const Scaffold(body: Text('Login Screen'));
            },
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(SignupScreenView), findsOneWidget);
  });

  testWidgets('LoginBloc navigates to HomeScreenView', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginBloc>.value(
          value: loginBloc,
          child: Builder(
            builder: (context) {
              loginBloc.add(NavigateHomeScreenEvent(
                context: context,
                destination: const BottomNavationView(),
              ));
              return const Scaffold(body: Text('Login Screen'));
            },
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(BottomNavationView), findsOneWidget);
  });

  testWidgets('LoginBloc navigates to UserProfileScreenView', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginBloc>.value(
          value: loginBloc,
          child: Builder(
            builder: (context) {
              loginBloc.add(NavigateUserProfileScreenEvent(
                context: context,
                destination: const ProfileScreen(),
              ));
              return const Scaffold(body: Text('Login Screen'));
            },
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(ProfileScreen), findsOneWidget);
  });
}
