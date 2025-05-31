import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

final class ChartWidget extends StatelessWidget {
  const ChartWidget({
    required this.title,
    required this.values,
    super.key,
  });

  final String title;
  final Iterable<(double, double)> values;

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              axisNameWidget: Text(title, style: Theme.of(context).textTheme.titleLarge),
              axisNameSize: (Theme.of(context).textTheme.titleLarge?.fontSize ?? 0) + 10,
            ),
            rightTitles: const AxisTitles(),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [...values.map((x) => FlSpot(x.$1, x.$2))],
            ),
          ],
        ),
      );
}
