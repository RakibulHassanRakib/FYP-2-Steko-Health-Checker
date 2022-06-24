import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MultiTileGraph extends StatefulWidget {
  final double val1;
  final double val2;

  const MultiTileGraph({Key key, this.val1, this.val2}) : super(key: key);

  @override
  MultiTileGraphState createState() => MultiTileGraphState();
}

class MultiTileGraphState extends State<MultiTileGraph> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData('MON', 0, 0),
      ChartData('TUE', 0, 0),
      ChartData('WED', 0, 0),
      ChartData('THU', 0, 0),
      ChartData('FRI', widget.val1, widget.val2),
      ChartData('SAT', 0, 0),
      ChartData('SUN', 0, 0),
    ];
    return SfCartesianChart(
      palette: const <Color>[
        Color(0xFF6ABA45),
        Color(0xFFE6C042),
      ],
      primaryXAxis: CategoryAxis(),
      series: <CartesianSeries>[
        ColumnSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y),
        ColumnSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y1)
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final String x;
  final double y;
  final double y1;
}
