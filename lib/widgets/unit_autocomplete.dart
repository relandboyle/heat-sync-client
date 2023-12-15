import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:heat_sync/classes/unit_data.dart';
import 'package:http/http.dart' as http;

class UnitAutocomplete extends StatefulWidget {
  final Function selectUnit;

  const UnitAutocomplete({Key? key, required this.selectUnit}) : super(key: key);

  @override
  State<UnitAutocomplete> createState() => UnitAutocompleteState();
}

class UnitAutocompleteState extends State<UnitAutocomplete> {
  String? _currentQuery;
  late Iterable<UnitData> _lastOptions = <UnitData>[];

  Future<Iterable<UnitData>?> _search(String query) async {
    _currentQuery = query;

    // try {
      final response = await http.post(
        Uri.parse("http://localhost:8089/api/v1/unit/searchUnits"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'fullUnit': query,
        }),
      );

      Iterable res = json.decode(response.body);
      _lastOptions = List<UnitData>.from(res.map((model) => UnitData.fromJson(model)));

      return _lastOptions.where((UnitData option) {
        return option.fullUnit.toLowerCase().contains(query.toLowerCase());
      });
    // } catch (error) {
    //   return null;
    // } finally {
    //   // If another search happened after this one, throw away these options.
    //   if (_currentQuery != query) {
    //     return null;
    //   }
    //   _currentQuery = null;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Autocomplete<UnitData>(
          optionsBuilder: (TextEditingValue textEditingValue) async {
            final Iterable<UnitData>? options = await _search(textEditingValue.text);
            return options ?? _lastOptions;
          },
          displayStringForOption: (option) => option.fullUnit,
          onSelected: (UnitData selection) {
            widget.selectUnit(selection);
          },
        ),
      ],
    );
  }
}
