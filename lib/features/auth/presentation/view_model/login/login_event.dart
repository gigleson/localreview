part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class NavigateRegisterScreenEvent extends LoginEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateRegisterScreenEvent({
    required this.context,
    required this.destination,
  });
}

class NavigateHomeScreenEvent extends LoginEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateHomeScreenEvent({
    required this.context,
    required this.destination,
  });
}

class LoginStudentEvent extends LoginEvent {
  final BuildContext context;
  final String username;
  final String password;

  const LoginStudentEvent({
    required this.context,
    required this.username,
    required this.password,
  });
}

class NavigateUserProfileScreenEvent extends LoginEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateUserProfileScreenEvent({
    required this.context,
    required this.destination,
  });
}
class NavigateCreatePostScreen extends LoginEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateCreatePostScreen({
    required this.context,
    required this.destination,
  });
}
