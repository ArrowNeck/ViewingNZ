import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/media_query_extension.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class SalePriceCard extends StatelessWidget {
  const SalePriceCard.estimate({
    super.key,
    required this.price,
    required this.rangeText,
  }) : color = AppColors.primary;

  const SalePriceCard.capital({
    super.key,
    required this.price,
    required this.rangeText,
  }) : color = AppColors.black;

  final double price;
  final String rangeText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * .47,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.gray50,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: color,
            child: SvgIcon.white(SolarIcons.banknote),
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$ ${price}M",
                  style: context.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  rangeText,
                  style: context.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
