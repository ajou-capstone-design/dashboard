import 'package:flutter/material.dart';

extension DateTimeEx on DateTime {
  String get date => '$year-${'$month'.padLeft(2, '0')}-${'$day'.padLeft(2, '0')}';

  int get mills => millisecondsSinceEpoch - DateTime(year, month, day).millisecondsSinceEpoch;
}

extension IntOptionalEx on int? {
  int get elvis => this ?? 0;
}

extension NumEx on num {
  bool get isPositive => this > 0;
}

extension StringOptionalEx on String? {
  String get elvis => this ?? '';
}

extension WidgetEx on Widget {
  Widget get red => ColoredBox(
        color: Colors.red,
        child: this,
      );

  Widget get green => ColoredBox(
        color: Colors.green,
        child: this,
      );

  Widget get blue => ColoredBox(
        color: Colors.blue,
        child: this,
      );

  Widget get sliverBox => SliverToBoxAdapter(
        child: this,
      );

  Widget get sliverFill => SliverFillRemaining(
        hasScrollBody: false,
        child: this,
      );
}
