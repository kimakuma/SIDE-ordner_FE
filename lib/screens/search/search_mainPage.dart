/* NavBar("검색")를 통한 진입 페이지 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search_MainPage extends StatefulWidget {
  @override
  State<Search_MainPage> createState() => _Search_MainPageState();
}

class _Search_MainPageState extends State<Search_MainPage> {
  String? inputText;
  String? searchText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchBar(
              backgroundColor: MaterialStatePropertyAll(Colors.lightBlue.shade100),
              elevation: MaterialStatePropertyAll(0),
              trailing: [Icon(Icons.search)],
              shape: MaterialStatePropertyAll(ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20))),
              hintText: "검색어를 입력하세요",
              hintStyle: MaterialStatePropertyAll(TextStyle(color: Colors.grey)),

              // onChanged: 변경 될 때마다 인식
              onChanged: (value) {
                setState(() => inputText = value );
              },
              // onSubmitted: 제출 될 때마다 인식 / enter 키 인식 가능
              onSubmitted: (value) {
                setState(() => searchText = value );
              },
            ),
          ),
          Text("입력어: $inputText", style: TextStyle(fontSize: 20),),
          Text("검색어: $searchText", style: TextStyle(fontSize: 20),),
        ],
      )
    );
  }
}