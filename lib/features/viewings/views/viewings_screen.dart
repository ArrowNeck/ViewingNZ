import 'package:flutter/material.dart';
import 'package:viewing_nz/core/widgets/app_search_bar.dart';
import 'package:viewing_nz/features/viewings/widgets/request_card.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              ViewingHeader(),
              AppSearchBar(),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_, index) =>
                      RequestCard(isPast: index % 2 == 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
