import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search_MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Place',
      home: Scaffold(
        body: SizedBox(child: Text("검색"))
      ),
    );
  }
}