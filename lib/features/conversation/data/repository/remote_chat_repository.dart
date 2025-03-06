import 'package:dartz/dartz.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/chat/data/data_source/chat_remote_data_source.dart';
import 'package:localreview/features/chat/data/data_source/chat_local_data_source.dart';
import 'package:localreview/features/chat/domain/entity/chat_entity.dart';
import 'package:localreview/features/chat/domain/entity/message_entity.dart';
import 'package:localreview/features/chat/domain/repository/chat_repository.dart';

class ChatRepository implements IChatRepository {
  final ChatRemoteDataSource remoteDataSource;
  final ChatLocalDataSource localDataSource;

  ChatRepository({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, ChatEntity>> createChat(List<String> participants) async {
    try {
      final chat = await remoteDataSource.createChat(participants);
      return Right(chat);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatEntity>>> getUserChats(String userId) async {
    try {
      final chats = await remoteDataSource.getUserChats(userId);
      return Right(chats);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> getChatMessages(String chatId) async {
    try {
      final messages = await remoteDataSource.getChatMessages(chatId);
      return Right(messages);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage(MessageEntity message) async {
    try {
      await remoteDataSource.sendMessage(message);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }
}
