import 'dart:collection';

import 'package:chronomancer/core/domain/event.dart';

class InMemoryEventRepository {
  final LinkedHashMap<DateTime, List<Event>> _events = LinkedHashMap();

  List<Event> getEventsByDate(DateTime date) {
    final key = DateTime(date.year, date.month, date.day);
    return _events[key] ?? [];
  }

  void addEvent(Event event) {
    var key = _createEventKey(event.startTime);
    _events.putIfAbsent(key, () => []).add(event);
  }

  void deleteEvent(Event event) {
    var key = _createEventKey(event.startTime);
    _events[key]?.removeWhere((item) => item.id == event.id);
  }

  DateTime _createEventKey(DateTime? startTime) {
    if (startTime != null) {
      return DateTime(startTime.year, startTime.month, startTime.day);
    }

    return DateTime.utc(275760, 09, 13);
  }
}
