import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localreview/features/auth/data/data_source/remote_datasource/auth_remote_data_sourse.dart';
import 'package:mocktail/mocktail.dart';

import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/data/model/auth_api_modle.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late AuthRemoteDataSource authRemoteDataSource;

  setUp(() {
    mockDio = MockDio();
    authRemoteDataSource = AuthRemoteDataSource(mockDio);
  });

  group('AuthRemoteDataSource Tests', () {
    const email = 'test@example.com';
    const password = 'password123';
    const token = 'test-token';
    final user = AuthEntity(
      email: email,
      password: password,
      username: 'testUser',
      profilePicture: '',
      bio: '',
      followers: [],
      following: [],
      posts: [],
      bookmarks: [],
    );

    
        // Test: Edit profile successfully
    test('should edit profile successfully', () async {
      // Arrange
      when(() => mockDio.post(
            any(),
            data: any(named: 'data'),
          )).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
          data: {'success': true},
        ),
      );

      // Act
      await authRemoteDataSource.editProfile(user, null);

      // Assert
      verify(() => mockDio.post(any(), data: any(named: 'data'))).called(1);
    });

    // Test: Edit profile fails
    test('should throw an exception when edit profile fails', () async {
      // Arrange
      when(() => mockDio.post(
            any(),
            data: any(named: 'data'),
          )).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 400,
          data: {'message': 'Profile update failed'},
        ),
      );

      // Act
      final call = authRemoteDataSource.editProfile(user, null);

      // Assert
      expect(() => call, throwsException);
    });

  });
}
