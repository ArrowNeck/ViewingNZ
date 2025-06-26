import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class ManageNotificationScreen extends StatefulWidget {
  const ManageNotificationScreen({super.key});

  @override
  State<ManageNotificationScreen> createState() =>
      _ManageNotificationScreenState();
}

class _ManageNotificationScreenState extends State<ManageNotificationScreen> {
  final ValueNotifier<bool> _marketingInsights = ValueNotifier(false);
  final ValueNotifier<bool> _propertyReport = ValueNotifier(false);
  final ValueNotifier<bool> _propertyUpdates = ValueNotifier(false);
  final ValueNotifier<bool> _appNews = ValueNotifier(false);
  final ValueNotifier<bool> _listingUpdates = ValueNotifier(false);
  final ValueNotifier<bool> _searchUpdates = ValueNotifier(false);

  @override
  void dispose() {
    _marketingInsights.dispose();
    _propertyReport.dispose();
    _propertyUpdates.dispose();
    _appNews.dispose();
    _listingUpdates.dispose();
    _searchUpdates.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              _buildSection(
                title: "Property Market Updates",
                children: [
                  _buildSettingTile(
                    title: "Market Insights: Trends in Your Neighborhood",
                    description:
                        "Coming Soon! Opt-in now to be the first to receive dynamic market insights for your neighborhood.",
                    notifier: _marketingInsights,
                  ),
                  _buildDivider(),
                  _buildSettingTile(
                    title: "The New Zealand Property Report",
                    description:
                        "Stay informed on the New Zealand property market with our monthly report.",
                    notifier: _propertyReport,
                  ),
                  _buildDivider(),
                  _buildSettingTile(
                    title: "Additional Property Updates",
                    description:
                        "Stay informed with newsletters, market analysis, and property updates.",
                    notifier: _propertyUpdates,
                  ),
                ],
              ),
              _buildSection(
                title: "Other Updates",
                children: [
                  _buildSettingTile(
                    title: "Viewing NZ. news",
                    description:
                        "Stay updated with the latest news from our business.",
                    notifier: _appNews,
                  ),
                  _buildDivider(),
                  _buildSettingTile(
                    title: "Listing Updates",
                    description:
                        "Get updates for properties you have saved or are interested in.",
                    notifier: _listingUpdates,
                  ),
                  _buildDivider(),
                  _buildSettingTile(
                    title: "Saved search Updates",
                    description:
                        "Receive updates on new properties matching your saved search. To adjust your alert frequency click here.",
                    notifier: _searchUpdates,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.gunmetal600,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Text(
              title,
              style: context.titleLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.gray50,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  Row _buildSettingTile({
    required String title,
    required String description,
    required ValueNotifier notifier,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
              ),
              const Gap(4),
              Text(description, style: context.bodyMedium),
            ],
          ),
        ),
        const Gap(8),
        ValueListenableBuilder(
          valueListenable: notifier,
          builder: (context, value, child) {
            return CupertinoSwitch(
              activeTrackColor: AppColors.primary,
              value: value,
              onChanged: (value) {
                notifier.value = value;
              },
            );
          },
        ),
      ],
    );
  }

  Divider _buildDivider() => Divider(color: AppColors.gray300, height: 32);
}
