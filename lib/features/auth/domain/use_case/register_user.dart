import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/auth/domain/entity/auth_entity.dart';
import 'package:localreview/features/auth/domain/repository/auth_repository.dart';

/// **Register Params**
class RegisterParams extends Equatable {
  final AuthEntity user;

  const RegisterParams({required this.user});

  @override
  List<Object> get props => [user];
}

/// **Register Use Case**
class RegisterUseCase implements UsecaseWithParams<void, RegisterParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterParams params) {
    return repository.registerUser(params.user);
  }
}
