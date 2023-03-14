import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';
import 'package:vitally/colortheme/colortheme.dart';



class Patient_Doctor_Details extends StatefulWidget {
  Patient_Doctor_Details({Key? key}) : super(key: key);

  @override
  _Patient_Doctor_DetailsState createState() => _Patient_Doctor_DetailsState();
}

class _Patient_Doctor_DetailsState extends State<Patient_Doctor_Details> {
String number = "+91 123456789";
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
                "",
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20,20,20,0),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Doctor Information",
                            style: TextStyle(
                              color: myColors.lightblue,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,),
                          ),
                        ),
                        /*Spacer(),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/img_rect_blue.png"
                                  ),
                                  fit: BoxFit.cover
                              )),
                          child: Center(
                            child: Text(
                              "Call now",
                              style: TextStyle(
                                  color: myColors.mywhite,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                  Container(
                    color: myColors.lightgrey6,
                    margin: EdgeInsets.fromLTRB(0,20,0,0),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                    child:Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/img_user_blue.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "Name :  ",
                                          style: TextStyle(
                                            color: myColors.lightblue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Amit Kapoor",
                                    style: TextStyle(
                                      color: myColors.lightblue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,15,0,0),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/img_dr_patient_mci_blue_new.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "MCI Registration No. :",
                                          style: TextStyle(
                                            color: myColors.lightblue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "AIJIA12520",
                                    style: TextStyle(
                                      color: myColors.lightblue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,15,0,0),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/img_dr_role_blue_new.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "Role :",
                                          style: TextStyle(
                                            color: myColors.lightblue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Physician ",
                                    style: TextStyle(
                                      color: myColors.lightblue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,15,0,0),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/img_dr_affiliation_blue_new.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "Affiliation :",
                                          style: TextStyle(
                                            color: myColors.lightblue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "HMO",
                                    style: TextStyle(
                                      color: myColors.lightblue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,15,0,0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/img_dr_specility_new_blue.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Your Specialty : ",
                                            style: TextStyle(
                                              color: myColors.lightblue,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "You may call them simply doctors",
                                              style: TextStyle(
                                                color: myColors.lightblue,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20,20,20,0),
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Emergency Contact",
                                style: TextStyle(
                                  color: myColors.lightblue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                 ),
                              ),
                              Text(
                                number,
                                style: TextStyle(
                                  color: myColors.lightblue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  ),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            UrlLauncher.launch('tel:+${number}');
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/img_rect_blue.png"
                                    ),
                                    fit: BoxFit.cover
                                )),
                            child: Center(
                              child: Text(
                                "Call now",
                                style: TextStyle(
                                    color: myColors.mywhite,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

}
