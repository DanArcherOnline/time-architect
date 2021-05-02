import 'package:flutter/material.dart';
import 'package:time_architect/presentation/core/router.gr.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      title: 'Time Architect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
