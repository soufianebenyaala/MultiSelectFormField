import 'package:flutter/material.dart';

class MultiSelectDialogContent extends StatefulWidget {
  final List<String> items;
  final List<String> selectedItems;

  const MultiSelectDialogContent({
    super.key,
    required this.items,
    required this.selectedItems,
  });

  @override
  MultiSelectDialogContentState createState() =>
      MultiSelectDialogContentState();
}

class MultiSelectDialogContentState extends State<MultiSelectDialogContent> {
  late List<String> tempSelectedItems;

  @override
  void initState() {
    super.initState();
    tempSelectedItems = List.from(widget.selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Options'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items.map((item) {
            return CheckboxListTile(
              title: Text(item),
              value: tempSelectedItems.contains(item),
              onChanged: (isSelected) {
                setState(() {
                  isSelected == true
                      ? tempSelectedItems.add(item)
                      : tempSelectedItems.remove(item);
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(context, tempSelectedItems);
          },
        ),
      ],
    );
  }
}
