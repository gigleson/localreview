part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final bool isSuccess;

  const RegisterState({
    required this.isLoading,
    required this.isSuccess,
  });

  /// **Initial State**
  factory RegisterState.initial() => const RegisterState(
        isLoading: false,
        isSuccess: false,
      );

  /// **CopyWith for State Updates**
  RegisterState copyWith({
    bool? isLoading,
    bool? isSuccess,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object> get props => [isLoading, isSuccess];
}
