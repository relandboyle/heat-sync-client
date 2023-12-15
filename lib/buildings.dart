import 'package:flutter/material.dart';
import 'package:heat_sync/classes/building_data.dart';
import 'package:heat_sync/widgets/building_form.dart';
import 'package:heat_sync/widgets/heat_sync_card.dart';

class BuildingsPage extends StatefulWidget {
  const BuildingsPage({super.key});

  @override
  State<BuildingsPage> createState() => _BuildingsPageState();
}

class _BuildingsPageState extends State<BuildingsPage> {
  var selectedBuilding = BuildingData(fullAddress: '');
  void selectBuilding(BuildingData building) {
    setState(() => selectedBuilding = building);
  }

  @override
  Widget build(BuildContext context) {
    return const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [HeatSyncCard(title: "Placeholder Location", description: "Selected Building Address", width: 500, height: 100)]),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: BuildingForm()),
        ],
      )
    ]);
  }
}
