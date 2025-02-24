part of 'user_profile_bloc.dart';

sealed class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class UploadImage extends UserProfileEvent {
  final File file;

  const UploadImage({
    required this.file,
  });
}

class CreateUserProfile extends UserProfileEvent {
  final BuildContext context;
  final String? bio;

  final String? image;

  const CreateUserProfile({
    required this.context,
    this.bio,
    this.image,
  });
}