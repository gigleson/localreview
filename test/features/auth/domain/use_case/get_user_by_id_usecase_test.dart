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
    // Test: Get user by ID successfully
    // test('should fetch user by ID successfully', () async {
    //   // Arrange
    //   const userId = '123';
    //   when(() => mockDio.get(any())).thenAnswer(
    //     (_) async => Response(
    //       requestOptions: RequestOptions(path: ''),
    //       statusCode: 200,
    //       data: {'success': true, 'user': {'email': email}},
    //     ),
    //   );

    //   // Act
    //   final result = await authRemoteDataSource.getUserById(userId);

    //   // Assert
    //   expect(result.email, email);
    //   verify(() => mockDio.get(any())).called(1);
    // });

    // Test: Get user by ID fails
    test('should throw an exception when getUserById fails', () async {
      // Arrange
      const userId = '123';
      when(() => mockDio.get(any())).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 400,
          data: {'message': 'User not found'},
        ),
      );

      // Act
      final call = authRemoteDataSource.getUserById(userId);

      // Assert
      expect(() => call, throwsException);
    });
  });
}
