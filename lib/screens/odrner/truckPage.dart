/* 마이 페이지 - 개인 정보 */
import 'package:flutter/material.dart';

import 'package:foodplace/services/API.dart';

import 'package:foodplace/components/loading.dart';

class TruckPage extends StatefulWidget {
  final int truckId;
  const TruckPage(this.truckId, {super.key});

  @override
  State<TruckPage> createState() => _TruckPageState();
}

class _TruckPageState extends State<TruckPage> {
  Map<String, dynamic> truckInfo = {};
  List<dynamic> truckMenu = [];

  Future<void> init() async {
    final response =
        await APIGet(path: '/reserve/truckDetail?truckId=${widget.truckId}');

    if (response['status'] == 200 && !response['results'].isEmpty) {
      setState(() {
        truckInfo = response['results']['truckInfo'];
        truckMenu = response['results']['truckMenuList'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    init();
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
        Text(style: TextStyle(fontSize: 30), truckInfo['name'])
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
                      children: [truckMenuWidget(), Text("asd"), Text("asd")],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Column(children: [
                        Container(
                            width: (MediaQuery.of(context).size.width - 30),
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 45, 122, 255),
                            ),
                            child: Text(
                              "예약하기",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  height: 1.7),
                              textAlign: TextAlign.center,
                            )),
                        Padding(padding: EdgeInsets.all(7))
                      ]))
                ]))));
  }
}