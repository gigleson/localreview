part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class LoadCoursesAndBatches extends RegisterEvent {}

class RegisterStudent extends RegisterEvent {
  final BuildContext context;
  final String email;
  final String userName;
  final String password;
  final String status;
  final String lastLogin;
  final String createdAt;

  const RegisterStudent({
    required this.context,
    required this.email,
    required this.userName,
    required this.password,
    required this.createdAt,
    required this.lastLogin,
    required this.status,
  });
}
