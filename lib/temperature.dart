import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  var accountKey = dotenv.env['ACCOUNT_KEY'];
  var webApi = dotenv.env['API_URL'];

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        Row(
          children: [Text("Placeholder Text!")],
        ),
        Row(children: [
          Card(),
          Card(),
          Column(children: [
            ElevatedButton(onPressed: null, child: Text("Add Building")),
            ElevatedButton(onPressed: null, child: Text("Add Unit")),
            ElevatedButton(onPressed: null, child: Text("C / F")),
          ]),
        ]),
        Row( children: [
          AutocompleteBasicExample(),
          AutocompleteBasicExample(),
          AutocompleteBasicExample(),
        ]),
        Row(children: [
          Card(),
          Column(children: [
            Row(children: [
              Text("Label"),
              Text("Value"),
            ]),
            Row(children: [
              Text("Label"),
              Text("Value"),
            ]),
            Row(children: [
              Text("Label"),
              Text("Value"),
            ]),
            Row(children: [
              Text("Label"),
              Text("Value"),
            ]),
          ])
        ]),
      ]),
    );
  }
}

class AutocompleteBasicExample extends StatelessWidget {
  const AutocompleteBasicExample({super.key});

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
    );
  }
}
