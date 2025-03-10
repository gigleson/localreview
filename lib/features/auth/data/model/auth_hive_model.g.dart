// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthHiveModelAdapter extends TypeAdapter<AuthHiveModel> {
  @override
  final int typeId = 0;

  @override
  AuthHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthHiveModel(
      userId: fields[0] as String?,
      email: fields[1] as String,
      username: fields[2] as String,
      password: fields[3] as String,
      profilePicture: fields[4] as String,
      bio: fields[5] as String,
      gender: fields[6] as String?,
      followers: (fields[7] as List).cast<String>(),
      following: (fields[8] as List).cast<String>(),
      posts: (fields[9] as List).cast<String>(),
      bookmarks: (fields[10] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AuthHiveModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.profilePicture)
      ..writeByte(5)
      ..write(obj.bio)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.followers)
      ..writeByte(8)
      ..write(obj.following)
      ..writeByte(9)
      ..write(obj.posts)
      ..writeByte(10)
      ..write(obj.bookmarks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
