import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/core_utils.dart';
import 'package:viewing_nz/core/widgets/request_filter.dart';

class ViewingHeader extends StatefulWidget {
  const ViewingHeader({super.key});

  @override
  State<ViewingHeader> createState() => _ViewingHeaderState();
}

class _ViewingHeaderState extends State<ViewingHeader> {
  final ValueNotifier<bool> _isUpComing = ValueNotifier(true);

  @override
  void dispose() {
    _isUpComing.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
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
                  _buildMenuItem(
                    "Up Coming Viewings",
                    SolarIcons.gallery,
                    () => _isUpComing.value = true,
                  ),
                  PopupMenuDivider(
                    color: AppColors.gray600,
                    indent: 16,
                    endIndent: 16,
                    thickness: 1,
                  ),
                  _buildMenuItem(
                    "Past Viewings",
                    SolarIcons.user,
                    () => _isUpComing.value = false,
                  ),
                ],
                child: Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: _isUpComing,
                      builder: (context, value, child) {
                        return Text(
                          value ? "Up Coming Viewings" : "Past Viewings",
                          style: context.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ),
                    Gap(8),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.primary,
                      child: SvgIcon(
                        SolarIcons.altArrowDown,
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
                child: SvgIcon(SolarIcons.filter, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem(
    String title,
    SvgIconData icon,
    VoidCallback onTap,
  ) {
    return PopupMenuItem<String>(
      onTap: onTap,
      child: ListTile(
        leading: SvgIcon(icon, color: AppColors.white),
        title: Text(
          title,
          style: context.bodyLarge.copyWith(color: AppColors.white),
        ),
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
