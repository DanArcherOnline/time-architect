import 'dart:async' as a;

import 'package:time_architect/infrastructure/time/count_down_timer.dart';
import 'package:time_architect/infrastructure/time/count_down_timer_state.dart';
import 'package:time_architect/infrastructure/time/time_event_info.dart';

class DefaultCountDownTimer implements CountDownTimer {
  static const Duration _increment = Duration(milliseconds: 1);
  final Duration _countdownDuration;
  final Stopwatch _stopwatch;
  late final a.Timer _timer;
  late final a.StreamController<TimeEventInfo> _streamController;

  CountDownTimerState _state;

  DefaultCountDownTimer({
    required Duration countdownDuration,
    Stopwatch? stopwatch,
  })  : _state = CountDownTimerState.initial,
        _streamController =
            a.StreamController<TimeEventInfo>.broadcast(sync: true),
        _countdownDuration = countdownDuration,
        _stopwatch = stopwatch ?? Stopwatch();

  @override
  void start() {
    if (_state != CountDownTimerState.initial) return;

    _state = CountDownTimerState.counting;
    _timer = a.Timer.periodic(_increment, _tick);
    _stopwatch.start();
  }

  void stop() {
    _stopwatch.stop();
    _timer.cancel();
    _streamController.close();
    _state = CountDownTimerState.finished;
  }

  void _tick(a.Timer timer) {
    var remaining = _countdownDuration - _stopwatch.elapsed;
    if (remaining.inMilliseconds <= 0) {
      _streamController.add(TimeEventInfo(timersTime: Duration.zero));
      stop();
      return;
    }
    _streamController.add(TimeEventInfo(timersTime: remaining));
  }

  @override
  CountDownTimerState get state => _state;

  @override
  Duration get countdownDuration => _countdownDuration;

  @override
  a.Stream<TimeEventInfo> get timeEventInfoStream => _streamController.stream;
}
