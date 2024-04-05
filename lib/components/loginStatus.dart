/* 로그인 상태 관리 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login with ChangeNotifier {
  // 로그인 상태 변수 선언
  bool _isLogined = false;
  // getter 선언
  bool get isLogined => _isLogined;

  // 로그인 함수
  void logIn() {
    _isLogined = true;

    notifyListeners();
  }

  // 로그아웃 함수
  void logOut() {
    _isLogined = false;

    notifyListeners();
  }
}