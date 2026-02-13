import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDialog extends StatefulWidget {
  final DateTime? date;

  const EventDialog({this.date, super.key});

  @override
  State<EventDialog> createState() => _EventDialogState();
}

class _EventDialogState extends State<EventDialog> {
  late DateTime selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateUtils.dateOnly(DateTime.now()),
      firstDate: DateUtils.dateOnly(DateTime.now()),
      lastDate: DateUtils.dateOnly(DateTime(DateTime.now().year + 30)),
    );

    setState(() {
      if (date != null) {
        selectedDate = DateUtils.dateOnly(date);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    selectedDate = widget.date ?? DateTime.now();
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
            child: Text(DateFormat('dd-MM-yyyy').format(selectedDate)),
          ),
        ],
      ),
    );
  }
}
