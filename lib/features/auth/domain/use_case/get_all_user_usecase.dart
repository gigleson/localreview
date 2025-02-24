import 'package:dartz/dartz.dart';

import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';

class GetAllUsersUseCase implements UsecaseWithoutParams<List<AuthEntity>> {
  final IAuthRepository _repository;

  GetAllUsersUseCase(this._repository);

  @override
  Future<Either<Failure, List<AuthEntity>>> call() {

    return _repository.getAllUsers();
  }
}
