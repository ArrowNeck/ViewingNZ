import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/core_utils.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';
import 'package:viewing_nz/core/widgets/icon_buttons.dart';
import 'package:viewing_nz/core/widgets/report_property_popup.dart';
import 'package:viewing_nz/features/home/widgets/listed_and_ref_id.dart';
import 'package:viewing_nz/features/home/widgets/price_and_address.dart';
import 'package:viewing_nz/features/home/widgets/viewing_poster.dart';

class ViewingDetailsHeader extends StatelessWidget {
  const ViewingDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewingPoster(
          url:
              "https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&w=400",
        ),
        const Gap(12),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                SolarIconsOutline.gallery,
                color: AppColors.gray700,
                size: 24,
              ),
              label: Text(
                "10+",
                style: context.bodyLarge.copyWith(color: AppColors.gray700),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.gray100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            const Gap(8),
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.gray100,
              child: Icon(SolarIconsOutline.play, color: AppColors.gray700),
            ),
          ],
        ),
        const Gap(16),
        ListedAndRefId.withTag(date: "12 Mar", refId: 2345, tag: "Rent"),
        const Gap(12),
        PriceAndAddress(
          price: "USD 4,595,000.00",
          address: "32B Dart Place, Fernhill, Queenstown",
        ),
        const Gap(16),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              AmenityDisplay.withLabel(
                icon: SolarIconsOutline.home1,
                label: "House",
              ),
              AmenityDisplay.withQty(icon: SolarIconsOutline.bed, qty: 4),

              AmenityDisplay.withQty(icon: SolarIconsOutline.bath, qty: 4),
              AmenityDisplay.withQty(icon: SolarIconsOutline.garage, qty: 2),
              AmenityDisplay.withLabel(
                icon: SolarIconsOutline.rulerAngular,
                label: "182m",
              ),
              AmenityDisplay.withLabel(
                icon: SolarIconsOutline.cropMinimalistic,
                label: "552m",
              ),
            ],
          ),
        ),
        const Gap(24),
        Row(
          children: [
            IconButtons.icon(onPressed: () {}, icon: SolarIconsOutline.star),
            const Gap(16),
            IconButtons.icon(onPressed: () {}, icon: SolarIconsOutline.share),
            const Gap(16),
            IconButtons.label(
              onPressed: () => CoreUtils.heroDialog(ReportPropertyPopup()),
              icon: SolarIconsOutline.documentAdd,
              label: "Report",
            ),
          ],
        ),
      ],
    );
  }
}
