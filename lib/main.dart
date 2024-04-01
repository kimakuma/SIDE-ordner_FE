import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodplace/services/mysqlConnector.dart';
import 'package:foodplace/components/header.dart';
import 'package:foodplace/components/footer.dart';
// import 'package:foodplace/screens/odrner/mainPage.dart';
import 'package:foodplace/screens/odrner/mainPage.dart';
import 'package:foodplace/screens/mypage/myPage.dart';

void main() {
  dbConnector();

  runApp(
    MultiProvider(
      providers: [
        // Login State
        ChangeNotifierProvider(create: (_) => login()),
        // Footer - NavBar
        ChangeNotifierProvider(create: (_) => selectedPage()),
      ],
      child: MyApp(false)
    ),
  );
}

class MyApp extends StatefulWidget {
  final bool isLogin;
  const MyApp(this.isLogin, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final List<Widget> _navPage = [
    MainPage(),
    MainPage(),
    MainPage(),
    MainPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Place',
      home: Scaffold(
        appBar: Header(widget.isLogin),
        body: ChangeNotifierProvider(
          create: (BuildContext context) => selectedPage(),
          child: IndexedStack(
            index: context.watch<selectedPage>().selectedPageIndex,
            children: _navPage,
          )
        ),
        bottomNavigationBar: Footer()
      ),
    );
  }
}