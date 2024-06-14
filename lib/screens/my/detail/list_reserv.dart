/* 시작 페이지 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 로그인 상태 관리 페이지
import 'package:foodplace/components/loginStatus.dart';

// Header & Footer 페이지
import 'package:foodplace/components/header.dart';
import 'package:foodplace/components/footer.dart';

// NavBar 페이지("홈", "검색", "커뮤니티", "찜", "마이")
import 'package:foodplace/screens/odrner/odrner_mainPage.dart';
import 'package:foodplace/screens/search/search_mainPage.dart';
import 'package:foodplace/screens/community/community_mainPage.dart';
import 'package:foodplace/screens/favorite/favorite_mainPage.dart';
import 'package:foodplace/screens/my/my_mainPage.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // NavBar에 들어갈 페이지 목록 ("홈", "검색", "커뮤니티", "찜", "마이")
  final List<Widget> _navPage = [
    Odrner_MainPage(),
    Search_MainPage(),
    Community_MainPage(),
    Favorite_MainPage(),
    My_MainPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Place',
      home: Scaffold(
        // Header
        appBar: Header(context.watch<Login>().isLogined),

        // Body
        body: IndexedStack(
          // NavBar 선택된 index 값
          index: context.watch<SelectedPage>().selectedPageIndex,
          // NavBar 선택된 index 값에 따른 페이지
          children: _navPage,
        ),

        // Footer
        bottomNavigationBar: Footer()
      ),
    );
  }
}