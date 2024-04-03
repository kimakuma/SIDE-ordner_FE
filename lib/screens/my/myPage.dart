import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodplace/components/loginStatus.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginStatus = Provider.of<Login>(context);

    return MaterialApp(
      title: 'Food Place',
      home: Scaffold(
        body: 
        Column(
          children: [
            Text("마이"),
            ElevatedButton(
              onPressed: () { loginStatus.logOut(); },
              child: Text("로그아웃"))
          ],
        )
      ),
    );
  }
}