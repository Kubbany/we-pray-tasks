import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, required this.onDateChanged});
  final ValueChanged<DateTime> onDateChanged;
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime _selectedDate;
  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dMMMM, yyyy').format(_selectedDate);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
          onPressed: () => _changeDate(-1),
        ),
        InkWell(
          onTap: _pickDate,
          child: Text(
            formattedDate,
            style: AppStyles.mediumHanken16,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () => _changeDate(1),
        ),
      ],
    );
  }

  void _changeDate(int days) {
    setState(
      () {
        _selectedDate = _selectedDate.add(Duration(days: days));
      },
    );
    widget.onDateChanged(_selectedDate);
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
      widget.onDateChanged(_selectedDate);
    }
  }
}
