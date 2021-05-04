//TODO turn viewmodels into freezed classes
import 'package:time_architect/domain/entites/blueprint.dart';

abstract class BlueprintDetailsState {}

class BlueprintDetailsIntial implements BlueprintDetailsState {}

class BlueprintDetailsLoaded implements BlueprintDetailsState {
  final Blueprint blueprint;

  BlueprintDetailsLoaded(this.blueprint);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BlueprintDetailsLoaded && other.blueprint == blueprint;
  }

  @override
  int get hashCode => blueprint.hashCode;
}
