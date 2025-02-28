import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';

/// **Get User by ID Params**
class GetUserByIdParams extends Equatable {
  final String userId;

  const GetUserByIdParams({required this.userId});

  @override
  List<Object> get props => [userId];
}

/// **Get User by ID Use Case**
class GetUserByIdUseCase implements UsecaseWithParams<AuthEntity, GetUserByIdParams> {
  final IAuthRepository repository;

  GetUserByIdUseCase(this.repository);

  @override
  Future<Either<Failure, AuthEntity>> call(GetUserByIdParams params) {
    return repository.getUserById(params.userId);
  }
}
