import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Notifications",
            style: context.bodyLarge.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            "Marked all as Read",
            style: context.bodyMedium.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
