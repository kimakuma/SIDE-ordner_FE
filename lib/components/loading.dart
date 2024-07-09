import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        widthFactor: 20,
        child: CircularProgressIndicator(color: Colors.lightBlue));
  }
}
