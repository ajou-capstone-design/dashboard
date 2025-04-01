import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Ajou Capstone Design Dashboard',
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
    home: const Scaffold(body: Center(child: Text('Hello, Ajou Capstone Design Dashboard!'))),
  );
}
