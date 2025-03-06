import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/chat/domain/entity/chat_entity.dart';
import 'package:localreview/features/chat/domain/entity/message_entity.dart';

abstract class IChatRepository {
  Future<Either<Failure, ChatEntity>> createChat(List<String> participants);
  Future<Either<Failure, List<ChatEntity>>> getUserChats(String userId);
  Future<Either<Failure, List<MessageEntity>>> getChatMessages(String chatId);
  Future<Either<Failure, void>> sendMessage(MessageEntity message);
}
