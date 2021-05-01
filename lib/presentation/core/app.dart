import 'package:flutter/material.dart';
import 'package:time_architect/presentation/pages/blueprint_list_page.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Architect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlueprintListPage(),
    );
  }
}
