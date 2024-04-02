import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Odrner_MainPage extends StatefulWidget {
  const Odrner_MainPage({Key? key}) : super(key: key);

  @override
  State<Odrner_MainPage> createState() => _MainState();
}

class _MainState extends State<Odrner_MainPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Place',
      home: Scaffold(
        body: SizedBox(child: Text("홈"))
      ),
    );
  }
}