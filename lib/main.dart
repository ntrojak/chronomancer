import 'package:flutter/material.dart';
import 'package:chronomancer/features/calendar/calendar.dart';

void main() {
  runApp(const Chronomancer());
}

class Chronomancer extends StatelessWidget {
  const Chronomancer({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chronomancer',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      home: const Calendar(),
    );
  }
}
