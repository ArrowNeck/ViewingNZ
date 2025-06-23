import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/features/viewings/models/price_update.dart';
import 'package:viewing_nz/core/widgets/section_label.dart';

class PriceUpdatesSection extends StatelessWidget {
  const PriceUpdatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PriceUpdate> data = [
      PriceUpdate(date: DateTime(2025, 3, 1), price: "\$ 699,000"),
      PriceUpdate(date: DateTime(2025, 11, 4), price: "Negotiation"),
      PriceUpdate(date: DateTime(2024, 11, 1), price: "\$ 709,000"),
    ];
    return Column(
      children: [
        SectionLabel(title: "Rent Property Price Updates"),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (_, index) {
            return _priceCard(context, priceUpdate: data[index]);
          },
          separatorBuilder: (_, index) {
            return Gap(12);
          },
        ),
      ],
    );
  }

  Container _priceCard(
    BuildContext context, {
    required PriceUpdate priceUpdate,
  }) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.gray50,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: 24,
            child: SvgIcon(SolarIcons.garage, color: AppColors.white),
          ),
          const Gap(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Price Updates on ",
                  style: context.bodyMedium,
                  children: [
                    TextSpan(
                      text: DateFormat("dd MMM yyyy").format(priceUpdate.date),
                      style: context.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                priceUpdate.price,
                style: context.bodyLarge.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
