import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDialog extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;

  const EventDialog({this.startDate, this.endDate, super.key});

  @override
  State<EventDialog> createState() => _EventDialogState();
}

class _EventDialogState extends State<EventDialog> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  Future<void> _selectDate(
    BuildContext context,
    void Function(DateTime) onDateSelected,
  ) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateUtils.dateOnly(DateTime.now()),
      firstDate: DateUtils.dateOnly(DateTime.now()),
      lastDate: DateUtils.dateOnly(DateTime(DateTime.now().year + 30)),
    );

    setState(() {
      if (date != null) {
        onDateSelected(date);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startDate = widget.startDate ?? DateTime.now();
    endDate = widget.endDate ?? startDate;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Column(
        children: [
          TextField(decoration: InputDecoration(hintText: 'Event name')),
          OutlinedButton(
            onPressed: () {
              _selectDate(context, (date) {
                startDate = date;
              });
            },
            // TODO: Move DateTime formatting to separate, static class and add locale and timezone handling
            child: Text(DateFormat('dd-MM-yyyy').format(startDate)),
          ),
          OutlinedButton(
            onPressed: () {
              _selectDate(context, (date) {
                endDate = date;
              });
            },
            child: Text(DateFormat('dd-MM-yyyy').format(endDate)),
          ),
        ],
      ),
    );
  }
}
