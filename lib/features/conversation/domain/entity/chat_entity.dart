import 'package:equatable/equatable.dart';

class ChatEntity extends Equatable {
  final String id;
  final List<String> participants;
  final DateTime createdAt;
  final String lastMessage;

  const ChatEntity({
    required this.id,
    required this.participants,
    required this.createdAt,
    required this.lastMessage,
  });

  @override
  List<Object> get props => [id, participants, createdAt, lastMessage];
}
1