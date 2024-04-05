/* NavBar("마이")를 통한 진입 페이지 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 로그인 상태 관리 파일
import 'package:foodplace/components/loginStatus.dart';

// 마이 페이지, 로그인 페이지
import 'package:foodplace/screens/my/myPage.dart';
import 'package:foodplace/screens/login/signInPage.dart';


class My_MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 로그인 상태 load
    final loginStatus = Provider.of<Login>(context);

    return MaterialApp(
      title: 'Food Place',
      home: Scaffold(
        // 로그인 상태에 따라 로그인 / 마이 페이지 이동
        body: loginStatus.isLogined ? MyPage() : SignInPage()
      ),
    );
  }
}