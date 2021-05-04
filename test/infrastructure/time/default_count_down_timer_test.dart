import 'package:flutter_test/flutter_test.dart';
import 'package:quiver/testing/async.dart';
import 'package:quiver/testing/time.dart';
import 'package:quiver/time.dart';
import 'package:time_architect/infrastructure/time/count_down_timer.dart';
import 'package:time_architect/infrastructure/time/count_down_timer_state.dart';
import 'package:time_architect/infrastructure/time/default_count_down_timer.dart';
import 'package:time_architect/infrastructure/time/time_event_info.dart';

main() {
  late CountDownTimer timer;

  CountDownTimer init1HourCountDownTimer(FakeAsync fakeAsync) {
    final fakeStopWatch = FakeStopwatch(
        () => fakeAsync
            .getClock(DateTime.fromMillisecondsSinceEpoch(0))
            .now()
            .millisecondsSinceEpoch,
        1000);
    return DefaultCountDownTimer(
      countdownDuration: anHour,
      stopwatch: fakeStopWatch,
    );
  }

  group('CountDownTimer', () {
    test(
      'should return a state of type "initial" when instantiated',
      () async {
        //arrange
        FakeAsync().run((FakeAsync fakeAsync) async {
          //act
          timer = init1HourCountDownTimer(fakeAsync);
        });
        //assert
        expect(timer.state, CountDownTimerState.initial);
      },
    );
    test(
      'should return a state of type "counting" when start has been called',
      () async {
        //arrange
        FakeAsync().run((FakeAsync fakeAsync) async {
          init1HourCountDownTimer(fakeAsync);
          //act
          timer.start();
        });
        //assert
        expect(timer.state, CountDownTimerState.counting);
      },
    );
    test(
      'should return a state of type "counting" '
      'when start has been called and some but not all '
      'of countdownDuration\'s time has elapsed',
      () async {
        //arrange
        FakeAsync().run((FakeAsync fakeAsync) async {
          init1HourCountDownTimer(fakeAsync);
          //act
          timer.start();
          fakeAsync.elapse(aMinute);
        });
        //assert
        expect(timer.state, CountDownTimerState.counting);
      },
    );
    test(
      'should return a state of type "finished" '
      'when start has been called (and countdownDuration has elapsed)',
      () async {
        //arrange
        FakeAsync().run((FakeAsync fakeAsync) async {
          timer = init1HourCountDownTimer(fakeAsync);
          //act
          timer.start();
          fakeAsync.elapse(anHour);
        });
        //assert
        expect(timer.state, CountDownTimerState.finished);
      },
    );
    test(
      'should not have emitted anything before start has been called '
      'and a millisecond has elapsed',
      () async {
        //arrange
        TimeEventInfo? result;
        FakeAsync().run((fakeAsync) {
          //act
          timer = init1HourCountDownTimer(fakeAsync);
          timer.timeEventInfoStream.listen((event) {
            result = event;
          });
        });
        //assert
        expect(result, null);
      },
    );
    test(
      'should emit a TimeEventInfo object holding the elapsed time '
      'every millisecond after start has been called',
      () {
        //arrange
        final expected = <TimeEventInfo>[
          TimeEventInfo(timersTime: anHour - aMillisecond),
          TimeEventInfo(timersTime: anHour - (aMillisecond * 2)),
          TimeEventInfo(timersTime: anHour - (aMillisecond * 3)),
        ];
        final result = <TimeEventInfo>[];
        int tryTimes = 3;
        FakeAsync().run((fakeAsync) async {
          timer = init1HourCountDownTimer(fakeAsync);
          timer.timeEventInfoStream.listen(expectAsync1((event) {
            //assert
            expect(event, isA<TimeEventInfo>());
            result.add(event);
          }, count: tryTimes));
          //act
          timer.start();
          fakeAsync.elapse(aMillisecond * tryTimes);
        });
        expect(result, expected);
      },
    );
    test(
      'should not emit a TimeEventInfo object before a millisecond',
      () {
        //arrange
        TimeEventInfo? result;
        FakeAsync().run((fakeAsync) async {
          timer = init1HourCountDownTimer(fakeAsync);
          timer.timeEventInfoStream.listen(
            (event) {
              //assert
              result = event;
            },
          );
          //act
          timer.start();
          fakeAsync.elapse(aMillisecond * 0.5);
        });
        expect(result, null);
      },
    );
    test(
      'should emit a TimeEventInfo object '
      'holding the value of 0ms as its final emition',
      () {
        //arrange
        final expected = TimeEventInfo(timersTime: Duration.zero);
        TimeEventInfo? result;
        FakeAsync().run((fakeAsync) async {
          timer = init1HourCountDownTimer(fakeAsync);
          timer.timeEventInfoStream.listen(
            (event) {
              //assert
              result = event;
            },
          );
          //act
          timer.start();
          fakeAsync.elapse(anHour + aMinute);
        });
        expect(result, expected);
      },
    );
    test(
      'should return the original value of "countdownDuration"',
      () async {
        //arrange
        final countdownDuration = aMinute;
        timer = DefaultCountDownTimer(countdownDuration: countdownDuration);

        //act
        final result = timer.countdownDuration;
        //assert
        expect(result, countdownDuration);
      },
    );
  });
}
