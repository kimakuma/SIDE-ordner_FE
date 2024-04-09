/* 마이 페이지 */
import 'package:flutter/material.dart';

// Widget
import 'package:foodplace/screens/my/widget/myInfo.dart';
import 'package:foodplace/screens/my/widget/menu.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              // 개인 정보
              MyInfo(),

              Divider(
                thickness: 2,
                height: 0
              ),
              
              // 메뉴
              Menu(),
              // 로그아웃
              LogOutBtn()
            ]
          ),
        ),
      ],
    );
  }
}