import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('footer');
  }
}

// class Footer extends StatelessWidget implements PreferredSizeWidget {
//   // const HeaderMain({super.key});

//   final double header_height = 60;

//   @override
//   Widget build(BuildContext context) {
//     return const PreferredSize(
//       preferredSize: Size.fromHeight(100),
//       child: Text("footer")
//     );
//   }
  
//   // preferredSize 설정
//   @override
//   Size get preferredSize => Size.fromHeight(header_height);
// }