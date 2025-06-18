import 'package:flutter/material.dart';
import 'package:viewing_nz/features/home/widgets/viewing_card.dart';

class SavedPropertiesScreen extends StatefulWidget {
  const SavedPropertiesScreen({super.key});

  @override
  State<SavedPropertiesScreen> createState() => _SavedPropertiesScreenState();
}

class _SavedPropertiesScreenState extends State<SavedPropertiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (_, index) => ViewingCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
