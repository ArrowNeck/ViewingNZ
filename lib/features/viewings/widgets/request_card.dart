import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/core_utils.dart';
import 'package:viewing_nz/core/widgets/property_tag.dart';
import 'package:viewing_nz/core/widgets/rate_agent_popup.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({super.key, this.isPast = false});

  final bool isPast;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "32B Dart Place, Fernhill, Queenstown",
            style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Icon(SolarIconsOutline.home1),
                const Gap(8),
                Text(
                  "House",
                  style: context.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(12),
                PropertyTag.dark(name: "Rent"),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _buildDetailRow(context, "Time", "7:30am - 8:00am"),
              ),
              Expanded(child: _buildDetailRow(context, "Date", "3 Mar 2025")),
            ],
          ),
          _buildDetailRow(context, "Location", "Queenstown"),
          _buildDetailRow(
            context,
            "Status",
            "Response Pending",
            valueColor: AppColors.info500,
          ),
          const Gap(16),
          if (isPast)
            ElevatedButton.icon(
              onPressed: () => CoreUtils.heroDialog(RateAgentPopup()),
              icon: const Icon(SolarIconsOutline.star),
              label: const Text('Rate Your Agent'),
            )
          else
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(SolarIconsOutline.chatRoundLine),
                  label: const Text('Chat'),
                ),
                const Gap(12),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(SolarIconsOutline.routing2),
                  label: const Text('Directions'),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value, {
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.bodyMedium.copyWith(fontWeight: FontWeight.w500),
          ),
          Gap(4),
          Text(
            value,
            style: context.bodyMedium.copyWith(
              color: valueColor ?? AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
