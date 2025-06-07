import 'package:dashboard/api/user_api.dart';
import 'package:dashboard/module/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final class MainPage extends ConsumerWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('[MainPage] build');
    final users = ref.watch(getAllUserProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          switch (users) {
            AsyncData(:final value) => Align(
                alignment: Alignment.topCenter,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    primary: true,
                    child: SizedBox(
                      width: Values.maxWidth1024 - Paddings.paddingValue24 * 2,
                      child: Table(
                        columnWidths: Map.fromEntries(
                          TableHeader.values.indexed.map((x) => MapEntry(x.$1, FlexColumnWidth(x.$2.width))),
                        ),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              borderRadius: UI.borderRadiusTableHeader,
                              color: Resource.colorNeutral.shade100,
                            ),
                            children: [
                              ...TableHeader.values.map(
                                (x) => TableCell(
                                  child: Padding(
                                    padding: Paddings.paddingVertical14,
                                    child: Text(
                                      x.value,
                                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ...value.indexed.map(
                                (x) => TableRow(
                                  decoration: x.$1.isPositive
                                      ? BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              color: Resource.colorNeutral.shade200,
                                            ),
                                          ),
                                        )
                                      : null,
                                  children: [
                                    ...[
                                      '${x.$2.id}',
                                      x.$2.name,
                                      '${x.$2.createdAt}',
                                    ].map(
                                      (y) => TableCell(
                                        child: GestureDetector(
                                          onTap: () => context.goNamed(
                                            Routes.user.name,
                                            pathParameters: {
                                              Param.id.name: '${x.$2.id}',
                                            },
                                          ),
                                          child: MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: Padding(
                                              padding: Paddings.paddingVertical14,
                                              child: Text(
                                                y,
                                                style: Theme.of(context).textTheme.labelMedium,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              ).sliverFill,
            AsyncError(:final error) => Center(
                child: Text('$error'),
              ).sliverBox,
            _ => const Center(
                child: CircularProgressIndicator(),
              ).sliverFill,
          },
        ],
      ),
    );
  }
}
