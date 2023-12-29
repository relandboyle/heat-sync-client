import 'package:flutter/material.dart';
// import 'package:heat_sync/classes/unit_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  // final List<num> data;
  const LineChart({super.key});

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List<SampleData> _sampleData = [];

  @override
  void initState() {
    _sampleData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        width: 700,
        child: SafeArea(
          child: Scaffold(
            body: SfCartesianChart(
              title: ChartTitle(text: "Test Chart Title"),
              legend: const Legend(isVisible: true),
              series: <ChartSeries>[
              LineSeries<SampleData, double>(
                  dataSource: _sampleData,
                  xValueMapper: (SampleData sales, _) => sales.year,
                  yValueMapper: (SampleData sales, _) => sales.sales,
                  dataLabelSettings: const DataLabelSettings(isVisible: true, color: Color.fromARGB(0, 54, 87, 137)))
            ]),
          ),
        ));
  }

  List<SampleData> getChartData() {
    final List<SampleData> sampleData = [
      SampleData(2017, 25),
      SampleData(2018, 12),
      SampleData(2019, 73),
      SampleData(2020, 37),
      SampleData(2021, 55),
    ];
    return sampleData;
  }
}

class SampleData {
  SampleData(this.year, this.sales);
  final double year;
  final double sales;
}
