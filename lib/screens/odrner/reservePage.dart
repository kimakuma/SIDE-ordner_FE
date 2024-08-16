import 'package:flutter/material.dart';

import 'package:foodplace/screens/widget/calendar.dart';

class ReservePage extends StatefulWidget {
  final DateTime? _rangeStart;
  final DateTime? _rangeEnd;

  const ReservePage(this._rangeStart, this._rangeEnd, {super.key});

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  Future<void> init() async {
    print(widget._rangeStart);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(shrinkWrap: true, children: [
            Text("트럭 이름 이나 사진"),
            Text("트럭 정보 (뭐 상호며ㅛㅇ, 대표자며으 소재지, 사업자번호,,,)"),
            Text("예약 정보"),
            Text("예약자 정보 (이름, 이메일, 전화번호)"),
            Text("요청 사항"),
            Text("기본 규칙 어쩌구1"),
            Text("기본 규칙 어쩌구2"),
            Text("기본 규칙 어쩌구3"),
            Text("완료")
          ]),
        ),
      ],
    );
  }
}
