library timearchitect;

import 'dart:async';

import 'package:time_architect/infrastructure/time/count_down_timer_state.dart';
import 'package:time_architect/infrastructure/time/time_event_info.dart';

abstract class CountDownTimer {
  Stream<TimeEventInfo> get timeEventInfoStream;
  Duration get countdownDuration;
  CountDownTimerState get state;
  void start();
}
