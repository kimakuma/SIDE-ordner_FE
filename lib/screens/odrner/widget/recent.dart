/* 마이 페이지 - 개인 정보 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodplace/services/API.dart';

class Recent extends StatefulWidget {
  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  List<dynamic> truckList = [];

  Future<void> init() async {
    final response = await APIGet(path: '/reserve/truckList');

    if (response['status'] == 200 && !response['results'].isEmpty) {
      setState(() {
        truckList = response['results'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "최신 트럭 TOP 10",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
          Container(
            height: 100,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(
                    truckList.length,
                    (i) => GestureDetector(
                        onTap: () {
                          print(truckList[i]['name']);
                        },
                        child: Container(
                            height: 100,
                            width: 100,
                            margin: i != truckList.length - 1
                                ? EdgeInsets.fromLTRB(0, 0, 15, 0)
                                : EdgeInsets.all(0),
                            child: Column(
                              children: [
                                Container(
                                    width: 100,
                                    height: 70,
                                    child: Image.asset(
                                        fit: BoxFit.fitWidth,
                                        'images${truckList[i]['img']}')),
                                Padding(padding: EdgeInsets.all(3)),
                                Text(truckList[i]['name'].length < 10
                                    ? truckList[i]['name']
                                    : truckList[i]['name'].substring(0, 9))
                              ],
                            ))))
                //...truckList.map((v) => ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
