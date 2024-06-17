/* 마이 페이지 - 개인 정보 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 로그인 상태 관리 파일
import 'package:foodplace/components/loginStatus.dart';

class MyInfo extends StatelessWidget {
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(width: 50, 'images/profile.webp'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // 사용자명, 사용자계정
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
                // 계정 설정 버튼
                FilledButton(
                  style: FilledButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    backgroundColor: Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Text(
                    "계정 설정",
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            // 포인트 / 쿠폰
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: IntrinsicHeight(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("포인트"),
                  VerticalDivider(color: Colors.grey.shade300),
                  Text("쿠폰")
                ],
              )),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.timer_outlined),
                      onPressed: () {},
                    ),
                    Text("최근 본 상품")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.discount_outlined),
                      onPressed: () {},
                    ),
                    Text("할인 혜택")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.reviews_outlined),
                      onPressed: () {},
                    ),
                    Text("내 리뷰")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications_none_outlined),
                      onPressed: () {},
                    ),
                    Text("할인 혜택")
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    ]);
  }
}
