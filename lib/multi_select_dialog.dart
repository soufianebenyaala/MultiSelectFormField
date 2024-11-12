import 'package:flutter/material.dart';
import 'package:multi_select_form_field/multi_select_dialog_content.dart';

class MultiSelectDialog extends StatelessWidget {
  final List<String> items;
  final List<String> selectedItems;
  final ValueChanged<List<String>> onChanged;

  const MultiSelectDialog({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final selectedValues = await showDialog<List<String>>(
          context: context,
          builder: (BuildContext context) {
            return MultiSelectDialogContent(
              items: items,
              selectedItems: selectedItems,
            );
          },
        );

        if (selectedValues != null) {
          onChanged(selectedValues);
        }
      },
      child: Text(
        selectedItems.isNotEmpty
            ? selectedItems.join(', ')
            : 'Select options...',
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
