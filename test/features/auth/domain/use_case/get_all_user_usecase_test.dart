import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/use_case/getSuggested_useCase.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';

void main() {
  late GetAllUsersUseCase usecase;
  late AuthRepoMock mockAuthRepository;

  setUp(() {
    mockAuthRepository = AuthRepoMock();
    usecase = GetAllUsersUseCase(mockAuthRepository);
  });

  final tAuthEntities = [
    const AuthEntity(
        userId: 'user1',
        email: 'user1@example.com',
        password: "password",
        userName: "password",
        createdAt: "password",
        lastLogin: "password",
        status: "active"),
    const AuthEntity(
        userId: 'user2',
        email: 'user1@example.com',
        password: "password",
        userName: "password",
        createdAt: "password",
        lastLogin: "password",
        status: "active"),
  ];

  test(
    'Should return a list of AuthEntities when getAllUsers is successful',
    () async {
      // Arrange
      when(() => mockAuthRepository.getAllUsers())
          .thenAnswer((_) async => Right(tAuthEntities));

      // Act
      final result = await usecase();

      // Assert
      expect(result, Right(tAuthEntities));

      // Verify
      verify(() => mockAuthRepository.getAllUsers()).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  test(
    'Should return a Failure when getAllUsers fails',
    () async {
      // Arrange
      const tFailure = ApiFailure(message: 'Failed to get all users.');
      when(() => mockAuthRepository.getAllUsers())
          .thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await usecase();

      // Assert
      expect(result, const Left(tFailure));

      // Verify
      verify(() => mockAuthRepository.getAllUsers()).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
