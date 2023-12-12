// import 'dart:io';
// import 'dart:convert';
import 'dart:async';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:ft_test_app/classes/building_data.dart';
import 'package:ft_test_app/classes/unit_data.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ft_test_app/widgets/heat_sync_card.dart';
// import 'package:ft_test_app/classes/temperature_entry.dart';
// import 'package:ft_test_app/classes/channel_data.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  var server = dotenv.env['HEAT_SYNC_SERVER'];

  late List<BuildingData> buildingList = [];
  late List<UnitData> unitList = [];
  late DateTimeRange dateRange;
  late BuildingData selectedBuilding;
  late UnitData selectedUnit;
  Timer? _timer;

  Future<void> searchBuildings(value) async {
    print(value);
    Uri resource = Uri(
        scheme: 'https', host: server, path: 'channels', queryParameters: {});

    await http.post(resource).then((data) => print(data)).catchError((err) {
      return err;
    });
  }

  Future<void> searchUnits(value) async {
    print(value);
    Uri resource = Uri(
        scheme: 'https', host: server, path: 'channels', queryParameters: {});

    await http.get(resource).then((data) => print(data)).catchError((err) {
      print(err);
    });
  }

  int testVar = 20;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(top: 40, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('selected building'),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          HeatSyncCard(
            title: "5",
            description: "Days since violation",
            width: 150,
            height: 150,
          ),
          HeatSyncCard(
            title: "12",
            description: "Violations this season",
            width: 150,
            height: 150,
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            height: 100,
            width: 200,
            child: FastAutocomplete(
              labelText: "Select Building",
              name: "search_buildings",
              options: buildingList,
              onChanged: (value) => {
                if (_timer?.isActive ?? false) _timer?.cancel(),
                _timer = Timer(const Duration(milliseconds: 400), () {
                  searchBuildings(value);
                })
              },
              onSelected: (option) => setState(() => selectedBuilding = option),
            ),
          ),
          SizedBox(
            height: 100,
            width: 200,
            child: FastAutocomplete(
              labelText: "Select Unit",
              name: "search_units",
              options: unitList,
              onChanged: (value) => {
                if (_timer?.isActive ?? false) _timer?.cancel(),
                _timer = Timer(const Duration(milliseconds: 400), () {
                  searchUnits(value);
                })
              },
              onSelected: (option) => setState(() => selectedUnit = option),
            ),
          ),
          SizedBox(
            height: 100,
            width: 200,
            child: FastDateRangePicker(
              name: 'date_range',
              labelText: 'Select Date Range',
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onChanged: (value) => searchUnits(value),
              onSaved: (value) => searchUnits(value),
            ),
          ),
        ]),
      ),
      const Padding(
        padding: EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          HeatSyncCard(
            title: "LINE GRAPH",
            description: "This is a placeholder",
            width: 400,
            height: 200,
          ),
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
      ),
    ]);
  }
}
