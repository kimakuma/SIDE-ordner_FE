/* 마이 페이지 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodplace/components/loginStatus.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 로그인 상태 load
    final loginStatus = Provider.of<Login>(context);

    return MaterialApp(
      title: 'Food Place',
      home: Scaffold(
        body: 
        Column(
          children: [
            Text("마이"),
            // 로그아웃 버튼
            ElevatedButton(
              onPressed: () { loginStatus.logOut(); },
              child: Text("로그아웃"))
          ],
        )
      ),
    );
  }
}