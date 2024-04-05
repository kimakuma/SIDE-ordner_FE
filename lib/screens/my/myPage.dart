/* 마이 페이지 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// 로그인 상태 관리
import 'package:foodplace/components/loginStatus.dart';


// 테스트용 페이지
import 'package:foodplace/screens/login/signInPage.dart';

// 메뉴 리스트 매핑
class menuList {
  final Map<String, Map<String, Route>> menu = {
    "내역": {
      "예약 내역": MaterialPageRoute(builder: (context) => SignInPage(),),
      "찜 내역": MaterialPageRoute(builder: (context) => SignInPage(),),
      "결제 내역": MaterialPageRoute(builder: (context) => SignInPage(),),
    },
    "고객센터": {
      "자주 묻는 질문": MaterialPageRoute(builder: (context) => SignInPage(),),
      "1:1 카카오 문의": MaterialPageRoute(builder: (context) => SignInPage(),),
      "고객행복센터 연결": MaterialPageRoute(builder: (context) => SignInPage(),),
    },
    "커뮤니티": {
      "커뮤니티 작성글/댓글": MaterialPageRoute(builder: (context) => SignInPage(),),
    },
    "설정": {
      "알림": MaterialPageRoute(builder: (context) => SignInPage(),),
    },
    "가이드": {
      "공지사항": MaterialPageRoute(builder: (context) => SignInPage(),),
      "오드너 안내": MaterialPageRoute(builder: (context) => SignInPage(),),
      "앱버전": MaterialPageRoute(builder: (context) => SignInPage(),),
    }
  };
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 로그인 상태 load
    final loginStatus = Provider.of<Login>(context);

    return Container(
      child: Column(
        children: [
          Text("마이"),
          
          // 메뉴 리스트
          ListView(
            shrinkWrap: true,
            children: [
              ...menuList().menu.entries.map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 카테고리 명
                    Text(e.key),
                    ...?menuList().menu[e.key]?.entries.map((childE) => GestureDetector(
                      // 세부 카테고리 명
                      child: Text("  " + childE.key),
                      // 페이지 이동
                      onTap: () {
                        Navigator.push(
                          context,
                          childE.value,
                        );
                      },
                    ))
                  ],
                )
              )),
            ]
          ),

          // 로그아웃 버튼
          ElevatedButton(
            onPressed: () { loginStatus.logOut(); },
            child: Text("로그아웃"))
        ],
      )
    );
  }
}