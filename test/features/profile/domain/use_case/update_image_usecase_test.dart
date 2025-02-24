import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/profile/domain/use_case/update_image_usecase.dart';
import 'package:mocktail/mocktail.dart';

import 'profile_repo_mock.dart';


void main() {
  late UpdateProfilePictureUseCase usecase;
  late ProfileRepoMock mockAuthRepository;

  setUp(() {
    mockAuthRepository = ProfileRepoMock();
    usecase = UpdateProfilePictureUseCase(mockAuthRepository);
  });

  const tImageUrl = 'https://example.com/new_image.jpg'; // Sample image URL

  setUpAll(() {
    // Register the mock File type for mocktail
    registerFallbackValue(File('path/to/mock.jpg'));
  });

  test(
    'Should return the new image URL when updateProfilePicture is successful',
    () async {
      // Arrange
      final tFile = File('path/to/new_image.jpg');
      when(() => mockAuthRepository.updateProfilePicture(any()))
          .thenAnswer((_) async => const Right(tImageUrl));

      // Act
      final result = await usecase(tFile);

      // Assert
      expect(result, const Right(tImageUrl));

      // Verify that the repository method was called with the correct data
      verify(() => mockAuthRepository.updateProfilePicture(tFile)).called(1);

      // Ensure no other methods were called on the repository
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  test(
    'Should return a Failure when updateProfilePicture fails',
    () async {
      // Arrange
      final tFile = File('path/to/new_image.jpg');
      final tFailure =
          ApiFailure(message: 'Failed to update profile picture.');
      when(() => mockAuthRepository.updateProfilePicture(any()))
          .thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await usecase(tFile);

      // Assert
      expect(result, Left(tFailure));

      // Verify that the repository method was called with the correct data
      verify(() => mockAuthRepository.updateProfilePicture(tFile)).called(1);

      // Ensure no other methods were called on the repository
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
