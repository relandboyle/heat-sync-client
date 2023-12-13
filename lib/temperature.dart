import 'package:ft_test_app/classes/building_data.dart';
import 'package:ft_test_app/classes/unit_data.dart';
import 'package:ft_test_app/widgets/building_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:ft_test_app/widgets/heat_sync_card.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  var server = 'https://heat-sync-534f0413abe0.herokuapp.com/';
  var localServer = 'localhost:8089';

  List<BuildingData> buildingList = <BuildingData>[];
  List<String> testList = ['test1', 'test2', 'test3'];
  late List<UnitData> unitList = [];
  late DateTimeRange dateRange;
  var selectedBuilding = BuildingData(fullAddress: '');
  late UnitData selectedUnit;

  void selectBuilding(BuildingData building) {
    print("PARENT");
    setState(() => selectedBuilding = building);
    print(selectedBuilding.fullAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(selectedBuilding.fullAddress),
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
            width: 400,
            child: BuildingAutocomplete(selectBuilding: selectBuilding),
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
