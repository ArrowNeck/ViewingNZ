import 'package:flutter/material.dart';
import 'package:viewing_nz/core/widgets/app_search_bar.dart';
import 'package:viewing_nz/features/viewings/widgets/viewing_card.dart';
import 'package:viewing_nz/features/viewings/widgets/viewing_header.dart';

class ViewingsScreen extends StatefulWidget {
  const ViewingsScreen({super.key});

  @override
  State<ViewingsScreen> createState() => _ViewingsScreenState();
}

class _ViewingsScreenState extends State<ViewingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ViewingHeader(),
            AppSearchBar(),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (_, index) => ViewingCard(isPast: index % 2 == 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
