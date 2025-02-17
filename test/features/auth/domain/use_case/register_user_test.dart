import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';

import 'package:localreview/features/auth/domain/use_case/register_user.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';


void main() {
  late AuthRepoMock repository;
  late RegisterUseCase usecase;

  setUp(() {
    repository = AuthRepoMock();
    usecase = RegisterUseCase(repository);

    // Register fallback values for required types
    registerFallbackValue(const AuthEntity.empty());
    registerFallbackValue(const RegisterUserParams.empty());
  });

  const params = RegisterUserParams.empty();

  test("Should call the [RegisterRepo.registerUser]", () async {
    // Arrange
    when(() => repository.registerUser(any())).thenAnswer(
      (_) async => const Right(null),
    );

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, const Right(null));

    // Verify
    verify(() => repository.registerUser(any<AuthEntity>())).called(1);
    verifyNoMoreInteractions(repository);
  });
}
