/* Footer */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedPage with ChangeNotifier {
  // NavBar 선택 인덱스 변수 선언
  int _currentIndex = 0;
  // getter 선언
  int get selectedPageIndex => _currentIndex;

  // NavBar 클릭 시 인덱스 변경 함수
  void _onTap(int index) {
    _currentIndex = index;

    notifyListeners();
  }
}

class Footer extends StatefulWidget {
  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  // NavBar Icon 모음
  final List<BottomNavigationBarItem> footerItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: '홈'),
    BottomNavigationBarItem(icon: Icon(Icons.search_outlined), activeIcon: Icon(Icons.search), label: '검색'),
    BottomNavigationBarItem(icon: Icon(Icons.newspaper_outlined), activeIcon: Icon(Icons.newspaper), label: '커뮤니티'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), activeIcon: Icon(Icons.favorite), label: '찜'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: '마이'),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.orangeAccent,
      unselectedItemColor: Colors.blueGrey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: footerItems,
      
      currentIndex: context.read<SelectedPage>()._currentIndex,
      onTap: context.read<SelectedPage>()._onTap,
    );
  }
}