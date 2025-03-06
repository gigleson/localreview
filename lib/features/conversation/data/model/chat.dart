import 'package:hive_flutter/hive_flutter.dart';
import 'message_model.dart';

part 'chat_model.g.dart';

@HiveType(typeId: 1)
class ChatModel extends HiveObject {
  @HiveField(0)
  final String chatId;

  @HiveField(1)
  final List<String> participants; // List of user IDs

  @HiveField(2)
  final List<MessageModel> messages;

  @HiveField(3)
  final DateTime lastUpdated;

  ChatModel({
    required this.chatId,
    required this.participants,
    required this.messages,
    required this.lastUpdated,
  });
}
