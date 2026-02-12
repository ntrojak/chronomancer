import 'package:flutter/material.dart';

class EventDialog extends StatefulWidget {
  const EventDialog({super.key});

  @override
  State<EventDialog> createState() => _EventDialogState();
}

class _EventDialogState extends State<EventDialog> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      // TODO: Inject day selected in calendar view
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 30),
    );

    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Column(
        children: [
          TextField(decoration: InputDecoration(hintText: 'Event name')),
          OutlinedButton(
            onPressed: () {
              _selectDate(context);
              // TODO: Finish the dialog
            },
            child: Text(DateTime.now().toString()),
          ),
        ],
      ),
    );
  }
}
