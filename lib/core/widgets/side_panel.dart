import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/services/routes.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/global_keys.dart';

class SidePanel extends StatefulWidget {
  const SidePanel({super.key});

  @override
  State<SidePanel> createState() => _SidePannelState();
}

class _SidePannelState extends State<SidePanel> {
  final ValueNotifier<bool> _propertyListing = ValueNotifier(false);

  @override
  void dispose() {
    _propertyListing.dispose();
    super.dispose();
  }

  void _closedPanel() => GlobalKeys.sidePanelKey.currentState?.closeDrawer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Menu",
                    style: context.titleLarge.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: _closedPanel,
                    child: SvgIcon(SolarIcons.closeSquare),
                  ),
                ],
              ),
              const Gap(16),
              _buildPanelTile("Find Home", () {
                context.go(Routes.home);
              }),
              _buildPanelTile("Agents & Companies", () {}),
              _buildPanelTile("About Us", () {}),
              _buildPanelTile("FAQs", () {}),
              _buildPanelTile("Blogs", () {}),
              Divider(color: AppColors.gray300, height: 16),
              const Gap(8),
              _buildPanelTile("Dashboard", () {
                context.go(Routes.viewings);
              }),
              _buildPanelTile("My Profile", () {
                context.go(Routes.profile);
              }),
              _buildPanelTile("Viewings", () {
                context.go(Routes.viewings);
              }),
              _buildPanelTile("Saved Properties", () {
                context.go(Routes.savedProperties);
              }),
              _buildPanelTile("Search Properties", () {
                context.go(Routes.savedSearch);
              }),
              Divider(color: AppColors.gray300, height: 16),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Property Listing",
                          style: context.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Turn on to create a new property listing.",
                          style: context.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _propertyListing,
                    builder: (context, value, child) {
                      return CupertinoSwitch(
                        activeTrackColor: AppColors.primary,
                        value: value,
                        onChanged: (value) {
                          _propertyListing.value = value;
                        },
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  context.go('/');
                },
                label: Text("Logout"),
                icon: SvgIcon.white(SolarIcons.logout2),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.maxFinite, 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildPanelTile(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: ListTile(
        tileColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        onTap: () {
          _closedPanel();
          onPressed();
        },
        title: Text(
          label,
          style: context.titleMedium.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
