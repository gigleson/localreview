part of 'register_bloc.dart';
sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

/// **Event for User Registration**
class RegisterUserEvent extends RegisterEvent{
  final String userName;
  final String email;
  final String password;
  final BuildContext context;

  const RegisterUserEvent({
    required this.userName,
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  List<Object> get props => [userName, email, password, context];
}
