import 'package:hive_flutter/hive_flutter.dart';

part 'message_model.g.dart';

@HiveType(typeId: 2)
class MessageModel extends HiveObject {
  @HiveField(0)
  final String messageId;

  @HiveField(1)
  final String senderId; // User ID of sender

  @HiveField(2)
  final String chatId; // Chat ID this message belongs to

  @HiveField(3)
  final String text;

  @HiveField(4)
  final DateTime timestamp;

  @HiveField(5)
  final bool isRead;

  MessageModel({
    required this.messageId,
    required this.senderId,
    required this.chatId,
    required this.text,
    required this.timestamp,
    this.isRead = false,
  });
}
