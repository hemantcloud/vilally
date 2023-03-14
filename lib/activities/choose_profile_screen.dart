import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitally/activities/patient_screens/patient_login_screen.dart';
import 'package:vitally/colortheme/colortheme.dart';

import 'doctor_screens/doctor_login_screen.dart';

class Choose_profile extends StatefulWidget {
  const Choose_profile({Key? key}) : super(key: key);

  @override
  _Choose_profileState createState() => _Choose_profileState();
}
class _Choose_profileState extends State<Choose_profile> {
  bool cardstatus=false;
  bool cardstatus_dr=false;
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
                    "",
                    width: 24,
                    height: 24,
                  ),
                )),
            title: Container(

              child: Text(
                "",
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    color: myColors.myblack,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                    alignment: Alignment.center,
                   child: Image.asset("assets/images/img_splash_logo.png",width: 150,height: 180,)
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
                    child: Container(
                      alignment: Alignment.center,

                      child: Text(
                        "Choose your profile",

                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: myColors.lightblue,
                            fontWeight: FontWeight.w700,
                            fontSize: 28),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:60,bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              cardstatus = true;
                              cardstatus_dr = false;
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Patient_login()));
                          },
                          child: Container(

                            child: Column(
                              children: [
                                Card(
                                  color: cardstatus==true?myColors.mythmes:myColors.lightblue2,
                                  margin: EdgeInsets.fromLTRB(20, 10, 0, 20),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(40, 50, 40, 50),
                                        child:cardstatus==true?SvgPicture.asset("assets/images/ic_patient_bg_white.svg",width: 50,height: 50,): Image.asset("assets/images/img_patient_logo_blue.png",width: 50,height: 50,),
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 00, 0, 20),
                                  child: Container(
                                    alignment: Alignment.center,

                                    child: Text(
                                      "Patient",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: myColors.lightblue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ),
                                )
                              ],
                            )

                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              cardstatus = false;
                              cardstatus_dr = true;
                            });
                             Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Doctor_login()));
                          },
                          child: Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Column(
                                children: [
                                  Card(
                                    color:cardstatus_dr==true? myColors.mythmes:myColors.lightblue2,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 20),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(40, 50, 40, 50),
                                          child:cardstatus_dr==true?SvgPicture.asset("assets/images/ic_dr_bg_white.svg",width: 50,height: 50,):Image.asset("assets/images/img_dr_logo_blue.png",width: 50,height: 50,),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 00, 0, 20),
                                    child: Container(
                                      alignment: Alignment.center,

                                      child: Text(
                                        "Doctor",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: myColors.lightblue,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )
                                ],
                              )

                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
            
          ),
        )
    );
  }
}
