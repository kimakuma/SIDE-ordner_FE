import 'package:flutter/material.dart';
import 'package:foodplace/services/mysqlConnector.dart';
import 'package:foodplace/components/header.dart';
import 'package:foodplace/components/footer.dart';
import 'package:foodplace/screens/odrner/mainPage.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Food Place',
      home: Scaffold(
        appBar: Header(widget.isLogin),
        body: MainPage(),
        bottomNavigationBar: Footer()
      ),
    );
  }
}