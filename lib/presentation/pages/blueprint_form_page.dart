import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BlueprintFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Blueprint'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => context.router.pop(),
          ),
        ],
      ),
    );
  }
}
