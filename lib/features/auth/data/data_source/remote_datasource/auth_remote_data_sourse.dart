import 'package:dio/dio.dart';
import 'package:localreview/app/constant/api_endpoint.dart';
import 'package:localreview/features/auth/data/data_source/auth_data_source.dart';

import 'package:localreview/features/auth/data/model/auth_api_modle.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  /// **Login User**
  // @override
  // Future<String> loginUser(String email, String password) async {
  //   try {
  //     var response = await _dio.post(
  //       ApiEndpoints.login,
  //       data: {
  //         'email': email,
  //         'password': password,
  //       },
  //     );
  //     // print(response.statusCode);
  //     if (response.statusCode == 200 && response.data['success']) {
  //       return response.data['token'];
  //     } else {
  //       throw Exception(response.data['message'] ?? 'Login failed');
  //     }
  //   } on DioException catch (e) {
  //     throw Exception(e.message);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
  Future<String> loginUser(String email, String password) async {
  try {
    var response = await _dio.post(
      ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );

    if (response.statusCode == 200 && response.data['success'] == true) {
      String token = response.headers['set-cookie']?[0]
              ?.split(';')[0]
              ?.replaceAll('token=', '') ??
          "";

      if (token.isEmpty) {
        throw Exception("Token not found in response.");
      }
      return token;
    } else {
      throw Exception(response.data['message'] ?? "Invalid login.");
    }
  } on DioException catch (e) {
    throw Exception(e.message);
  } catch (e) {
    throw Exception(e.toString());
  }
}


  /// **Register User**
  @override
  Future<void> registerUser(AuthEntity authEntity) async {
    try {
      var authApiModel = AuthApiModel.fromEntity(authEntity);
      var response = await _dio.post(
        ApiEndpoints.register,
        data: authApiModel.toJson(),
      );
      if (response.statusCode != 201) {
        throw Exception(response.data['message'] ?? 'Registration failed');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Logout User**
  @override
  Future<void> logoutUser() async {
    try {
      await _dio.get(ApiEndpoints.logout);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Get Current User**
  @override
  Future<AuthEntity> getCurrentUser() async {
    try {
      Response response = await _dio.get(ApiEndpoints.getCurrentUser);
      if (response.statusCode == 200 && response.data['success']) {
        return AuthApiModel.fromJson(response.data['user']).toEntity();
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch user');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Get User by ID**
  @override
  Future<AuthEntity> getUserById(String userId) async {
    try {
      Response response = await _dio.get('${ApiEndpoints.getUserById}/$userId');
      if (response.statusCode == 200 && response.data['success']) {
        return AuthApiModel.fromJson(response.data['user']).toEntity();
      } else {
        throw Exception(response.data['message'] ?? 'User not found');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Get Suggested Users**
  @override
  Future<List<AuthEntity>> getSuggestedUsers() async {
    try {
      Response response = await _dio.get(ApiEndpoints.getSuggestedUsers);
      if (response.statusCode == 200 && response.data['success']) {
        return (response.data['users'] as List)
            .map((json) => AuthApiModel.fromJson(json).toEntity())
            .toList();
      } else {
        throw Exception(response.data['message'] ?? 'No suggested users found');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Edit User Profile**
  @override
  Future<void> editProfile(AuthEntity user, String? profileImagePath) async {
    try {
      FormData formData = FormData.fromMap(user.toJson());

      if (profileImagePath != null) {
        formData.files.add(MapEntry(
          "profilePhoto",
          await MultipartFile.fromFile(profileImagePath),
        ));
      }

      var response = await _dio.post(ApiEndpoints.editProfile, data: formData);

      if (response.statusCode != 200 || !response.data['success']) {
        throw Exception(response.data['message'] ?? 'Profile update failed');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// **Follow or Unfollow a User**
  @override
  Future<void> followOrUnfollow(String targetUserId) async {
    try {
      var response =
          await _dio.post('${ApiEndpoints.followOrUnfollow}/$targetUserId');

      if (response.statusCode != 200 || !response.data['success']) {
        throw Exception(
            response.data['message'] ?? 'Failed to follow/unfollow');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
