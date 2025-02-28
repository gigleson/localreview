import 'package:dartz/dartz.dart';
import 'package:localreview/app/shared_prefs/token_shared_prefs.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';

/// **Logout Use Case**
class LogoutUseCase implements UsecaseWithoutParams<void> {
  final IAuthRepository repository;
  final TokenSharedPrefs tokenSharedPrefs;

  LogoutUseCase(this.repository, this.tokenSharedPrefs);

  @override
  Future<Either<Failure, void>> call() {
    return repository.logoutUser().then((value) {
      return value.fold(
        (failure) => Left(failure),
        (_) {
          tokenSharedPrefs.removeToken();
          return const Right(null);
        },
      );
    });
  }
}
