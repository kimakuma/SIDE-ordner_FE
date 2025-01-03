import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  final List reservedDays;
  final Function(DateTime?, DateTime?) onRangeSelected;
  final DateTime? selectedStart;
  final DateTime? selectedEnd;

  Calendar(
      {required this.reservedDays,
      required this.onRangeSelected,
      required this.selectedStart,
      required this.selectedEnd});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.now(),
      lastDay: DateTime.now().add(Duration(days: 365)),
      locale: 'ko_KR',
      rowHeight: 35,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextFormatter: (date, locale) =>
            DateFormat.yMMMM(locale).format(date),
      ),
      calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                  color: Color.fromARGB(255, 45, 122, 255), width: 2)),
          todayTextStyle: TextStyle(color: Colors.black),
          holidayTextStyle: TextStyle(decoration: TextDecoration.lineThrough),
          holidayDecoration: BoxDecoration()),
      holidayPredicate: (day) {
        return widget.reservedDays
            .contains(DateTime(day.year, day.month, day.day));
      },
      rangeStartDay: isSelected == false ? widget.selectedStart : _rangeStart,
      rangeEndDay: isSelected == false ? widget.selectedEnd : _rangeEnd,
      calendarFormat: _calendarFormat,
      rangeSelectionMode: _rangeSelectionMode,
      onRangeSelected: (start, end, focusedDay) {
        setState(() {
          _selectedDay = null;
          _focusedDay = focusedDay;
          _rangeStart = start;
          _rangeEnd = end;
          _rangeSelectionMode = RangeSelectionMode.toggledOn;

          isSelected = true;
        });
        widget.onRangeSelected(start, end);
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
