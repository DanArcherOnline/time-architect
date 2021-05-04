import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_architect/application/notifiers/blueprint_details_notifier.dart';
import 'package:time_architect/application/viewmodels/blueprint_details_viewmodel.dart';

final blueprintDetailsProvider =
    StateNotifierProvider<BlueprintDetailsNotifier, BlueprintDetailsState>(
  (_) => BlueprintDetailsNotifier(),
);
