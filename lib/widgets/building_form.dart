import 'package:flutter/material.dart';

class BuildingForm extends StatefulWidget {
  const BuildingForm({super.key});

  @override
  State<BuildingForm> createState() => _BuildingFormState();
}

class _BuildingFormState extends State<BuildingForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: 500,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Address',
                border: OutlineInputBorder(borderSide: BorderSide()),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'City',
                border: OutlineInputBorder(borderSide: BorderSide()),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'State',
                border: OutlineInputBorder(borderSide: BorderSide()),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Zip Code',
                border: OutlineInputBorder(borderSide: BorderSide()),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                      }
                    },
                    child: const Text('Create / Update'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                      }
                    },
                    child: const Text('Create / Update'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
