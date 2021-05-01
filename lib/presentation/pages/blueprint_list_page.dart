import 'package:flutter/material.dart';
import 'package:time_architect/domain/entites/blueprint.dart';
import 'package:time_architect/presentation/widgets/domains/blueprints/blueprint_card.dart';

class BlueprintListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TimeArchitect'),
      ),
      body: ListView.builder(
        itemCount: dummyBlueprintList.length,
        itemBuilder: (context, index) {
          final blueprint = dummyBlueprintList[index];
          return BlueprintCard(title: blueprint.title);
        },
      ),
    );
  }
}

//TODO replace dummy list
final dummyBlueprintList = [
  Blueprint(title: 'test1'),
  Blueprint(title: 'test2'),
  Blueprint(title: 'test3'),
];
