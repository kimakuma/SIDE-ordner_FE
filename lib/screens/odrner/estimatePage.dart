import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';

import 'package:foodplace/services/API.dart';

// 로그인 상태 관리 파일
import 'package:foodplace/components/loginStatus.dart';

// 홈화면
import 'package:foodplace/main.dart';

class EstimatePage extends StatefulWidget {
  final int truckId;
  final String truckName;

  const EstimatePage(this.truckId, this.truckName, {super.key});

  @override
  State<EstimatePage> createState() => _EstimatePageState();
}

class _EstimatePageState extends State<EstimatePage> {
  Map<String, dynamic> truckInfo = {};

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController msgController = TextEditingController();

  var userId;
  var truckId;
  var truckName;
  var msg;

  Future<void> init() async {
    final response =
        await APIGet(path: '/reserve/truckInfo?truckId=${widget.truckId}');

    if (response['status'] == 200 && !response['results'].isEmpty) {
      setState(() {
        truckInfo = response['results']['truckInfo'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  // reserver
  Widget reserver(userInfo) {
    return Padding(
        padding: EdgeInsets.all(7),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "예약자",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
              height: 40,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: userInfo.name != "" ? userInfo.name : '이름을 입력해주세요.',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                ),
                style: TextStyle(fontSize: 12),
                minLines: 1,
                maxLines: 1,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            "이메일",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
              height: 40,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText:
                      userInfo.email != "" ? userInfo.email : '이메일을 입력해주세요.',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                ),
                style: TextStyle(fontSize: 12),
                minLines: 1,
                maxLines: 1,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            "연락처",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
              height: 40,
              child: TextField(
                controller: numberController,
                decoration: InputDecoration(
                  hintText: userInfo.phone != ""
                      ? userInfo.phone
                      : '연락처를 입력해주세요. ("-" 기호 제외)',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                ),
                style: TextStyle(fontSize: 12),
                minLines: 1,
                maxLines: 1,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            "문의 사항",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 5,
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
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.blue),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
          Row(children: [
            Icon(
              Icons.error_outline,
              size: 40.0,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Text("입력하신 정보로 알림톡과 이메일이 발송됩니다.\n정확한 정보를 입력해주세요.")
          ]),
        ]));
  }

  // orner Info
  Widget orner() {
    return Padding(
        padding: EdgeInsets.all(7),
        child: Table(columnWidths: {
          0: FractionColumnWidth(0.3),
          1: FractionColumnWidth(0.7)
        }, children: [
          TableRow(children: [
            TableCell(
                child: Text("상호명",
                    style: TextStyle(fontSize: 15, color: Colors.blue))),
            TableCell(child: Text(truckInfo['name']))
          ]),
          TableRow(children: [
            TableCell(
                child: Text("대표자명",
                    style: TextStyle(fontSize: 15, color: Colors.blue))),
            TableCell(child: Text(truckInfo['name']))
          ]),
          TableRow(children: [
            TableCell(
                child: Text("소재지",
                    style: TextStyle(fontSize: 15, color: Colors.blue))),
            TableCell(child: Text(truckInfo['name']))
          ]),
          TableRow(children: [
            TableCell(
                child: Text("사업자번호",
                    style: TextStyle(fontSize: 15, color: Colors.blue))),
            TableCell(child: Text(truckInfo['name']))
          ]),
          TableRow(children: [
            TableCell(
                child: Text("연락처",
                    style: TextStyle(fontSize: 15, color: Colors.blue))),
            TableCell(child: Text(truckInfo['name']))
          ]),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<Login>(context, listen: false);

    print(truckInfo);

    return Scaffold(
        appBar: AppBar(title: Text("견적 문의")),
        body: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(shrinkWrap: true, children: [
                    Text(
                      "예약자 정보",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Divider(
                      color: Colors.blue,
                      height: 1,
                      thickness: 2,
                    ),
                    reserver(userInfo),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "오너 정보",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Divider(
                      color: Colors.blue,
                      height: 1,
                      thickness: 2,
                    ),
                    orner(),
                  ]),
                ),
                GestureDetector(
                    onTap: () async {
                      print("click!");
                      return;
                      Map<String, dynamic> response =
                          await APIPost(path: '/reserve/estimate', params: {
                        "userId": userInfo.id,
                        "truckId": widget.truckId,
                        "truckName": widget.truckName,
                        "msg": msgController.text
                      });

                      if (response["status"] == 500) {
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
                            "견적 문의",
                            style: TextStyle(
                                fontSize: 25, color: Colors.white, height: 1.5),
                            textAlign: TextAlign.center,
                          )),
                      Padding(padding: EdgeInsets.all(7))
                    ]))
              ],
            )));
  }
}
