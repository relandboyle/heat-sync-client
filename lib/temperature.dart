import 'package:heat_sync/classes/building_data.dart';
import 'package:heat_sync/classes/unit_data.dart';
import 'package:heat_sync/widgets/building_autocomplete.dart';
import 'package:heat_sync/widgets/line_chart.dart';
import 'package:heat_sync/widgets/unit_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:heat_sync/widgets/heat_sync_card.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  var server = 'https://heat-sync-534f0413abe0.herokuapp.com/';
  var localServer = 'localhost:8089';

  List<BuildingData> buildingList = <BuildingData>[];
  List<UnitData> unitList = <UnitData>[];
  List<String> testList = ['test1', 'test2', 'test3'];
  String selectedDateRange = '';
  var selectedBuilding = BuildingData(fullAddress: '');
  var selectedUnit = UnitData(fullUnit: '');

  void selectDateRange(DateRangePickerSelectionChangedArgs args) {
    setState(() => selectedDateRange = args.value.toString().substring(21));
    debugPrint(selectedDateRange.substring(21));
    debugPrint(selectedDateRange.substring(21));
  }

  void selectBuilding(BuildingData building) {
    setState(() => selectedBuilding = building);
    logger.i('Temperature/selectBuilding(): ${selectedBuilding.fullAddress}');
  }

  void selectUnit(UnitData unit) {
    setState(() => selectedUnit = unit);
    logger.i('Temperature/selectUnit(): ${selectedUnit.fullUnit}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(selectedBuilding.fullAddress),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(10),
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
            width: 300,
            child: BuildingAutocomplete(selectBuilding: selectBuilding),
          ),
          SizedBox(
            height: 100,
            width: 300,
            child: UnitAutocomplete(selectUnit: selectUnit),
          ),
        ]),
      ),
      const Padding(
        padding: EdgeInsets.all(20),
        child: Card(
          elevation: 3,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            LineChart(),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(children: [
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text("Current Temp:"),
                      SizedBox(width: 20),
                      Text("Value"),
                    ]),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text("High Temp:"),
                      SizedBox(width: 20),
                      Text("Value"),
                    ]),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text("Low Temp:"),
                      SizedBox(width: 20),
                      Text("Value"),
                    ]),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text("Violations:"),
                      SizedBox(width: 20),
                      Text("Value"),
                    ]),
                  ),
                ),
              ]),
            )
          ]),
        ),
      ),
    ]);
  }
}
