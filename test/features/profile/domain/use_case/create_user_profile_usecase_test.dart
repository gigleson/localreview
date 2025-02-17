import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localreview/features/profile/domain/entity/user_profile_entity.dart';
import 'package:localreview/features/profile/domain/use_case/create_user_profile_usecase.dart';
import 'package:mocktail/mocktail.dart';

import 'profile_repo_mock.dart';

void main() {
  late ProfileRepoMock repository;
  late CreateUserProfileUseCase usecase;

  setUp(() {
    repository = ProfileRepoMock();
    usecase = CreateUserProfileUseCase(repository);

    // Register fallback values for required types
    registerFallbackValue(const UserProfileEntity.empty());
    registerFallbackValue(const CreateUserProfileParams.empty());
  });

  const params = CreateUserProfileParams.empty();

  test("Should call the [RegisterRepo.registerUser]", () async {
    // Arrange
    when(() => repository.createUserProfile(any())).thenAnswer(
      (_) async => const Right(null),
    );

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, const Right(null));

    // Verify
    verify(() => repository.createUserProfile(any<UserProfileEntity>()))
        .called(1);
    verifyNoMoreInteractions(repository);
  });
}
