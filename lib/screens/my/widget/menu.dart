/* 마이 페이지 - 메뉴 리스트 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 로그인 상태 관리
import 'package:foodplace/components/loginStatus.dart';

// 상세 페이지
import 'package:foodplace/screens/my/my_detailPage.dart';

// 메뉴 리스트 매핑
class menuList {
  int menuLen = 16;

  final Map<String, Map<String, String>> menu = {
    "내역 목록": {"예약 내역": "reserveList", "찜 내역": "likeList", "결제 내역": "payList"},
    "고객센터": {
      "자주 묻는 질문": "qna",
      "1:1 카카오 문의": "kakao",
      "고객행복센터 연결": "happy",
    },
    "커뮤니티": {
      "커뮤니티 작성글/댓글": "myPostList",
    },
    "설정": {
      "알림": "alarm",
    },
    "가이드": {
      "공지사항": "announce",
      "오드너 안내": "ordnerInfo",
      "앱버전": "appVersion",
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 카테고리 명
                      Text(
                        e.key,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            height: 2),
                      ),

                      // 세부 카테고리 명
                      ...?menuList()
                          .menu[e.key]
                          ?.entries
                          .map((childE) => GestureDetector(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("\t\t\t${childE.key}"),
                                    Text(
                                      ">",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 10),
                                    )
                                  ],
                                ),
                                // 페이지 이동
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => My_DetailPage(
                                              childE.key, childE.value)));
                                },
                              )),

                      Divider(height: 20),
                    ],
                  ),
                )),
          ],
        ));
  }
}

class LogOutBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 로그인 상태 load
    final loginStatus = Provider.of<Login>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: GestureDetector(
          child: Text("로그아웃",
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, height: 2)),
          onTap: () {
            loginStatus.logOut();
          }),
    );
  }
}
