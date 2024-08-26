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

    return Scaffold(
        // 로그인 상태에 따라 로그인 / 마이 페이지 이동
        body: loginStatus.isLogined
            ? MyPage()
            : AlertDialog(
                title: Text('알림'),
                content: Text('로그인이 필요합니다.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      );
                    },
                    child: Text('로그인'),
                  )
                ],
              ));
  }
}
