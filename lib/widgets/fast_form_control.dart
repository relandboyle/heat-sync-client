import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

class MyFormPage extends StatelessWidget {
  MyFormPage({super.key, required this.title, required this.data});

  final formKey = GlobalKey<FormState>();
  final String title;
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FastForm(
            formKey: formKey,
            children: [
              const FastTextField(
                name: 'field_destination',
                labelText: 'Destination',
                placeholder: 'Where are you going?',
              ),
              FastDateRangePicker(
                name: 'field_check_in_out',
                labelText: 'Check-in - Check-out',
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              ),
              FastAutocomplete(
                labelText: "Input",
                name: "TEST",
                options: data,
                // onChanged: (value) => {print(value)},
                // onSelected: (option) => {print(formKey)},
              )
            ],
          ),
        ),
      ),
    );
  }
}
