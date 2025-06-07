import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/property_tag.dart';

class ListedAndRefId extends StatelessWidget {
  const ListedAndRefId.withoutTag({
    super.key,
    required this.date,
    required this.refId,
  }) : tag = null;

  const ListedAndRefId.withTag({
    super.key,
    required this.date,
    required this.refId,
    required this.tag,
  });

  final String date;
  final int refId;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Listed on : $date",
          style: context.bodyMedium.copyWith(color: AppColors.gray800),
        ),
        Row(
          children: [
            Text(
              "Ref ID : #$refId",
              style: context.bodyMedium.copyWith(color: AppColors.gray800),
            ),
            if (tag != null) ...[Gap(16), PropertyTag.dark(name: tag!)],
          ],
        ),
      ],
    );
  }
}
