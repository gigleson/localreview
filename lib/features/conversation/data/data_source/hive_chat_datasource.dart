// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:localreview/features/chat/data/dto/chat_dto.dart';
// import 'package:localreview/features/chat/data/dto/message_dto.dart';

// abstract class ChatLocalDataSource {
//   Future<void> cacheChats(List<ChatDTO> chats);
//   Future<List<ChatDTO>> getCachedChats();
//   Future<void> cacheMessages(String chatId, List<MessageDTO> messages);
//   Future<List<MessageDTO>> getCachedMessages(String chatId);
// }

// class ChatLocalDataSourceImpl implements ChatLocalDataSource {
//   final Box<List<dynamic>> _chatBox = Hive.box<List<dynamic>>("chatBox");

//   @override
//   Future<void> cacheChats(List<ChatDTO> chats) async {
//     await _chatBox.put("chats", chats.map((c) => c.toJson()).toList());
//   }

//   @override
//   Future<List<ChatDTO>> getCachedChats() async {
//     final data = _chatBox.get("chats", defaultValue: []);
//     return data!.map((chat) => ChatDTO.fromJson(chat)).toList();
//   }

//   @override
//   Future<void> cacheMessages(String chatId, List<MessageDTO> messages) async {
//     await _chatBox.put(chatId, messages.map((m) => m.toJson()).toList());
//   }

//   @override
//   Future<List<MessageDTO>> getCachedMessages(String chatId) async {
//     final data = _chatBox.get(chatId, defaultValue: []);
//     return data!.map((msg) => MessageDTO.fromJson(msg)).toList();
//   }
// }
