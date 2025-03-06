import 'package:dio/dio.dart';
import 'package:localreview/core/network/api_service.dart';

import 'package:localreview/features/conversation/data/dto/chat_dto.dart';
import 'package:localreview/features/conversation/data/dto/message_dto.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatDTO>> getChats();
  Future<ChatDTO> createChat(List<String> participants);
  Future<List<MessageDTO>> getMessages(String chatId);
  Future<MessageDTO> sendMessage(String chatId, String senderId, String text);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final ApiService _apiService;

  ChatRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<ChatDTO>> getChats() async {
    try {
      final response = await _apiService.get('/chats');
      return (response.data as List).map((chat) => ChatDTO.fromJson(chat)).toList();
    } catch (e) {
      throw Exception("Failed to fetch chats: $e");
    }
  }

  @override
  Future<ChatDTO> createChat(List<String> participants) async {
    try {
      final response = await _apiService.post('/chats/create', data: {'participants': participants});
      return ChatDTO.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to create chat: $e");
    }
  }

  @override
  Future<List<MessageDTO>> getMessages(String chatId) async {
    try {
      final response = await _apiService.get('/chats/$chatId/messages');
      return (response.data as List).map((msg) => MessageDTO.fromJson(msg)).toList();
    } catch (e) {
      throw Exception("Failed to fetch messages: $e");
    }
  }

  @override
  Future<MessageDTO> sendMessage(String chatId, String senderId, String text) async {
    try {
      final response = await _apiService.post('/chats/$chatId/messages/send', data: {
        'senderId': senderId,
        'text': text,
      });
      return MessageDTO.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to send message: $e");
    }
  }
}
