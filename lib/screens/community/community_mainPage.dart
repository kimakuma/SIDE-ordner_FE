/* NavBar("커뮤니티")를 통한 진입 페이지 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Community_MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Place',
      home: Scaffold(
        body: SizedBox(child: Text("커뮤니티"))
      ),
    );
  }
}