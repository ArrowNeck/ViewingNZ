import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/core_utils.dart';
import 'package:viewing_nz/core/widgets/custom_avatar.dart';
import 'package:viewing_nz/core/widgets/input_field.dart';

class SingleChatScreenUi extends StatefulWidget {
  const SingleChatScreenUi({super.key});

  @override
  State<SingleChatScreenUi> createState() => _SingleChatScreenUiState();
}

class _SingleChatScreenUiState extends State<SingleChatScreenUi> {
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.",
      isSender: false,
    ),
    ChatMessage(
      text: "Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.",
      isSender: true,
      seen: true,
    ),
    ChatMessage(
      text: "Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.",
      isSender: false,
    ),
    ChatMessage(
      text:
          "Hello James Carter\nI,m Sahan Akash. I would like to inquire about the price range of this property 32B Dart Place, Fernhill, Queenstown.\n\nLorem ipsum dolor sit amet consectetur. Risus aliquet sed rhoncus non in felis amet nisl cras. Fames amet natoque sapien eu ante cursus.",
      isSender: true,
      delivered: true,
    ),
  ];

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.gunmetal600,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.white),
        title: IntrinsicHeight(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.gunmetal400,
                  child: const CustomAvatar(
                    radius: 18,
                    url: "https://i.pravatar.cc/250?img=12",
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "James Carter",
                  style: context.titleMedium.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 40),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 8,
              ),
              child: Text(
                "32B Dart Place, Fernhill, Queenstown",
                style: context.titleMedium.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(vertical: 16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return _buildBubble(message);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.gunmetal600,
                      // radius: 20,
                      child: SvgIcon.white(SolarIcons.addCircle),
                    ),
                    const Gap(12),
                    Expanded(
                      child: InputField(
                        hintText: "Type here",
                        controller: _inputController,
                      ),
                    ),
                    const Gap(12),
                    GestureDetector(
                      onTap: () {
                        if (_inputController.text.isNotEmpty) {
                          setState(() {
                            _messages.add(
                              ChatMessage(
                                text: _inputController.text,
                                isSender: true,
                              ),
                            );
                            _inputController.clear();
                          });
                          CoreUtils.postFrameCall(() {
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          });
                        }
                      },
                      child: Container(
                        width: 48,
                        // height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SvgIcon.white(SolarIcons.plain),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BubbleNormal _buildBubble(ChatMessage message) {
    return BubbleNormal(
      color: message.isSender ? AppColors.alizarin50 : AppColors.gray50,
      bubbleRadius: 12,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: EdgeInsets.all(8),
      textStyle: context.bodyMedium,
      isSender: message.isSender,
      delivered: message.delivered,
      seen: message.seen,
      text: message.text,
    );
  }
}

class ChatMessage {
  final String text;
  final bool isSender;
  final bool delivered;
  final bool seen;

  ChatMessage({
    required this.text,
    required this.isSender,
    this.delivered = false,
    this.seen = false,
  });
}
