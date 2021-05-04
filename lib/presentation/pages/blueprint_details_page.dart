import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_architect/application/viewmodels/blueprint_details_viewmodel.dart';
import 'package:time_architect/presentation/widgets/domains/blocks/block_card.dart';
import 'package:time_architect/presentation/widgets/domains/blueprints/create_block_button.dart';
import 'package:time_architect/providers.dart';

class BlueprintDetailsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final vm = watch(blueprintDetailsProvider);
    final notifier = watch(blueprintDetailsProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('Blueprint Details'),
      ),
      floatingActionButton: CreateBlockButton(
        onTap: () {
          notifier.addBlock();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Builder(
        builder: (context) {
          if (vm is BlueprintDetailsLoaded) {
            final bp = vm.blueprint;
            return ListView.builder(
              itemCount: bp.blocks.length,
              itemBuilder: (context, index) {
                final block = bp.blocks[index];
                return BlockCard(
                  time: block.time.toString(),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
