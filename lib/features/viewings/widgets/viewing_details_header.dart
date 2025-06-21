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
import 'package:viewing_nz/features/viewings/widgets/listed_and_ref_id.dart';
import 'package:viewing_nz/features/viewings/widgets/price_and_address.dart';
import 'package:viewing_nz/features/viewings/widgets/viewing_poster.dart';

class ViewingDetailsHeader extends StatefulWidget {
  const ViewingDetailsHeader({super.key});

  @override
  State<ViewingDetailsHeader> createState() => _ViewingDetailsHeaderState();
}

class _ViewingDetailsHeaderState extends State<ViewingDetailsHeader> {
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
        ViewingPoster(),
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
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              AmenityDisplay.withLabel(icon: SolarIcons.home, label: "House"),
              AmenityDisplay.withQty(icon: SolarIcons.sleeping, qty: 4),

              AmenityDisplay.withQty(icon: SolarIcons.bath, qty: 4),
              AmenityDisplay.withQty(icon: SolarIcons.car, qty: 2),
              AmenityDisplay.withLabel(
                icon: SolarIcons.rulerAngular,
                label: "182m",
              ),
              AmenityDisplay.withLabel(
                icon: SolarIcons.cropMinimalistic,
                label: "552m",
              ),
            ],
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
