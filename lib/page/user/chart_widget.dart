import 'dart:typed_data';

import 'package:dashboard/main.dart';
import 'package:dashboard/tensorflow/segment.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tflite_web/tflite_web.dart';

final class ChartWidget extends StatelessWidget {
  const ChartWidget({
    required this.title,
    required this.values,
    super.key,
  });

  static const int max = 5;
  static const double threshold = 0.5;

  final String title;
  final Iterable<(double, double)> values;

  @override
  Widget build(BuildContext context) {
    final segments = values
        .fold(
          [<(double, double)>[]],
          (a, c) {
            if (a.last.length < max) {
              a.last.add(c);
            } else {
              a.add([c]);
            }

            return a;
          },
        )
        .map((x) => x.feature)
        .map(
          (x) => Tensor(
            Float32List.fromList(x),
            shape: [1, x.length],
            type: TFLiteDataType.float32,
          ),
        )
        .map((x) => model?.predict(x))
        .whereType<Tensor>()
        .map((x) => x.dataSync())
        .whereType<Float32List>()
        .map((x) => x[0] < threshold)
        .toList();

    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 50,
              showTitles: true,
            ),
          ),
          topTitles: AxisTitles(
            axisNameWidget: Text(
              title,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            axisNameSize: (Theme.of(context).textTheme.labelLarge?.fontSize ?? 0) + 8,
          ),
          rightTitles: const AxisTitles(),
          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 50,
              showTitles: true,
            ),
          ),
        ),
        lineBarsData: [
          ...segments.indexed.map((x) {
            final v = List.generate(max + 1, (i) => values.elementAtOrNull(x.$1 * max + i)).nonNulls;

            return LineChartBarData(
              color: x.$2 ? Colors.red : null,
              spots: [
                ...v.map((x) => FlSpot(x.$1, x.$2)),
              ],
            );
          }),
        ],
      ),
    );
  }
}
