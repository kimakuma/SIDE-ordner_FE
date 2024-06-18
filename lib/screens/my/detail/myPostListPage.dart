/* 마이 페이지 - 개인 정보 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 로그인 상태 관리 파일
import 'package:foodplace/components/loginStatus.dart';

class MyPostListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 로그인 상태 load
    final userInfo = Provider.of<Login>(context);

    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
        child: Column(
          children: [
            // 사용자 정보
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 개인 정보
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  // 프로필 사진
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userInfo.name + " 고객님",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "\t " + userInfo.email,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )
                ]),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
