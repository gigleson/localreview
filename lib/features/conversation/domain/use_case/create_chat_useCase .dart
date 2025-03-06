import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/core/usecase/usecase.dart';
import 'package:localreview/features/chat/domain/entity/chat_entity.dart';
import 'package:localreview/features/chat/domain/repository/chat_repository.dart';

class CreateChatParams {
  final List<String> participants;

  CreateChatParams(this.participants);
}

class CreateChatUseCase implements UseCase<ChatEntity, CreateChatParams> {
  final ChatRepository repository;

  CreateChatUseCase(this.repository);

  @override
  Future<Either<Failure, ChatEntity>> call(CreateChatParams params) async {
    return await repository.createChat(params.participants);
  }
}
