import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/core/usecase/usecase.dart';
import 'package:localreview/features/chat/domain/entity/chat_entity.dart';
import 'package:localreview/features/chat/domain/repository/chat_repository.dart';

class GetChatsUseCase implements UseCase<List<ChatEntity>, NoParams> {
  final ChatRepository repository;

  GetChatsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ChatEntity>>> call(NoParams params) async {
    return await repository.getChats();
  }
}
