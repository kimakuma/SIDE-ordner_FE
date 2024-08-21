import 'package:flutter/material.dart';
import 'package:foodplace/screens/widget/calendar.dart';

class Favorite_MainPage extends StatefulWidget {
  @override
  State<Favorite_MainPage> createState() => _Favorite_MainPageState();
}

class _Favorite_MainPageState extends State<Favorite_MainPage> {
  List<DateTime> reservedDays = [DateTime(2024, 8, 1)];
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('일정 확인')),
      body: Center(
        child: ElevatedButton(
          child: Text('일정 ㄴㄴ확인'),
          onPressed: () => _showCalendarDialog(context),
        ),
      ),
    );
  }

  void _showCalendarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('일정 확인'),
          content: Container(
            width: double.maxFinite,
            child: Text("ASdasdasd"),
            // child: Calendar(
            //   reservedDays: reservedDays,
            //   onRangeSelected: (start, end) {
            //     setState(() {
            //       _rangeStart = start;
            //       _rangeEnd = end;
            //     });
            //   },
            // ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('닫기'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
