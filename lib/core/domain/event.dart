import 'frequency.dart';

class Event {
  final int id;
  final DateTime createdAt;

  String title;
  String? description;
  DateTime? startTime;
  DateTime? finishTime;
  Frequency? frequency;
  bool completed = false;

  DateTime? get endTime => finishTime ?? startTime;

  Event({required this.title, this.startTime, this.finishTime})
    : id = DateTime.now().toUtc().millisecondsSinceEpoch,
      createdAt = DateTime.now().toUtc();

  @override
  String toString() {
    return title;
  }

  bool isTodo() => startTime == null;
  bool isRecurring() => frequency != null;
}
