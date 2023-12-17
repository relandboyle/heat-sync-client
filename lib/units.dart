import 'package:flutter/material.dart';
import 'package:heat_sync/classes/building_data.dart';
import 'package:heat_sync/widgets/heat_sync_card.dart';
import 'package:heat_sync/widgets/unit_form.dart';

class UnitsPage extends StatefulWidget {
  const UnitsPage({super.key});

  @override
  State<UnitsPage> createState() => _UnitsPageState();
}

class _UnitsPageState extends State<UnitsPage> {
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
            children: [HeatSyncCard(title: "Placeholder Location", description: "Selected Apartment Unit", width: 500, height: 100)]),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: UnitForm()),
        ],
      )
    ]);
  }
}
