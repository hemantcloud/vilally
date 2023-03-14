import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitally/colortheme/colortheme.dart';

class Patient_Tab2 extends StatefulWidget {
  const Patient_Tab2({Key? key}) : super(key: key);

  @override
  _Patient_Tab2State createState() => _Patient_Tab2State();
}

class _Patient_Tab2State extends State<Patient_Tab2>{
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    var Mysize = MediaQuery.of(context).size;
    return MediaQuery(
        data: mediaQueryData.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: myColors.screen_bg,
        )
    );
  }
}