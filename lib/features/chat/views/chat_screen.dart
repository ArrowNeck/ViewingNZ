import 'package:flutter/material.dart';
import 'package:viewing_nz/core/widgets/app_search_bar.dart';
import 'package:viewing_nz/features/chat/widgets/chat_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              AppSearchBar(),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ChatCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
