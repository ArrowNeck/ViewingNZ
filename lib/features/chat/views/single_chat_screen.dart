import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({super.key});

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BubbleSpecialOne(
              text:
                  'Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.',
              isSender: false,
              tail: false,
              color: AppColors.gray50,
              textStyle: context.bodyLarge,
            ),

            BubbleSpecialOne(
              text:
                  'Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.',
              isSender: true,
              seen: true,
              tail: false,
              color: AppColors.alizarin50,
              textStyle: context.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
