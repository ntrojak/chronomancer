class Frequency {
  Interval intervalType = Interval.daily;
  int intervalNumber = 1;
  List<int>? days;
  List<int>? weekDays;
}

enum Interval { daily, weekly, monthlyByDay, monthlyByDate, yearly }
