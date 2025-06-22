import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/custom_avatar.dart';
import 'package:viewing_nz/core/widgets/input_field.dart';

class SingleChatScreenUi extends StatefulWidget {
  const SingleChatScreenUi({super.key});

  @override
  State<SingleChatScreenUi> createState() => _SingleChatScreenUiState();
}

class _SingleChatScreenUiState extends State<SingleChatScreenUi> {
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
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 16),
                children: [
                  BubbleNormal(
                    color: AppColors.gray50,
                    bubbleRadius: 12,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    isSender: false,
                    text:
                        "Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.",
                    textStyle: context.bodyMedium,
                  ),
                  BubbleNormal(
                    color: AppColors.alizarin50,
                    bubbleRadius: 12,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: EdgeInsets.all(8),
                    isSender: true,
                    seen: true,
                    text:
                        "Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.",
                  ),
                  BubbleNormal(
                    color: AppColors.gray50,
                    bubbleRadius: 12,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    isSender: false,
                    text:
                        "Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.",
                    textStyle: context.bodyMedium,
                  ),
                  BubbleNormal(
                    color: AppColors.alizarin50,
                    bubbleRadius: 12,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: EdgeInsets.all(8),
                    isSender: true,
                    delivered: true,
                    text:
                        "Hello James Carter\nI,m Sahan Akash. I would like to inquire about the price range of this property 32B Dart Place, Fernhill, Queenstown.\n\nLorem ipsum dolor sit amet consectetur. Risus aliquet sed rhoncus non in felis amet nisl cras. Fames amet natoque sapien eu ante cursus.",
                  ),
                ],
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
                    Expanded(child: InputField(hintText: "Type here")),
                    const Gap(12),
                    Container(
                      width: 48,
                      // height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgIcon.white(SolarIcons.plain),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: SafeArea(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      //     child: IntrinsicHeight(
      //       child: Row(
      //         children: [
      //           CircleAvatar(
      //             backgroundColor: AppColors.gunmetal600,
      //             // radius: 20,
      //             child: SvgIcon.white(SolarIcons.addCircle),
      //           ),
      //           const Gap(12),
      //           Expanded(child: InputField(hintText: "Type here")),
      //           const Gap(12),
      //           Container(
      //             width: 48,
      //             // height: 40,
      //             alignment: Alignment.center,
      //             decoration: BoxDecoration(
      //               color: AppColors.primary,
      //               borderRadius: BorderRadius.circular(12),
      //             ),
      //             child: SvgIcon.white(SolarIcons.plain),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
