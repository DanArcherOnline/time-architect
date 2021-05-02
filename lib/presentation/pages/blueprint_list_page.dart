import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:time_architect/domain/entites/blueprint.dart';
import 'package:time_architect/presentation/core/router.gr.dart';
import 'package:time_architect/presentation/widgets/domains/blueprints/blueprint_card.dart';
import 'package:time_architect/presentation/widgets/domains/blueprints/create_blueprint_button.dart';

class BlueprintListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blueprints'),
      ),
      floatingActionButton: CreateBlueprintButton(
        onTap: () => context.router.push(BlueprintFormRoute()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
  Blueprint(title: 'Blueprint 1'),
  Blueprint(title: 'Blueprint 2'),
  Blueprint(title: 'Blueprint 3'),
];
