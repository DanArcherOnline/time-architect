import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_architect/application/viewmodels/blueprint_details_viewmodel.dart';
import 'package:time_architect/domain/entites/block.dart';
import 'package:time_architect/domain/entites/blueprint.dart';

class BlueprintDetailsNotifier extends StateNotifier<BlueprintDetailsState> {
  final blueprint = Blueprint(title: 'blueprint 1');

  BlueprintDetailsNotifier() : super(BlueprintDetailsIntial());
  void addBlock() {
    blueprint.addBlock(Block(time: Duration(seconds: 10)));
    state = BlueprintDetailsLoaded(blueprint);
  }
}
