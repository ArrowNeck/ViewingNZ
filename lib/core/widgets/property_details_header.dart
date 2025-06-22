import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/core_utils.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';
import 'package:viewing_nz/core/widgets/icon_buttons.dart';
import 'package:viewing_nz/core/widgets/property_share_popup.dart';
import 'package:viewing_nz/core/widgets/report_property_popup.dart';
import 'package:viewing_nz/core/widgets/listed_and_ref_id.dart';
import 'package:viewing_nz/core/widgets/price_and_address.dart';
import 'package:viewing_nz/core/widgets/property_poster.dart';

class PropertyDetailsHeader extends StatefulWidget {
  const PropertyDetailsHeader({super.key});

  @override
  State<PropertyDetailsHeader> createState() => _ViewingDetailsHeaderState();
}

class _ViewingDetailsHeaderState extends State<PropertyDetailsHeader> {
  final ValueNotifier<bool> _isFav = ValueNotifier(false);

  @override
  void dispose() {
    _isFav.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PropertyPoster(),
        const Gap(12),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: SvgIcon(SolarIcons.gallery, color: AppColors.gray700),
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
              child: SvgIcon(SolarIcons.play, color: AppColors.gray700),
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
        SizedBox(
          width: double.maxFinite,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AmenityDisplay(icon: SolarIcons.home, label: "House"),
                const Gap(12),
                AmenityDisplay(icon: SolarIcons.sleeping, qty: 4),
                const Gap(12),
                AmenityDisplay(icon: SolarIcons.bath, qty: 4),
                const Gap(12),
                AmenityDisplay(icon: SolarIcons.car, qty: 2),
                const Gap(12),
                AmenityDisplay(icon: SolarIcons.rulerAngular, label: "182m"),
                const Gap(12),
                AmenityDisplay(
                  icon: SolarIcons.cropMinimalistic,
                  label: "552m",
                ),
              ],
            ),
          ),
        ),
        const Gap(24),
        Row(
          children: [
            ValueListenableBuilder(
              valueListenable: _isFav,
              builder: (context, fav, child) {
                return IconButtons.icon(
                  onPressed: () => _isFav.value = !_isFav.value,
                  icon: fav ? SolarIcons.starFill : SolarIcons.star,
                  iconColor: fav ? AppColors.primary : null,
                );
              },
            ),
            const Gap(16),
            IconButtons.icon(
              onPressed: () => CoreUtils.heroDialog(PropertySharePopup()),
              icon: SolarIcons.share,
            ),
            const Gap(16),
            IconButtons.label(
              onPressed: () => CoreUtils.heroDialog(ReportPropertyPopup()),
              icon: SolarIcons.documentAdd,
              label: "Report",
            ),
          ],
        ),
      ],
    );
  }
}
