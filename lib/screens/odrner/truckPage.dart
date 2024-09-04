/* 마이 페이지 - 개인 정보 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodplace/services/API.dart';
import 'package:foodplace/components/loading.dart';
import 'package:foodplace/screens/widget/calendar.dart';

import 'package:foodplace/screens/login/signInPage.dart';
import 'package:foodplace/screens/odrner/estimatePage.dart';
import 'package:foodplace/screens/odrner/reservePage.dart';

// 로그인 상태 관리 파일
import 'package:foodplace/components/loginStatus.dart';

class TruckPage extends StatefulWidget {
  final int truckId;
  const TruckPage(this.truckId, {super.key});

  @override
  State<TruckPage> createState() => _TruckPageState();
}

class _TruckPageState extends State<TruckPage> {
  Map<String, dynamic> truckInfo = {};
  List<dynamic> truckMenu = [];
  List truckSchedule = [];
  List reservedDays = [];

  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime? selectedStart;
  DateTime? selectedEnd;

  List<String> selectPeople = [
    "0 ~ 10",
    "10 ~ 50",
    "50 ~ 100",
    "100 ~ 1000",
    "1000 +"
  ];
  String selectedPeople = "";

  Future<void> init() async {
    final response =
        await APIGet(path: '/reserve/truckInfo?truckId=${widget.truckId}');

    if (response['status'] == 200 && !response['results'].isEmpty) {
      setState(() {
        truckInfo = response['results']['truckInfo'];
        truckMenu = response['results']['truckMenuList'];
        truckSchedule = response['results']['truckSchedule'];

        truckSchedule.forEach((data) {
          reservedDays.add(DateTime.parse(data));
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  // people Widget
  Future<dynamic> peopleWidget() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            child: Container(
              width: 300,
              height: 340,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: 40,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: Text(
                            "인원 선택",
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                    Expanded(
                        child: ListView(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      children: List.generate(
                        selectPeople.length,
                        (index) => RadioListTile<String>(
                          value: selectPeople[index],
                          groupValue: selectedPeople,
                          title: Text(
                            "${selectPeople[index]} 명",
                            style: TextStyle(fontSize: 15),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          onChanged: (value) {
                            setState(() {
                              selectedPeople = value!;
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    )),
                    SizedBox(
                        height: 50,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedPeople = "";
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      width: 100,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade300,
                                      ),
                                      child: Text(
                                        "취소",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            height: 2),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      width: 100,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromARGB(255, 56, 163, 30),
                                      ),
                                      child: Text(
                                        "확인",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            height: 2),
                                        textAlign: TextAlign.center,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(height: 2)
                          ],
                        )),
                  ]),
            ));
      },
    );
  }

  // calendar Widget
  Future<dynamic> calendarWidget() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              child: SizedBox(
                height: 340,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Calendar(
                      reservedDays: reservedDays,
                      onRangeSelected: (start, end) {
                        setState(() {
                          _rangeStart = start;
                          _rangeEnd = end;
                        });
                      },
                      selectedStart: _rangeStart,
                      selectedEnd: _rangeEnd,
                    ),
                    SizedBox(
                        height: 50,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _rangeStart = null;
                                      _rangeEnd = null;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      width: 100,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade300,
                                      ),
                                      child: Text(
                                        "취소",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            height: 2),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      width: 100,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromARGB(255, 56, 163, 30),
                                      ),
                                      child: Text(
                                        "확인",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            height: 2),
                                        textAlign: TextAlign.center,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(height: 2)
                          ],
                        )),
                  ],
                ),
              ));
        });
  }

  // truckInfo Widget
  Widget truckInfoWidget() {
    if (truckInfo.isNotEmpty) {
      return Column(children: [
        Container(
            width: 300,
            height: 130,
            child: Image.asset(fit: BoxFit.fill, 'images${truckInfo['img']}')),
        Padding(padding: EdgeInsets.all(5)),
        Text(style: TextStyle(fontSize: 30), truckInfo['name']),
        Container(
          width: 180,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: IntrinsicHeight(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  peopleWidget();
                },
                child: IntrinsicHeight(
                  child: Text("인원 선택",
                      style: TextStyle(color: Colors.grey.shade700)),
                ),
              ),
              VerticalDivider(color: Colors.grey.shade300),
              GestureDetector(
                onTap: () {
                  calendarWidget();
                },
                child: IntrinsicHeight(
                  child: Text("날짜 선택",
                      style: TextStyle(color: Colors.grey.shade700)),
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          )),
        ),
      ]);
    } else {
      return Loading();
    }
  }

  // truckMenu Widget
  Widget truckMenuWidget() {
    if (truckMenu.isNotEmpty) {
      return Container(
          margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: ListView(shrinkWrap: true, children: [
            ...List.generate(
                truckMenu.length,
                (i) => Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(truckMenu[i]['name'],
                                      style: TextStyle(fontSize: 20)),
                                  truckMenu[i]['desc'] != null
                                      ? Text(truckMenu[i]['desc'],
                                          style: TextStyle(fontSize: 12))
                                      : Text("등록된 소개가 없습니다.",
                                          style: TextStyle(fontSize: 12)),
                                  SizedBox(height: 10),
                                  Text('${truckMenu[i]['price']} 원')
                                ]),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: truckMenu[i]['img'] != null
                                    ? Image.asset(
                                        width: 70,
                                        'images${truckMenu[i]['img']}')
                                    : Image.asset(
                                        width: 70, 'images/profile.webp')),
                          ]),
                      i < truckMenu.length - 1
                          ? Divider()
                          : Padding(padding: EdgeInsets.all(0))
                    ])),
          ]));
    } else {
      return Padding(padding: EdgeInsets.all(5));
    }
  }

  // estimate Btn
  Widget estimateBtn() {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EstimatePage(widget.truckId, truckInfo['name'])));
        },
        child: Column(children: [
          Container(
              width: (MediaQuery.of(context).size.width / 4 + 20),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 181, 218, 255),
              ),
              child: Text(
                "견적 문의",
                style:
                    TextStyle(fontSize: 25, color: Colors.white, height: 1.5),
                textAlign: TextAlign.center,
              )),
          Padding(padding: EdgeInsets.all(7))
        ]));
  }

  // reserve Btn
  Widget reserveBtn() {
    final loginStatus = Provider.of<Login>(context);

    return GestureDetector(
        onTap: () {
          if (loginStatus.isLogined == false) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('알림'),
                    content: Text('로그인이 필요합니다.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            ),
                          );
                        },
                        child: Text('로그인'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('확인'),
                      ),
                    ],
                  );
                });
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReservePage(
                        widget.truckId,
                        truckInfo['name'],
                        selectedPeople,
                        _rangeStart,
                        _rangeEnd)));
          }
        },
        child: Column(children: [
          Container(
              width: (MediaQuery.of(context).size.width / 4 * 3 - 70),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 45, 122, 255),
              ),
              child: Text(
                "예약",
                style:
                    TextStyle(fontSize: 25, color: Colors.white, height: 1.7),
                textAlign: TextAlign.center,
              )),
          Padding(padding: EdgeInsets.all(7))
        ]));
  }

  // reserve Btn Blocked
  Widget reserveBtnBlocked() {
    return Column(children: [
      Container(
          width: (MediaQuery.of(context).size.width / 4 * 3 - 70),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          child: Text(
            "예약",
            style: TextStyle(fontSize: 25, color: Colors.white, height: 1.7),
            textAlign: TextAlign.center,
          )),
      Padding(padding: EdgeInsets.all(7))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
            body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverList(
                        delegate: SliverChildListDelegate([
                      truckInfoWidget(),
                      Padding(padding: EdgeInsets.all(20)),
                      Text("추후 추가"),
                    ]))
                  ];
                },
                body: Column(children: [
                  const TabBar(
                      indicatorColor: Colors.blueGrey,
                      labelStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                      indicatorWeight: 3,
                      tabs: [
                        Tab(
                          text: '메뉴',
                          height: 40,
                        ),
                        Tab(
                          text: '정보',
                          height: 40,
                        ),
                        Tab(
                          text: 'Q&A',
                          height: 40,
                        )
                      ]),
                  Expanded(
                    child: TabBarView(
                      children: [
                        truckMenuWidget(),
                        Text("트럭 정보 칸입니다.\n 저장된 정보가 없네뇽 ㅜ"),
                        Text("추후 추가")
                      ],
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        estimateBtn(),
                        (selectedPeople != "" && _rangeStart != null)
                            ? reserveBtn()
                            : reserveBtnBlocked()
                      ]),
                ]))));
  }
}
