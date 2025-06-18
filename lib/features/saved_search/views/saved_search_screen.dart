import 'package:flutter/material.dart';
import 'package:viewing_nz/core/widgets/app_search_bar.dart';
import 'package:viewing_nz/features/saved_search/widgets/saved_search_header.dart';
import 'package:viewing_nz/features/saved_search/widgets/saved_search_main.dart';

class SavedSearchScreen extends StatefulWidget {
  const SavedSearchScreen({super.key});

  @override
  State<SavedSearchScreen> createState() => _SavedSearchScreenState();
}

class _SavedSearchScreenState extends State<SavedSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SavedSearchHeader(),
              AppSearchBar(),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (_, index) => SavedSearchMain(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
