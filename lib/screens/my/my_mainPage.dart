import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodplace/components/loginStatus.dart';

import 'package:foodplace/screens/my/myPage.dart';
import 'package:foodplace/screens/login/signInPage.dart';


class My_MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginStatus = Provider.of<Login>(context);

    return MaterialApp(
      title: 'Food Place',
      home: Scaffold(
        body: loginStatus.isLogined ? MyPage() : SignInPage()
      ),
    );
  }
}