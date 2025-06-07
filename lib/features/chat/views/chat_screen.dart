import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import 'package:viewing_nz/core/theme/app_colors.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search here",
                    prefixIcon: Icon(
                      SolarIconsOutline.magnifier,
                      color: AppColors.gray800,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  itemCount: 15,
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
