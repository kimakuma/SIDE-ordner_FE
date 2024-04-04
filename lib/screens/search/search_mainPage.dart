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
    final ThemeData themeData = ThemeData(useMaterial3: true);

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

              onChanged: (value) {
                setState(() => inputText = value );
              },
              onSubmitted: (value) {
                setState(() => searchText = value );
              },
            ),
          ),
          Text("입력어: $inputText", style: TextStyle(fontSize: 20),),
          Text("검색어: $searchText", style: TextStyle(fontSize: 20),)
        ],
      )
    );
  }
}