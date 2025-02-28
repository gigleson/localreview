import 'package:dartz/dartz.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';

/// **Get Suggested Users Use Case**
class GetSuggestedUsersUseCase implements UsecaseWithoutParams<List<AuthEntity>> {
  final IAuthRepository repository;

  GetSuggestedUsersUseCase(this.repository);

  @override
  Future<Either<Failure, List<AuthEntity>>> call() {
    return repository.getSuggestedUsers();
  }
}
