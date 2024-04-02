import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodplace/main.dart';

class user with ChangeNotifier {
  int _currentIndex = 0;
  int get selectedPageIndex => _currentIndex;

  void _onTap(int index) {
    _currentIndex = index;

    notifyListeners();
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isOrder = false;

    return MaterialApp(
      title: 'Food Place',
      home: Scaffold(
        body: Column(
          children: [
            Switch(
              value: isOrder,
              onChanged: (value) {
                isOrder == false ? true : false;
              },
            ),
            Text("어쩌구"),
            Text("저쩌구"),
            ElevatedButton(
              onPressed: () async {
                var isLogin = false;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(isLogin,),
                  ),
                );
              },
              child: Text("로그아웃"))
          ],
        )
      ),
    );
  }
}