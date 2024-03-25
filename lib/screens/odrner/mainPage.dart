import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainState();
}

class _MainState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Place',
      home: Scaffold(
        body: SizedBox(child: Text("Festival MainPage"))
      ),
    );
  }
}