import 'frequency.dart';

class Event {
  final int _id;
  String title;
  String? description;
  DateTime startTime;
  DateTime? finishTime;
  final DateTime createdAt;
  Frequency? frequency;

  Event({
    required this.startTime,
    required this.finishTime,
    required this.title,
  }) : _id = DateTime.now().toUtc().millisecondsSinceEpoch,
       createdAt = DateTime.now().toUtc();

  @override
  String toString() {
    return "${_id.toString()} $title";
  }
}
