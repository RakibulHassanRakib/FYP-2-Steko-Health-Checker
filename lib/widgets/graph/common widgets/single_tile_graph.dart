import 'package:flutter/material.dart';
import 'package:steko_health_checker/constraints.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class SingleTileGraph extends StatefulWidget {
  double maximum;
  double minimum;
  double interval;
  double val;

  SingleTileGraph(
      {Key key,
      this.maximum = 120,
      this.minimum = 0,
      this.interval = 20,
      this.val})
      : super(key: key);

  @override
  SingleTileGraphState createState() => SingleTileGraphState();
}

class SingleTileGraphState extends State<SingleTileGraph> {
  List<_ChartData> data;
  TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('MON', 0),
      _ChartData('TUE', 0),
      _ChartData('WED', 0),
      _ChartData('THU', 0),
      _ChartData('FRI', widget.val),
      _ChartData('SAT', 0),
      _ChartData('SUN', 0)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
          minimum: widget.minimum,
          maximum: widget.maximum,
          interval: widget.interval),
      tooltipBehavior: _tooltip,
      series: <ChartSeries<_ChartData, String>>[
        ColumnSeries<_ChartData, String>(
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          name: 'Gold',
          gradient: kGreenGradientColor,
        )
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}
