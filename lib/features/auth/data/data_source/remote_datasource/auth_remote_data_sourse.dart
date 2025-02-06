import 'dart:io';

import 'package:dio/dio.dart';
import 'package:localreview/app/constant/api_endpoint.dart';
import 'package:localreview/features/auth/data/data_source/auth_data_source.dart';
import 'package:localreview/features/auth/data/model/auth_api_modle.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);


 

  

  @override
  Future<AuthEntity> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<String> loginUser(String username, String password) async{
    try {
      var response = await _dio.post(
        ApiEndpoints.login,
        data: {
          'email': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
         final str = response.data['token'];
        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> registerUser(AuthEntity authEntity) async{
     try {
      // Convert entity to model
      var studentApiModel = AuthApiModel.fromEntity(authEntity);
      var response = await _dio.post(
        ApiEndpoints.register,
        data: studentApiModel.toJson(),
      );
      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
