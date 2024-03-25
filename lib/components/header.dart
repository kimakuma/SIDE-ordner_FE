import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodplace/screens/login/signInPage.dart';
import 'package:foodplace/screens/mypage/myPage.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  final bool isLogin;
  final double header_height = 60;
  const Header(this.isLogin, {super.key});

  @override
  State<Header> createState() => _HeaderState();

  @override
  Size get preferredSize => Size.fromHeight(this.header_height);
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
        Text(
          style: TextStyle(
            fontSize: 23,
            color: Colors.red,
          ),
          "Food Place",
        ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.festival),
          tooltip: "Profile",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => widget.isLogin ? MyPage() : SignInPage(),
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.info),
          tooltip: "Profile",
          onPressed: () {
            print("Clicked Profile");
          },
        ),
      ],
    );
  }
}