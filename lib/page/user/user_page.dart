import 'dart:collection';

import 'package:dashboard/api/user_api.dart';
import 'package:dashboard/model/model.dart';
import 'package:dashboard/module/module.dart';
import 'package:dashboard/page/user/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class UserPage extends ConsumerWidget {
  const UserPage({
    required this.id,
    super.key,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('[UserPage] build');
    final user = ref.watch(getUserInfoProvider(id));
    final emg = ref.watch(getEmgStreamProvider(id));

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          Center(
            child: Text((user.value?.name).elvis),
          ).sliverBox,
          emg.when(
            data: (value) {
              final emgMap = value.fold(SplayTreeMap<String, List<List<Emg>>>(), (a, c) {
                if (a.containsKey(c.createdAt.date)) {
                  if ((a[c.createdAt.date]?.last.lastOrNull?.time ?? 0) > c.time) {
                    a[c.createdAt.date]?.add([c]);
                  } else {
                    a[c.createdAt.date]?.last.add(c);
                  }
                } else {
                  a[c.createdAt.date] = [
                    [c],
                  ];
                }

                return a;
              });
              final emgDateList = emgMap.entries.map((x) => MapEntry(x.key, x.value.reversed)).toList().reversed;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...emgDateList.expand(
                    (x) => x.value.map(
                      (y) => SizedBox(
                        height: 300,
                        child: ChartWidget(
                          title: '${y.firstOrNull?.createdAt.add(const Duration(hours: 9))}',
                          values: y.map((z) => (z.time, z.value)),
                        ),
                      ),
                    ),
                  ),
                ],
              ).sliverBox;
            },
            error: (err, st) => Center(child: Text('$err')).sliverBox,
            loading: () => const Center(child: CircularProgressIndicator()).sliverBox,
          ),
        ],
      ),
    );
  }
}
