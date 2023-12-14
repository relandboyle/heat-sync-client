import 'package:heat_sync/classes/building_data.dart';
import 'package:heat_sync/classes/unit_data.dart';
import 'package:heat_sync/widgets/building_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:heat_sync/widgets/heat_sync_card.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
  // DateTimeRange dateRange = '' as DateTimeRange;
  List<String> testList = ['test1', 'test2', 'test3'];
  String selectedDateRange = '';
  var selectedBuilding = BuildingData(fullAddress: '');
  var selectedUnit = UnitData(fullUnit: '');

  void selectDateRange(DateRangePickerSelectionChangedArgs args) {
    setState(() => selectedDateRange = args.value.toString().substring(21));
    print(selectedDateRange.substring(21));
  }

  void selectBuilding(BuildingData building) {
    setState(() => selectedBuilding = building);
  }

  void selectUnit(UnitData unit) {
    setState(() => selectedUnit = unit);
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
          Column(
            children: [
              SizedBox(
                height: 100,
                width: 300,
                child: BuildingAutocomplete(selectBuilding: selectBuilding),
              ),
              SizedBox(
                height: 100,
                width: 300,
                child: BuildingAutocomplete(selectBuilding: selectBuilding),
              ),
            ],
          ),
          SizedBox(
              height: 200,
              width: 200,
              child: SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.range,
                onSelectionChanged: selectDateRange,
              )),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Column(
            children: [
              SizedBox(
                  width: 500,
                  height: 40,
                  child: Card(
                    elevation: 5,
                    child: Text(selectedDateRange, textAlign: TextAlign.center),
                  )),
              const HeatSyncCard(
                title: "LINE GRAPH",
                description: "This is a placeholder",
                width: 500,
                height: 150,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40.0),
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
    ]);
  }
}
