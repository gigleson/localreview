part of 'post_bloc.dart';


class PostState {
  final bool isLoading;
  final bool isSuccess;

  PostState({
    required this.isLoading,
    required this.isSuccess,
  });

  PostState.initial()
      : isLoading = false,
        isSuccess = false;

  PostState copyWith({
    bool? isLoading,
    bool? isSuccess,
  }) {
    return PostState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}