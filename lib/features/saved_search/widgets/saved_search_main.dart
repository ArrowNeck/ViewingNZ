import 'package:flutter/material.dart';
import 'package:viewing_nz/features/saved_search/widgets/saved_search_card.dart';
import 'package:viewing_nz/features/saved_search/widgets/saved_search_edit.dart';

class SavedSearchMain extends StatefulWidget {
  const SavedSearchMain({super.key});

  @override
  State<SavedSearchMain> createState() => _SavedSearchMainState();
}

class _SavedSearchMainState extends State<SavedSearchMain> {
  final ValueNotifier<bool> showEditView = ValueNotifier(false);

  @override
  void dispose() {
    showEditView.dispose();
    super.dispose();
  }

  void _toggleView() {
    showEditView.value = !showEditView.value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: showEditView,
      builder: (context, value, child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: value
              ? SavedSearchEdit(onExitEditView: _toggleView)
              : SavedSearchCard(onEditPressed: _toggleView),
        );
      },
    );
  }
}
