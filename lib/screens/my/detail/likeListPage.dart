/* 찜 내역 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodplace/services/API.dart'; 
import 'dumidata.dart';// 일단 더미데이터 사용

// 로그인 상태 관리 파일
import 'package:foodplace/components/loginStatus.dart';

class LikeListPage extends StatefulWidget {
  @override
  State<LikeListPage> createState() => _LikeListPageState();
}

class _LikeListPageState extends State<LikeListPage> {
  

 // 디자인
 @override
  Widget build(BuildContext context) {

    const newList=NEW_LIST;

    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemCount: newList.length, // 구분선 포함하여 항목 수 증가
        
      itemBuilder: (BuildContext context, int index){
        return Container(
          height: 80,
          child: IntrinsicHeight( //IntrinsicHeight : child의 고유 높이에 맞춰 child의 크기를 조정하는 위젯
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(width: 80, '../assets/images/${newList[index]['image']}'),
                ),
                SizedBox( // 사진 옆에 공간을 위해 사용
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(' ${newList[index]['name']} '),
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text('${newList[index]['star']}',
                             style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(width: 10),
                            Text('${newList[index]['reivewCount']}개의 평가',
                             style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(width: 10),
                            Text('${newList[index]['located']}',
                             style: TextStyle(fontSize: 12,)
                            ), 
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ]
            )
          )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
  
  Widget noneResultBox = Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "아직 찜한 트럭이 없어요.",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text("마음에 드는 트럭을 찜해두면 빠르게 다시 찾아볼 수 있어요."),
          Text("트럭 둘러보기")
        ],
      ));
}
