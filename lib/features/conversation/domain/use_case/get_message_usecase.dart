import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/core/usecase/usecase.dart';
import 'package:localreview/features/chat/domain/entity/message_entity.dart';
import 'package:localreview/features/chat/domain/repository/chat_repository.dart';

class GetMessagesParams {
  final String chatId;

  GetMessagesParams(this.chatId);
}

class GetMessagesUseCase implements UseCase<List<MessageEntity>, GetMessagesParams> {
  final ChatRepository repository;

  GetMessagesUseCase(this.repository);

  @override
  Future<Either<Failure, List<MessageEntity>>> call(GetMessagesParams params) async {
    return await repository.getMessages(params.chatId);
  }
}
