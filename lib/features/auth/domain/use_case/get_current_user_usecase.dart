
import 'package:dartz/dartz.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUserUseCase implements UsecaseWithoutParams<AuthEntity> {
  final IAuthRepository _repository;

  GetCurrentUserUseCase(this._repository);

  @override
  Future<Either<Failure, AuthEntity>> call() {
    return _repository.getCurrentUser();
  }
}
