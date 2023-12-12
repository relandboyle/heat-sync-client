import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

class MyFormPage extends StatelessWidget {
  MyFormPage({super.key, required this.title, required this.data});

  final formKey = GlobalKey<FormState>();
  final String title;
  final List<String> data;

  void printValue(value) {
    // print(value);
    // print(value.runtimeType);
  }

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
              FastTextField(
                name: 'field_destination',
                labelText: 'Destination',
                placeholder: 'Where are you going?',
                onChanged: (value) => printValue(value),
              ),
              FastDateRangePicker(
                name: 'field_check_in_out',
                labelText: 'Check-in - Check-out',
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                onChanged: (value) => printValue(value),
                onSaved: (value) => printValue(value),
              ),
              FastAutocomplete(
                labelText: "Input",
                name: "TEST",
                options: data,
                onChanged: (value) => printValue(value),
                onSelected: (option) => printValue(option),
              )
            ],
          ),
        ),
      ),
    );
  }
}
