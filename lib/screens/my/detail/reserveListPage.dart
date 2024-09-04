/* 마이 페이지 - 개인 정보 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodplace/services/API.dart';

// 로그인 상태 관리 파일
import 'package:foodplace/components/loginStatus.dart';

class ReserveListPage extends StatefulWidget {
  @override
  State<ReserveListPage> createState() => _ReserveListPageState();
}

class _ReserveListPageState extends State<ReserveListPage> {
  bool APIBeforeResult = false;
  List<dynamic> beforeResult = [];
  bool APIIngResult = false;
  List<dynamic> ingResult = [];
  bool APIAfterResult = false;
  List<dynamic> afterResult = [];

  Future<void> init() async {
    final userInfo = Provider.of<Login>(context, listen: false);
    final userId = userInfo.id;
    final response = await APIGet(path: '/reserve/reserveList?userId=$userId');

    if (response['status'] == 200 && !response['results']['before'].isEmpty) {
      setState(() {
        APIBeforeResult = true;
        beforeResult = response['results']['before'];
      });
    }
    if (response['status'] == 200 && !response['results']['ing'].isEmpty) {
      setState(() {
        APIIngResult = true;
        ingResult = response['results']['ing'];
      });
    }
    if (response['status'] == 200 && !response['results']['after'].isEmpty) {
      setState(() {
        APIAfterResult = true;
        afterResult = response['results']['after'];
      });
    }
  }

  Widget resultBox(data) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        padding: EdgeInsets.all(10),
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300, width: 2)),
        child: IntrinsicHeight(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(width: 60, 'images/profile.webp'),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['truckName']),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "시작 일",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                                data['startDate'].substring(5, 7) +
                                    "/" +
                                    data['startDate'].substring(8, 10),
                                style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 1,
                          height: 20,
                          color: Colors.grey.shade500,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "마지막 일",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              data['endDate'].substring(5, 7) +
                                  "/" +
                                  data['endDate'].substring(8, 10),
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // children: [processBadge(data['process'])],
              children: [Text("delete")],
            )
          ]),
        ));
  }

  Widget noneResultBox = Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "해당되는 예약 내역이 없습니다.",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text("마음에 드는 트럭을 둘러보세요"),
          Text("트럭 둘러보기")
        ],
      ));

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Column(children: [
          const TabBar(
              indicatorColor: Colors.blueGrey,
              labelStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
              indicatorWeight: 3,
              tabs: [
                Tab(
                  text: '대기',
                  height: 35,
                ),
                Tab(
                  text: '완료',
                  height: 35,
                ),
                Tab(
                  text: '취소',
                  height: 35,
                )
              ]),
          Expanded(
            child: TabBarView(
              children: [
                APIBeforeResult == true
                    ? Column(children: [
                        Expanded(
                            child: ListView(shrinkWrap: true, children: [
                          ...beforeResult.map((e) => resultBox(e)),
                          SizedBox(
                            height: 10,
                          ),
                        ]))
                      ])
                    : noneResultBox,
                APIIngResult == true
                    ? Column(children: [
                        Expanded(
                            child: ListView(shrinkWrap: true, children: [
                          ...ingResult.map((e) => resultBox(e)),
                          SizedBox(
                            height: 10,
                          ),
                        ]))
                      ])
                    : noneResultBox,
                APIAfterResult == true
                    ? Column(children: [
                        Expanded(
                            child: ListView(shrinkWrap: true, children: [
                          ...afterResult.map((e) => resultBox(e)),
                          SizedBox(
                            height: 10,
                          ),
                        ]))
                      ])
                    : noneResultBox
              ],
            ),
          )
        ]));
  }
}
