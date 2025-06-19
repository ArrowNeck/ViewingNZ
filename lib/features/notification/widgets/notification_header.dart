import 'package:flutter/material.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextButton(onPressed: () {}, child: Text("Marked all as Read")),
      ),
    );
  }
}
