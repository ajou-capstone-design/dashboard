import 'package:dashboard/module/module.dart';
import 'package:dashboard/page/main/main_page.dart';
import 'package:dashboard/page/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
        title: 'Ajou Capstone Design Dashboard',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        routerConfig: routes,
        debugShowCheckedModeBanner: false,
      );
}

final GoRouter routes = GoRouter(
  initialLocation: Routes.main.path,
  routes: [
    GoRoute(
      name: Routes.main.name,
      path: Routes.main.path,
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      name: Routes.user.name,
      path: '${Routes.user.path}/:${Param.id.name}',
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters[Param.id.name].elvis).elvis;
        return UserPage(
          id: id,
        );
      },
    ),
  ],
);
