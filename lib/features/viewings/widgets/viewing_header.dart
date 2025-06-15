import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/core_utils.dart';
import 'package:viewing_nz/core/widgets/request_filter.dart';

class ViewingHeader extends StatelessWidget {
  const ViewingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: PopupMenuButton<String>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: Colors.black.withAlpha(200),
                itemBuilder: (context) => [
                  PopupMenuItem<String>(
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      leading: Icon(
                        SolarIconsOutline.gallery,
                        color: AppColors.white,
                      ),
                      title: Text(
                        "Up Coming Viewings",
                        style: context.titleMedium.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuDivider(
                    color: AppColors.gray600,
                    indent: 16,
                    endIndent: 16,
                    thickness: 1,
                  ),
                  PopupMenuItem<String>(
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      leading: Icon(
                        SolarIconsOutline.user,
                        color: AppColors.white,
                      ),
                      title: Text(
                        "Past Viewings",
                        style: context.bodyLarge.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
                child: Row(
                  children: [
                    Text(
                      "Up Coming Viewings",
                      style: context.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(8),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        SolarIconsOutline.altArrowDown,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            VerticalDivider(color: AppColors.gray300, indent: 4, endIndent: 4),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector(
                onTap: () =>
                    CoreUtils.heroDialog(RequestFilter(onFindResults: () {})),
                child: Icon(SolarIconsOutline.filter, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
