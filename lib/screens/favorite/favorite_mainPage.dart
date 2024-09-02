import 'package:flutter/material.dart';
import 'package:foodplace/screens/widget/policy.dart';

class Favorite_MainPage extends StatefulWidget {
  @override
  State<Favorite_MainPage> createState() => _Favorite_MainPageState();
}

class _Favorite_MainPageState extends State<Favorite_MainPage> {
  final bottomModal = Policy(type: "aasdad");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('일정 확인')),
      body: Center(
        child: ElevatedButton(
          child: Text('일정 ㄴㄴ확인'),
          onPressed: () => bottomModal.bottomModal(context),
        ),
      ),
    );
  }
}
