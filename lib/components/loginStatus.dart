/* 로그인 상태 관리 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login with ChangeNotifier {
  // 로그인 상태 변수 선언
  bool _isLogined = false;
  int _id = 0;
  String _name = "";
  String _email = "";
  String _phone = "";
  // getter 선언
  bool get isLogined => _isLogined;
  int get id => _id;
  String get name => _name;
  String get email => _email;
  String get phone => _phone;

  // 로그인 함수
  void logIn(params) {
    _isLogined = true;
    _id = params['id'];
    _name = params['name'];
    _email = params['email'];
    _phone = params['phone'];

    notifyListeners();
  }

  // 로그아웃 함수
  void logOut() {
    _isLogined = false;
    _id = 0;
    _name = "";
    _email = "";
    _phone = "";

    notifyListeners();
  }
}
