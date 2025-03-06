import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String id;
  final String chatId;
  final String senderId;
  final String text;
  final DateTime timestamp;
  final bool isRead;

  const MessageEntity({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.text,
    required this.timestamp,
    this.isRead = false,
  });

  @override
  List<Object> get props => [id, chatId, senderId, text, timestamp, isRead];
}
