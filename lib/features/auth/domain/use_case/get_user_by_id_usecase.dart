import 'package:dartz/dartz.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';

class GetUserByIdUseCase implements UsecaseWithParams<AuthEntity, String> {
  final IAuthRepository _repository;

  GetUserByIdUseCase(this._repository);

  @override
  Future<Either<Failure, AuthEntity>> call(String userId) {
    return _repository.getUserById(userId);
  }
}
