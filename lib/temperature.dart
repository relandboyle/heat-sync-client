import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ft_test_app/widgets/heat_sync_card.dart';
import 'package:ft_test_app/classes/temperature_entry.dart';
import 'package:ft_test_app/classes/channel_data.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  var accountKey = dotenv.env['ACCOUNT_KEY'];
  var webApi = dotenv.get('WEB_API', fallback: 'API URL not found');
  var server = dotenv.env['HEAT_SYNC_SERVER'];
  late ChannelData channelData;
  var test = const String.fromEnvironment("TEST_ARG");

  void mapResponse(response) {
    // print(response.body);
    // print(response.body.runtimeType);
    ChannelData channelData = ChannelData.fromJson(jsonDecode(response.body));
    print(Map.from(channelData.channels[0]));
    SensorData channel1 = SensorData.fromJson(channelData.channels[0]);
    print(channel1.lastValues);
    LastValues lvOne = LastValues.fromJson(jsonDecode(channel1.lastValues));
    print(lvOne);
  }

  Future<void> getCurrentData() async {
    // Uri resource = Uri(
    //     scheme: 'https',
    //     host: server,
    //     path: 'channels',
    //     queryParameters: {'account_key': accountKey});

    // await http
    //     .get(resource)
    //     .then((data) => mapResponse(data))
    //     .catchError((err) {
    //   print(err);
    //   return err;
    // });

    // print(channelData);
    print("TESTING ENVIRONMENT VARIABLE");
    print(test);
    print("TESTED?");
  }

  int testVar = 20;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Please select a building:'),
        ],
      ),
      const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const ElevatedButton(onPressed: null, child: Text("From Date")),
        const ElevatedButton(onPressed: null, child: Text("To Date")),
        ElevatedButton(
            onPressed: () {
              getCurrentData();
            },
            child: const Text("Get Data")),
      ]),
      const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
