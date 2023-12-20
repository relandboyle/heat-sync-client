import 'package:flutter/material.dart';
import 'package:heat_sync/classes/unit_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  final List<UnitData> data;
  const LineChart({super.key, required this.data});


  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 500,
        child: SafeArea(
          child: Scaffold(
                body: SfCartesianChart(),
              ),
        ));
  }
}
