import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineGraph extends StatefulWidget {
  @override
  _LineGraphState createState() => _LineGraphState();
}

class _LineGraphState extends State<LineGraph> {
  List<HeartRateData> chartData = [];
  List<String> xLabels = [];
  final months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC',
  ];
  List<HeartRateData> chartData2 = [];
  @override
  void initState() {
    super.initState();
    chartData = getHeartRateData();
    chartData2 = getHeartRateData2();
    // Generate x-axis labels for the next 7 days
    final today = DateTime.now();
    xLabels = months;
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      margin: EdgeInsets.all(0),
      plotAreaBorderWidth: 0,
      borderWidth: 0,
      borderColor: ktransparent,
      plotAreaBorderColor: ktransparent,

      primaryXAxis: NumericAxis(
        borderColor: ktransparent,
        majorTickLines: MajorTickLines(width: 0),
        majorGridLines: MajorGridLines(width: 0),
        maximumLabels: 12,
        minimum: 0,
        maximum: 11,

        labelAlignment: LabelAlignment.center,
        axisLine: AxisLine(color: Colors.grey.withOpacity(0.3)),
        labelStyle: TextStyle(color: Colors.black),
        interval: 1,
        axisLabelFormatter: (AxisLabelRenderDetails args) {
          int index = args.value.toInt();
          if (index >= 0 && index < xLabels.length) {
            return ChartAxisLabel(
              xLabels[index],
              TextStyle(color: Colors.white),
            );
          }
          return ChartAxisLabel('', TextStyle(color: Colors.white));
        },
        plotBands: <PlotBand>[
          PlotBand(
            start: 3, // Position for the vertical line
            end: 3,
            verticalTextAlignment: TextAnchor.middle,
            isRepeatable: T,
            isVisible: F,
            borderWidth: 2,
            borderColor: Colors.green,
            dashArray: [5, 5], // Dotted line style
          ),
        ],
      ),

      primaryYAxis: NumericAxis(
        minimum: 50,
        maximum: 140,
        interval: 10,
        isVisible: false,
        majorTickLines: MajorTickLines(width: 0),
        majorGridLines: MajorGridLines(width: 0),
        axisLine: AxisLine(color: Colors.transparent, width: 0),
      ),
      series: <SplineAreaSeries<HeartRateData, double>>[
        SplineAreaSeries<HeartRateData, double>(
          dataSource: chartData,
          xValueMapper: (HeartRateData data, _) => data.time,
          yValueMapper: (HeartRateData data, _) => data.bpm,

          borderGradient: LinearGradient(
            colors: [
              kQuaternaryColor,
              kSecondaryColor,
              kSecondaryColor,
              kQuaternaryColor,
            ],
          ),
          borderWidth: 3,
          gradient: LinearGradient(
            colors: [
              kSecondaryColor.withOpacity(0.1),
              kSecondaryColor.withOpacity(0.1),
              kSecondaryColor.withOpacity(0.1),
              kSecondaryColor.withOpacity(0.1),
            ],
          ),
          splineType: SplineType.natural,
        ),
        // SplineAreaSeries<HeartRateData, double>(
        //   dataSource: chartData2,
        //   xValueMapper: (HeartRateData data, _) => data.time,
        //   yValueMapper: (HeartRateData data, _) => data.bpm,
        //   borderColor: Color(0xffF9EC31),
        //   borderWidth: 3,
        //   color: ktransparent,
        //   splineType: SplineType.natural,
        // ),
      ],
      tooltipBehavior: TooltipBehavior(
        enable: true,
        borderWidth: 2,
        borderColor: Colors.blue,
      ),
    );
  }
}

class HeartRateData {
  final double time;
  final double bpm;
  HeartRateData(this.time, this.bpm);
}

List<HeartRateData> getHeartRateData() {
  return [
    HeartRateData(0, 80),
    HeartRateData(1, 85),
    HeartRateData(2, 90),
    HeartRateData(3, 95), // Vertical line will appear here
    HeartRateData(4, 70),
    HeartRateData(5, 105),
    HeartRateData(6, 110),
    HeartRateData(7, 80),
    HeartRateData(8, 85),
    HeartRateData(9, 90),
    HeartRateData(10, 95), // Vertical line will appear here
    HeartRateData(11, 70),
  ];
}

List<HeartRateData> getHeartRateData2() {
  return [
    HeartRateData(0, 60),
    HeartRateData(1, 70),
    HeartRateData(2, 75),
    HeartRateData(3, 80),
    HeartRateData(4, 85),
    HeartRateData(5, 100),
    HeartRateData(6, 130),
  ];
}
