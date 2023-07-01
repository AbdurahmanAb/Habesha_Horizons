import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../models/currency_model.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(title: AxisTitle(text: "ETB")),
      title: ChartTitle(
        text: "Live Currency Exchange",
        textStyle: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
      series: <ChartSeries>[
        ColumnSeries<CurrencyData, String>(
            dataSource: GetColumn(),
            xValueMapper: (CurrencyData currency, _) => currency.x,
            yValueMapper: (CurrencyData currency, _) => currency.y)
      ],
    ));
  }
}
