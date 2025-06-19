import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class SingleChatScreen2 extends StatefulWidget {
  const SingleChatScreen2({super.key});

  @override
  State<SingleChatScreen2> createState() => _SingleChatScreen2State();
}

class _SingleChatScreen2State extends State<SingleChatScreen2> {
  final InMemoryChatController _chatController = InMemoryChatController();

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Chat(
          chatController: _chatController,
          currentUserId: 'user1',
          onMessageSend: (text) {
            _chatController.insertMessage(
              TextMessage(
                id: '${Random().nextInt(1000) + 1}',
                authorId: 'user1',
                createdAt: DateTime.now().toUtc(),
                text: text,
              ),
            );
          },
          resolveUser: (UserID id) async {
            return User(id: id, name: 'John Doe');
          },
        ),
      ),
    );
  }
}
