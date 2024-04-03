import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login with ChangeNotifier {
  bool _isLogined = false;
  bool get isLogined => _isLogined;

  void logIn() {
    _isLogined = true;

    notifyListeners();
  }

  void logOut() {
    _isLogined = false;

    notifyListeners();
  }
}