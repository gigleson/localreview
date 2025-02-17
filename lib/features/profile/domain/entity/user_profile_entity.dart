import 'package:equatable/equatable.dart';

class UserProfileEntity extends Equatable {
  final String? bio;
  final String? image;

  const UserProfileEntity({this.bio, this.image});

  const UserProfileEntity.empty()
      : bio = "_empty.bio",
        image = "_empty.image";

  @override
  // TODO: implement props
  List<Object?> get props => [image, bio];
}
