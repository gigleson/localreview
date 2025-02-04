import 'package:equatable/equatable.dart';

class UserProfileEntity extends Equatable{
  final String? bio;
  final String? image;

  UserProfileEntity({this.bio, this.image});


  @override
  // TODO: implement props
  List<Object?> get props => [image,bio];
}
