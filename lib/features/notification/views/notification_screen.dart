import 'package:flutter/material.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/features/notification/widgets/notification_card.dart';
import 'package:viewing_nz/features/notification/widgets/notification_header.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              NotificationHeader(),
              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  itemBuilder: (_, index) => NotificationCard(),
                  separatorBuilder: (_, __) =>
                      Divider(height: 0, color: AppColors.gray300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
