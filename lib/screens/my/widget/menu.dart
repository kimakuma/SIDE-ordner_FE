/* 마이 페이지 - 메뉴 리스트 */
import 'package:flutter/material.dart';

// 테스트용 페이지
import 'package:foodplace/screens/login/signInPage.dart';

// 메뉴 리스트 매핑
class menuList {
  int menuLen = 16;

  final Map<String, Map<String, Route>> menu = {
    "내역 목록": {
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

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: [
          ...menuList().menu.entries.map((e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 카테고리 명
                Text(
                  e.key,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 2
                  ),
                ),

                // 세부 카테고리 명
                ...?menuList().menu[e.key]?.entries.map((childE) => GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\t\t\t${childE.key}"),
                      Text(
                        ">",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 10
                        ),
                      )
                    ],
                  ),
                  // 페이지 이동
                  onTap: () {
                    Navigator.push(
                      context,
                      childE.value,
                    );
                  },
                )),
                
                Divider(
                  height: 20
                ),
              ],
            ),
          )),
        ],
      )
    );
  }
}