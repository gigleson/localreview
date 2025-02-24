import 'dart:io';

import 'package:dio/dio.dart';
import 'package:localreview/app/constant/api_endpoint.dart';
import 'package:localreview/features/profile/data/data_source/user_profile_data_source.dart';
import 'package:localreview/features/profile/domain/entity/user_profile_entity.dart';


class UserRemoteProfineDataSource implements IUserProfileDataSource {
  final Dio _dio;

  UserRemoteProfineDataSource(this._dio);

  @override
  Future<void> createUserProfile(UserProfileEntity userinfo) async{
        try {
      Response response = await _dio.post(
        ApiEndpoints.createUserProfile,
        data: {
          "bio": userinfo.bio,
          "image": userinfo.image,
        },
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
  
  @override
  Future<String> uploadProfilePicture(File file) async{
       try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'profilePicture': await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        },
      );

      Response response = await _dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      if (response.statusCode == 200) {
        // Extract the image name from the response
        final str = response.data['data'];

        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
