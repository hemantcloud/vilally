import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitally/colortheme/colortheme.dart';



class Patient_dr_scancode extends StatefulWidget {
  const Patient_dr_scancode({Key? key}) : super(key: key);

  @override
  _Patient_dr_scancodeState createState() => _Patient_dr_scancodeState();
}

class _Patient_dr_scancodeState extends State<Patient_dr_scancode>{

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    var Mysize = MediaQuery.of(context).size;
    return MediaQuery(
        data: mediaQueryData.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: myColors.screen_bg,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: myColors.screen_bg,
            leading:  ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Container(
                  margin:EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0)  ,
                  child: SvgPicture.asset(
                    "assets/images/ic_back_blue.svg",
                    width: 24,
                    height: 24,
                  ),
                )),
            title: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Scan",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: myColors.lightblue,
                  fontWeight: FontWeight.w700,

                ),
              ),
            ),
            actions: [
            ],
          ),
          body: SafeArea(
           child: Container(),
          ),
        )
    );
  }

}