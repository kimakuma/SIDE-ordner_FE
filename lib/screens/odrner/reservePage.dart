import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';

import 'package:foodplace/services/API.dart';

// 로그인 상태 관리 파일
import 'package:foodplace/components/loginStatus.dart';

// 홈화면
import 'package:foodplace/main.dart';
import 'package:foodplace/screens/widget/policy.dart';

class ReservePage extends StatefulWidget {
  final int truckId;
  final String truckName;
  final String? _selectedPeople;
  final DateTime? _rangeStart;
  final DateTime? _rangeEnd;

  const ReservePage(this.truckId, this.truckName, this._selectedPeople,
      this._rangeStart, this._rangeEnd,
      {super.key});

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  late String selectedStart;
  late String selectedEnd;
  final TextEditingController msgController = TextEditingController();

  var userId;
  var truckId;
  var truckName;
  var startDate;
  var endDate;
  var people;
  var msg;

  @override
  void initState() {
    super.initState();

    if ((widget._rangeStart) != null && (widget._rangeEnd) != null) {
      selectedStart =
          "${widget._rangeStart?.year}-${widget._rangeStart?.month}-${widget._rangeStart?.day}";
      selectedEnd =
          "${widget._rangeEnd?.year}-${widget._rangeEnd?.month}-${widget._rangeEnd?.day}";
    } else {
      selectedStart =
          "${widget._rangeStart?.year}-${widget._rangeStart?.month}-${widget._rangeStart?.day}";
      selectedEnd =
          "${widget._rangeStart?.year}-${widget._rangeStart?.month}-${widget._rangeStart?.day}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<Login>(context, listen: false);

    return Scaffold(
        appBar: AppBar(title: Text("예약")),
        body: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(shrinkWrap: true, children: [
                    Text(
                      widget.truckName,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "예약 정보",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('예약 인원: ${widget._selectedPeople} 명'),
                    Text('예약 일자: ${selectedStart} ~ ${selectedEnd}'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "사장님께 보내는 요청 메세지",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: msgController,
                      decoration: InputDecoration(
                        hintText: '요청사항을 적어주세요. (최대 100자)',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      style: TextStyle(fontSize: 12),
                      minLines: 1,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(100),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "기본 규칙",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "훌륭한 오더가 되기 위한 몇 가지 간단한 규칙을 지켜주실것을 모든 오더에게 당부드립니다.",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 25,
                            height: 25,
                            child: Text("⦁", style: TextStyle(fontSize: 25))),
                        Flexible(child: Text("~~~\n~~~"))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 25,
                            height: 25,
                            child: Text("⦁", style: TextStyle(fontSize: 25))),
                        Flexible(child: Text("~~~\n~~~"))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.pending_actions),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: Text(
                                "오너가 24시간 이내 예약 요청을 수락하기 전까지는 예약이 확정된 것이 아닙니다."))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "아래 버튼을 선택하면 "),
                          TextSpan(
                              text: "오더가 설정한 이용규칙,",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Policy(type: "이용규칙").bottomModal(context);
                                }),
                          TextSpan(text: " "),
                          TextSpan(
                              text: "오너에게 적용되는 기본 규칙,",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Policy(type: "기본 규칙").bottomModal(context);
                                }),
                          TextSpan(text: " "),
                          TextSpan(
                              text: "오드너 재예약 및 환불 정책",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Policy(type: "재예약 및 환불 정책")
                                      .bottomModal(context);
                                }),
                          TextSpan(text: "에 동의하며, 피해에 대한 책임이 본인에게 있을 경우 오드너가 "),
                          TextSpan(
                              text: "결제 수단으로 청구의 조치",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Policy(type: "청구의 조치").bottomModal(context);
                                }),
                          TextSpan(
                              text:
                                  "를 취할 수 있다는 사실에 동의하는 것입니다. 오너가 예약 요청을 수락하고 결제하면 예약 확정이 되는 것에 대해 동의합니다. 또한 "),
                          TextSpan(
                              text: "개정된 이용 약관",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Policy(type: "이용 약관").bottomModal(context);
                                }),
                          TextSpan(text: "과 "),
                          TextSpan(
                              text: "결제 서비스 약관",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Policy(type: "결제 서비스 약관")
                                      .bottomModal(context);
                                }),
                          TextSpan(text: " 및 "),
                          TextSpan(
                              text: "개인정보 처리방침",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Policy(type: "개인정보 처리방침")
                                      .bottomModal(context);
                                }),
                          TextSpan(text: "에도 동의합니다."),
                        ],
                      ),
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                ),
                GestureDetector(
                    onTap: () async {
                      Map<String, dynamic> response =
                          await APIPost(path: '/reserve/reserve', params: {
                        "userId": userInfo.id,
                        "truckId": widget.truckId,
                        "truckName": widget.truckName,
                        "startDate": selectedStart,
                        "endDate": selectedEnd,
                        "people": widget._selectedPeople,
                        "msg": msgController.text
                      });

                      if (response["status"] == 400) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('알림'),
                                content: Text("이미 예약된 날짜입니다."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('확인'),
                                  ),
                                ],
                              );
                            });
                      } else if (response["status"] == 500) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('알림'),
                                content: Text("잠시후에 다시 진행해주세요."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('확인'),
                                  ),
                                ],
                              );
                            });
                      } else if (response["status"] == 200) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('알림'),
                                content: Text("예약이 완료되었습니다."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                    child: Text('확인'),
                                  ),
                                ],
                              );
                            });
                      }
                    },
                    child: Column(children: [
                      Container(
                          width: (MediaQuery.of(context).size.width - 30),
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 45, 122, 255),
                          ),
                          child: Text(
                            "예약",
                            style: TextStyle(
                                fontSize: 25, color: Colors.white, height: 1.7),
                            textAlign: TextAlign.center,
                          )),
                      Padding(padding: EdgeInsets.all(7))
                    ]))
              ],
            )));
  }
}
