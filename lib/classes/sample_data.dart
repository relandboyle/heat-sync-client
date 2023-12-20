
import 'package:heat_sync/classes/unit_data.dart';

class SampleData {
  List<UnitData> units = unitsSample;

  SampleData({required this.units});

  factory SampleData.fromJson(Map<String, dynamic> json) {
    // Assuming 'units' is the key in the JSON representing the array
    List<dynamic> unitList = json['units'];
    List<UnitData> parsedUnits = unitList.map((unit) => UnitData.fromJson(unit)).toList();

    return SampleData(units: parsedUnits);
  }

  Map<String, dynamic> toJson() {
    return {'units': units.map((unit) => unit.toJson()).toList()};
  }
}

List<UnitData> unitsSample = [
  UnitData(unitId: 'c9787173-e957-4fec-9a3d-8f18f0b8224b', unitNumber: '2H', tenantName: 'Jordan Walke', fullUnit: '2H, Jordan Walke'),
  UnitData(unitId: 'b3097e24-8542-4f55-a403-e5dabadfdefa', unitNumber: '6E', tenantName: 'Ryan Carniato', fullUnit: '6E, Ryan Carniato'),
  UnitData(unitId: '4fff6a59-6989-432c-9df2-aae04e5433ab', unitNumber: '21B', tenantName: 'Navneet Dalal', fullUnit: '21B, Navneet Dalal'),
  UnitData(unitId: '975aeef5-07ab-4c11-960b-74159268e733', unitNumber: '5E', tenantName: 'Misko Hevery', fullUnit: '5E, MiÅ¡ko Hevery'),
  UnitData(unitId: 'd950b4f4-14ac-44f9-9dba-2a9d368e343f', unitNumber: '1A', tenantName: 'Super Nayo', fullUnit: '1A, Super Nayo')
  ];
