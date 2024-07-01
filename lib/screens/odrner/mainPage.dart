/* 마이 페이지 */
import 'package:flutter/material.dart';

// Widget
import 'package:foodplace/screens/odrner/widget/recommend.dart';
import 'package:foodplace/screens/odrner/widget/recent.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(shrinkWrap: true, children: [
            // sort :: recommend
            Recommend(),
            Recent(),
          ]),
        ),
      ],
    );
  }
}
