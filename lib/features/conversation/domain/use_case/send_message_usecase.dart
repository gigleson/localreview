import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/core/usecase/usecase.dart';
import 'package:localreview/features/chat/domain/entity/message_entity.dart';
import 'package:localreview/features/chat/domain/repository/chat_repository.dart';

class SendMessageParams {
  final String chatId;
  final String senderId;
  final String text;

  SendMessageParams({
    required this.chatId,
    required this.senderId,
    required this.text,
  });
}

class SendMessageUseCase implements UseCase<MessageEntity, SendMessageParams> {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  @override
  Future<Either<Failure, MessageEntity>> call(SendMessageParams params) async {
    return await repository.sendMessage(params.chatId, params.senderId, params.text);
  }
}
