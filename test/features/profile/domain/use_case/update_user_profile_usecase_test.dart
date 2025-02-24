import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/profile/domain/entity/user_profile_entity.dart';
import 'package:localreview/features/profile/domain/use_case/update_user_profile_usecase.dart';
import 'package:mocktail/mocktail.dart';

import 'profile_repo_mock.dart';

void main() {
  late UpdateUserUseCase usecase;
  late ProfileRepoMock mockAuthRepository;

  setUp(() {
    mockAuthRepository = ProfileRepoMock();
    usecase = UpdateUserUseCase(mockAuthRepository);
  });

  const tProfileEntity = UserProfileEntity(
    bio: 'testuser',
    image: 'test@example.com',
  );

  test(
    'Should call the repository with the correct AuthEntity and return Right(void) on success',
    () async {
      // Arrange
      when(() => mockAuthRepository.updateUser(tProfileEntity))
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await usecase(tProfileEntity);

      // Assert
      expect(result, const Right(null)); // Expect Right(void)

      // Verify that the repository method was called with the correct data
      verify(() => mockAuthRepository.updateUser(tProfileEntity)).called(1);

      // Ensure no other methods were called on the repository
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  test(
    'Should return a Left(Failure) when the repository call fails',
    () async {
      // Arrange
      var tFailure = const ApiFailure(message: 'Failed to update user.');
      when(() => mockAuthRepository.updateUser(tProfileEntity))
          .thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await usecase(tProfileEntity);

      // Assert
      expect(result, Left(tFailure));

      // Verify that the repository method was called with the correct data
      verify(() => mockAuthRepository.updateUser(tProfileEntity)).called(1);

      // Ensure no other methods were called on the repository
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
