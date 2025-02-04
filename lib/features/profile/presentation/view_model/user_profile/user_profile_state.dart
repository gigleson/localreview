part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? imageName;

  const UserProfileState({
    required this.isLoading,
    required this.isSuccess,
    this.imageName,
  });

   const UserProfileState.initial()
      : isLoading = false,
        isSuccess = false,
        imageName = null;

   UserProfileState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? imageName,
  }) {
    return UserProfileState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      imageName: imageName ?? this.imageName,
    );
  }     
  @override
  List<Object?> get props => [isLoading, isSuccess, imageName];
}
