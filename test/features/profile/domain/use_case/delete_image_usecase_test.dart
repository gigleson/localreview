// Test Code
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/profile/domain/use_case/delete_image_usecase.dart';
import 'package:mocktail/mocktail.dart';

import 'profile_repo_mock.dart';

void main() {
  late DeleteProfilePictureUseCase usecase;
  late ProfileRepoMock mockAuthRepository;

  setUp(() {
    mockAuthRepository = ProfileRepoMock();
    usecase = DeleteProfilePictureUseCase(mockAuthRepository);
  });

  test(
    'Should call the repository and return Right(void) on successful deletion',
    () async {
      // Arrange
      when(() => mockAuthRepository.deleteProfilePicture())
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await usecase();

      // Assert
      expect(result, const Right(null));

      // Verify
      verify(() => mockAuthRepository.deleteProfilePicture()).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  test(
    'Should return a Failure when profile picture deletion fails',
    () async {
      // Arrange
      const tFailure = ApiFailure(message: 'Failed to delete profile picture.');
      when(() => mockAuthRepository.deleteProfilePicture())
          .thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await usecase();

      // Assert
      expect(result, const Left(tFailure));

      // Verify
      verify(() => mockAuthRepository.deleteProfilePicture()).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
