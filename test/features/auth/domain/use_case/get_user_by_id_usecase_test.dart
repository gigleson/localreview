import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/use_case/get_user_by_id_usecase.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';


void main() {
  late GetUserByIdUseCase usecase;
  late AuthRepoMock mockAuthRepository;

  setUp(() {
    mockAuthRepository = AuthRepoMock();
    usecase = GetUserByIdUseCase(mockAuthRepository);
  });

  const tUserId = 'testUserId';
  const tAuthEntity = AuthEntity(
      userId: 'user1',
      email: 'user1@example.com',
      password: "password",
      userName: "password",
      createdAt: "password",
      lastLogin: "password",
      status: "active");

  test(
    'Should return an AuthEntity when getUserById is successful',
    () async {
      // Arrange
      when(() => mockAuthRepository.getUserById(tUserId))
          .thenAnswer((_) async => const Right(tAuthEntity));

      // Act
      final result = await usecase(tUserId);

      // Assert
      expect(result, const Right(tAuthEntity));

      // Verify that the repository method was called with the correct data
      verify(() => mockAuthRepository.getUserById(tUserId)).called(1);

      // Ensure no other methods were called on the repository
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  test(
    'Should return a Failure when getUserById fails',
    () async {
      // Arrange
      const tFailure = ApiFailure(message: 'Failed to get user by ID.');
      when(() => mockAuthRepository.getUserById(tUserId))
          .thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await usecase(tUserId);

      // Assert
      expect(result, const Left(tFailure));

      // Verify that the repository method was called with the correct data
      verify(() => mockAuthRepository.getUserById(tUserId)).called(1);

      // Ensure no other methods were called on the repository
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
