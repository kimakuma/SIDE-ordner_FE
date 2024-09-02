/* 마이 페이지 */
import 'package:flutter/material.dart';

// 상세 페이지
import 'package:foodplace/screens/my/detail/reserveListPage.dart';
import 'package:foodplace/screens/my/detail/likeListPage.dart';
import 'package:foodplace/screens/my/detail/payListPage.dart';
import 'package:foodplace/screens/my/detail/qnaPage.dart';
import 'package:foodplace/screens/my/detail/kakaoPage.dart';
import 'package:foodplace/screens/my/detail/happyPage.dart';
import 'package:foodplace/screens/my/detail/myPostListPage.dart';
import 'package:foodplace/screens/my/detail/alarmPage.dart';
import 'package:foodplace/screens/my/detail/announcePage.dart';
import 'package:foodplace/screens/my/detail/ordnerInfoPage.dart';
import 'package:foodplace/screens/my/detail/appVersionPage.dart';

class My_DetailPage extends StatefulWidget implements PreferredSizeWidget {
  final String menuName;
  final String menuMapping;
  final double header_height = 60;
  const My_DetailPage(this.menuName, this.menuMapping, {super.key});

  @override
  State<My_DetailPage> createState() => _My_DetailPageState();

  @override
  Size get preferredSize => Size.fromHeight(this.header_height);
}

class _My_DetailPageState extends State<My_DetailPage> {
  final Map<String, Widget> menu = {
    "likeList": LikeListPage(),
    "reserveList": ReserveListPage(),
    "payList": PayListPage(),
    "qna": QnaPage(),
    "kakao": KakaoPage(),
    "happy": HappyPage(),
    "myPostList": MyPostListPage(),
    "alarm": AlarmPage(),
    "announce": AnnouncePage(),
    "ordnerInfo": OrdnerInfoPage(),
    "appVersion": AppVersionPage()
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Header
        appBar: AppBar(title: Text(widget.menuName)),
        // Body
        body: menu[widget.menuMapping]);
  }
}
