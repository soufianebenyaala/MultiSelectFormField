import 'package:flutter/material.dart';
import 'package:multi_select_form_field/multi_select_form_field.dart';

class MultiSelectFormFieldExample extends StatefulWidget {
  const MultiSelectFormFieldExample({super.key});

  @override
  State<MultiSelectFormFieldExample> createState() =>
      _MultiSelectFormFieldExampleState();
}

class _MultiSelectFormFieldExampleState
    extends State<MultiSelectFormFieldExample> {
  final _formKey = GlobalKey<FormState>();
  List<String> _selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Multi Select Form Field Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MultiSelectFormField(
                items: const ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
                labelText: 'Select Options',
                initialValue: _selectedOptions,
                onSaved: (selected) {
                  _selectedOptions = selected ?? [];
                },
                validator: (selected) {
                  if (selected == null || selected.isEmpty) {
                    return 'Please select at least one option';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Selected options: $_selectedOptions'),
                    ));
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
