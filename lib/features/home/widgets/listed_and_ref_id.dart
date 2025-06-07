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
  }) : tag = null,
       inline = false;

  const ListedAndRefId.withTag({
    super.key,
    required this.date,
    required this.refId,
    required this.tag,
  }) : inline = false;

  const ListedAndRefId.inline({
    super.key,
    required this.date,
    required this.refId,
  }) : tag = null,
       inline = true;

  final String date;
  final int refId;
  final String? tag;
  final bool inline;

  @override
  Widget build(BuildContext context) {
    if (inline) {
      return IntrinsicHeight(
        child: Row(
          children: [
            _richText(context, "Listed on : ", date),
            VerticalDivider(color: AppColors.gray300, width: 32),
            _richText(context, "Ref ID : ", "#$refId"),
          ],
        ),
      );
    }
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

  _richText(BuildContext context, String label, String value) {
    return RichText(
      text: TextSpan(
        text: label,
        style: context.bodyMedium.copyWith(color: AppColors.gray800),
        children: [
          TextSpan(
            text: value,
            style: context.bodyMedium.copyWith(
              color: AppColors.gray800,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
