/* 마이 페이지 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 로그인 상태 관리
import 'package:foodplace/components/loginStatus.dart';

// Widget
import 'package:foodplace/screens/my/widget/myInfo.dart';
import 'package:foodplace/screens/my/widget/menu.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 로그인 상태 load
    final loginStatus = Provider.of<Login>(context);

    return Column(
      children: [
        // 메뉴 리스트
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              // 개인 정보
              MyInfo(),
              Divider(
                thickness: 3,
                height: 0
              ),
              
              // 메뉴
              Menu(),
              // 로그아웃
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: GestureDetector(
                  child: Text(
                    "로그아웃",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      height: 2
                    )
                  ),
                  onTap: () { loginStatus.logOut(); }
                ),
              )
            ]
          ),
        ),
      ],
    );
  }
}