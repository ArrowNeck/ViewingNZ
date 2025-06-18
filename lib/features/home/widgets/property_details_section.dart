import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/input_field.dart';
import 'package:viewing_nz/features/home/widgets/listed_and_ref_id.dart';
import 'package:viewing_nz/features/home/widgets/section_label.dart';

class PropertyDetailsSection extends StatefulWidget {
  const PropertyDetailsSection({super.key});

  @override
  State<PropertyDetailsSection> createState() => _PropertyDetailsSectionState();
}

class _PropertyDetailsSectionState extends State<PropertyDetailsSection> {
  final ValueNotifier<bool> enableEdit = ValueNotifier(false);

  @override
  void dispose() {
    enableEdit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionLabel(title: "Rent Property Details"),
        ListedAndRefId.inline(date: "12 Mar 2025", refId: 2345),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8.0),
            child: Text(
              "Title Here",
              style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        ReadMoreText(
          '''
Lorem ipsum dolor sit amet consectetur. Bibendum tellus pretium curabitur faucibus viverra quis pharetra. Suspendisse non morbi tortor egestas. Eget morbi vitae egestas facilisi sed. Felis massa nulla nunc egestas. Non sit leo iaculis morbi id sed eleifend scelerisque. Augue dolor euismod nascetur massa. Egestas eleifend consectetur tempor adipiscing. Metus blandit orci malesuada elit habitasse felis scelerisque pulvinar suspendisse. Tellus turpis id vitae eget viverra urna a. Enim hac facilisis donec orci in diam. Nisi a donec id nulla id integer ipsum arcu.

Viverra ac ornare nunc in. Cursus tellus aliquam non lobortis quis faucibus enim. In dictum quis sapien amet arcu bibendum pulvinar. Amet cras risus elementum tortor sed elementum feugiat turpis mattis. Mattis consequat morbi in tortor eu nunc tempor. Lacus eu neque sit egestas cras sapien. Sapien donec enim leo aliquet. Ultrices et suspendisse sapien duis id. Viverra nec imperdiet at elit sollicitudin viverra. Morbi fames nec consequat tellus tempus. Ornare elit eget urna duis etiam sit. Facilisis justo hendrerit dui quis justo bibendum. Nisl in vulputate quis mi gravida vulputate tortor ullamcorper. In volutpat blandit nam enim in ligula suscipit amet. Tortor faucibus habitant vel platea.
''',
          style: context.bodyMedium.copyWith(color: AppColors.gray800),
          trimMode: TrimMode.Line,
          trimLines: 10,
          colorClickableText: AppColors.info500,
          lessStyle: context.bodyMedium.copyWith(
            color: AppColors.info500,
            fontWeight: FontWeight.w600,
          ),
          trimCollapsedText: 'Read All Details',
          trimExpandedText: 'Show less',
          moreStyle: context.bodyMedium.copyWith(
            color: AppColors.info500,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(24),
        GestureDetector(
          onTap: () {
            enableEdit.value = !enableEdit.value;
          },
          child: Row(
            children: [
              Icon(SolarIconsOutline.documentAdd),
              const Gap(8),
              Text(
                "Your Notes",
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const Gap(16),
        ValueListenableBuilder(
          valueListenable: enableEdit,
          builder: (context, value, child) {
            return InputField(
              hintText:
                  "Add personal notes for your reference. Only you can see them.",
              maxLines: 3,
              textInputAction: TextInputAction.newline,
              enabled: !value,
            );
          },
        ),
      ],
    );
  }
}
