//TODO turn into freezed class
class TimeEventInfo {
  final Duration timersTime;

  TimeEventInfo({required this.timersTime});

  @override
  String toString() => 'TimeEventInfo(elapsedTime: $timersTime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TimeEventInfo && other.timersTime == timersTime;
  }

  @override
  int get hashCode => timersTime.hashCode;
}
