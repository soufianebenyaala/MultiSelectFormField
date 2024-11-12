import 'package:flutter/material.dart';
import 'package:multi_select_form_field/multi_select_dialog.dart';

class MultiSelectFormField extends FormField<List<String>> {
  MultiSelectFormField({
    super.key,
    required List<String> items,
    List<String>? initialValue,
    super.onSaved,
    super.validator,
    required String labelText,
  }) : super(
          initialValue: initialValue ?? [],
          builder: (FormFieldState<List<String>> state) {
            return InputDecorator(
              decoration: InputDecoration(
                labelText: labelText,
                errorText: state.errorText,
                border: const OutlineInputBorder(),
              ),
              child: MultiSelectDialog(
                items: items,
                selectedItems: state.value ?? [],
                onChanged: (selected) {
                  state.didChange(selected);
                },
              ),
            );
          },
        );
}
