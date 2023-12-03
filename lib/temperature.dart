import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ft_test_app/widgets/heat_sync_card.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  var accountKey = dotenv.env['ACCOUNT_KEY'];
  var webApi = dotenv.env['WEB_API_URL'];
  static const List<String> options = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  int testVar = 20;

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Please select a building:'),
        ],
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton(onPressed: null, child: Text("Something")),
          ElevatedButton(onPressed: null, child: Text("Something Else")),
          ElevatedButton(onPressed: null, child: Text("C / F")),
        ]),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton(onPressed: null, child: Text("From Date")),
        ElevatedButton(onPressed: null, child: Text("To Date")),
        ElevatedButton(
            onPressed: null, child: Text("Get Data")),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
    ]);
  }
}
