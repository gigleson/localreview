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

    


    test('should throw an exception when getCurrentUser fails', () async {
      // Arrange
      when(() => mockDio.get(any())).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 400,
          data: {'message': 'Failed to fetch user'},
        ),
      );

      // Act
      final call = authRemoteDataSource.getCurrentUser();

      // Assert
      expect(() => call, throwsException);
    });


  });
}
