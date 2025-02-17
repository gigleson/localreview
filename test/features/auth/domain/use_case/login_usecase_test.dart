import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/use_case/login_usecase.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';
import 'token.mock.dart';

void main() {
  late AuthRepoMock repository;
  late MockTokenSharedPrefs tokenSharedPrefs;
  late LoginUseCase usecase;

  setUp(() {
    repository = AuthRepoMock();
    tokenSharedPrefs = MockTokenSharedPrefs();
    usecase = LoginUseCase(repository, tokenSharedPrefs);
  });

  test(
      'should call the [AuthRepo.login] with correct username and password (rijan, rijan123)',
      () async {
    when(() => repository.loginUser(any(), any()))
        .thenAnswer((invocation) async {
      final username = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      if (username == 'kaushal' && password == '123456aa') {
        return Future.value(const Right('token'));
      } else {
        return Future.value(
            const Left(ApiFailure(message: 'Invalid username or password')));
      }
    });

    when(() => tokenSharedPrefs.saveToken(any())).thenAnswer(
      (_) async => const Right(null),
    );

    final result = await usecase(const LoginParams(
      username: 'kaushal',
      password: '123456aa',
    ));

    expect(result, const Right('token'));

    verify(() => repository.loginUser(any(), any())).called(1);
    verify(() => tokenSharedPrefs.saveToken(any())).called(1);

    verifyNoMoreInteractions(repository);
    verifyNoMoreInteractions(tokenSharedPrefs);
  });

  tearDown(() {
    reset(repository);
    reset(tokenSharedPrefs);
  });
}
