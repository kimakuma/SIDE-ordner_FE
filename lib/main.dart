import 'package:flutter/material.dart';
import 'package:foodplace/config/mysqlConnector.dart';
import 'package:foodplace/header.dart';
import 'package:foodplace/footer.dart';
import 'package:foodplace/festival/mainPage.dart';

void main() {
  dbConnector();

  runApp(const MyApp(false));
}

class MyApp extends StatefulWidget {
  final bool isLogin;
  const MyApp(this.isLogin, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Place',
      home: Scaffold(
        appBar: Header(widget.isLogin),
        body: MainPage(),
        bottomNavigationBar:  Footer()
      ),
    );
  }
}