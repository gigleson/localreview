
import 'package:localreview/features/conversation/domain/entity/chat_entity.dart';

class ChatDTO {
  final String id;
  final List<String> participants;
  final DateTime createdAt;
  final String lastMessage;

  ChatDTO({
    required this.id,
    required this.participants,
    required this.createdAt,
    required this.lastMessage,
  });

  factory ChatDTO.fromJson(Map<String, dynamic> json) {
    return ChatDTO(
      id: json['_id'],
      participants: List<String>.from(json['participants']),
      createdAt: DateTime.parse(json['createdAt']),
      lastMessage: json['lastMessage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'participants': participants,
      'createdAt': createdAt.toIso8601String(),
      'lastMessage': lastMessage,
    };
  }

  ChatEntity toEntity() {
    return ChatEntity(
      id: id,
      participants: participants,
      createdAt: createdAt,
      lastMessage: lastMessage,
    );
  }

  static ChatDTO fromEntity(ChatEntity entity) {
    return ChatDTO(
      id: entity.id,
      participants: entity.participants,
      createdAt: entity.createdAt,
      lastMessage: entity.lastMessage,
    );
  }
}
