import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/profile/domain/use_case/upload_image_usecase.dart';
import 'package:mocktail/mocktail.dart';

import 'profile_repo_mock.dart';




void main() {
  late UploadImageUsecase usecase;
  late ProfileRepoMock mockprofileRepository;

  setUp(() {
    mockprofileRepository = ProfileRepoMock();
    usecase = UploadImageUsecase(mockprofileRepository);
  });

  const tImageUrl = 'https://example.com/image.jpg'; // Sample image URL
  final tFile = File('path/to/dummy_image.jpg');

  test(
    'Should return an image URL when uploadProfilePicture is successful',
    () async {
      // Arrange: Setup the mock to return a Right(tImageUrl)

      when(() => mockprofileRepository.uploadProfilePicture(tFile))
          .thenAnswer((_) async => const Right(tImageUrl));

      // Act: Call the use case
      final result = await usecase(UploadImageParams(file: tFile));

      // Assert: Check if the result is Right(tImageUrl)
      expect(result, const Right(tImageUrl));

      // Verify that the repository method was called with the correct File
      verify(() => mockprofileRepository.uploadProfilePicture(tFile)).called(1);

      // Ensure no other interactions occurred with the repository
      verifyNoMoreInteractions(mockprofileRepository);
    },
  );

  test(
    'Should return a Failure when uploadProfilePicture fails',
    () async {
      // Arrange: Setup the mock to return a Left(ServerFailure)
      const tFailure = ApiFailure(
          message:
              'Failed to upload image.'); // Remove const.  It's not constant.
      when(() => mockprofileRepository.uploadProfilePicture(tFile)).thenAnswer(
          (_) async =>
              const Left(tFailure)); // Remove const.  It's not constant.

      // Act: Call the use case
      final result = await usecase(UploadImageParams(file: tFile));

      // Assert: Check if the result is Left(ServerFailure)
      expect(result, const Left(tFailure)); // Remove const.  It's not constant.

      // Verify that the repository method was called with the correct File
      verify(() => mockprofileRepository.uploadProfilePicture(tFile)).called(1);

      // Ensure no other interactions occurred with the repository
      verifyNoMoreInteractions(mockprofileRepository);
    },
  );
}