import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';
import 'package:vitally/modelclass/doctor_modelclass/doctor_list_modelclass.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/doctor_modelclass/doctor_list_modelclass.dart';
import '../../modelclass/response/DoctorViewPatientProfileResponse.dart';
import '../../modelclass/response/ViewDoctorHomeResponse.dart';
import '../../utils/Utility.dart';
import 'dart:convert' as convert;
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../../utils/UtilityHlepar.dart';


class Doctor_Patient_Profile extends StatefulWidget {
  Items modeldata;
  Doctor_Patient_Profile({Key? key,required this.modeldata}) : super(key: key);

  @override
  _Doctor_Patient_ProfileState createState() => _Doctor_Patient_ProfileState();
}

class _Doctor_Patient_ProfileState extends State<Doctor_Patient_Profile> {
  String patientname = "";
  String patientage = "";
  String patientgender = "";
  String patientphone = "";
  String patientemail = "";
  String patientemename = "";
  String patientemerelation = "";
  String patientemephone = "";
  String patientcancertype = "";
  String patientcancerstage = "";
  String patientcancernew = "";
  String patientcancerdate = "";
  String patientmedicalpriorhistory = "";
  String patientmedicalmedications = "";
  @override
  void initState() {
    super.initState();
    ViewDoctorPatientProfileApi(context);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    var Mysize = MediaQuery.of(context).size;
    return MediaQuery(
        data: mediaQueryData.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: myColors.screen_bg,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: myColors.lightgrey6,
                    margin: EdgeInsets.fromLTRB(0,10,0,0),
                    padding: EdgeInsets.fromLTRB(15, 20, 20, 15),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.of(context).pop(false),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                              margin:EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0)  ,
                              child: SvgPicture.asset(
                                "assets/images/ic_back_blue.svg",
                                width: 24,
                                height: 24,
                              ),
                            )),
                        SizedBox(width: 30,),
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                              color: myColors.Color_D8E9F6,
                              border: Border.all(
                                color: myColors.Color_D8E9F6,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(40))
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              widget.modeldata.patientName![0],
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: myColors.Color_0281C6,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(12, 0, 12,0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  widget.modeldata.patientName.toString(),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: myColors.lightblue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  widget.modeldata.dob.toString()+"/"+widget.modeldata.gender![0],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: myColors.lightblue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  widget.modeldata.criticalityCount.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: myColors.lightblue,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Criticality Score",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: myColors.lightblue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20,20,20,0),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Patient Information",
                            style: TextStyle(
                              color: myColors.lightblue,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            UrlLauncher.launch("tel://"+patientphone);
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
                                    patientname,
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
                                        "assets/images/img_dr_patient_age_blue.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "Age :",
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
                                    patientage,
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
                                        "assets/images/img_gender_blue.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "Gender :",
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
                                    patientgender,
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
                                        "assets/images/img_call_blue.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "Phone :",
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
                                    patientphone,
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
                        /*Container(
                          margin: EdgeInsets.fromLTRB(0,15,0,0),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/img_open_email_blue.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "Email : ",
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
                                    patientemail,
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
                        ),*/

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20,20,20,0),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Emergency Contact",
                            style: TextStyle(
                              color: myColors.lightblue,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            UrlLauncher.launch("tel://"+patientemephone);
                          },child: Container(
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
                                    patientemename,
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
                                        "assets/images/img_relation_blue.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "Relation : ",
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
                                    patientemerelation,
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
                                        "assets/images/img_call_blue.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "Phone :",
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
                                    patientemephone,
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


                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20,20,20,0),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Cancer Profile",
                            style: TextStyle(
                              color: myColors.lightblue,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,),
                          ),
                        ),
                        Spacer(),
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
                              "Add/Edit",
                              style: TextStyle(
                                  color: myColors.mywhite,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
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
                                        "assets/images/img_type_cancer_blue.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "Type of Cancer :",
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
                                    patientcancertype,
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
                                        "assets/images/img_relation_blue.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "Stage :",
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
                                    patientcancerstage,
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
                                        "assets/images/img_call_blue.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "New/Recurred : ",
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
                                    patientcancernew,
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
                                        "assets/images/img_periar_history_blue.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(10,0,0,0),
                                          child: Text(
                                            "First received diagnosis on : ",
                                            style: TextStyle(
                                              color: myColors.lightblue,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
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
                                    patientcancerdate,
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


                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20,20,20,0),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Medical History",
                            style: TextStyle(
                              color: myColors.lightblue,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,),
                          ),
                        ),
                        Spacer(),
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
                              "Add/Edit",
                              style: TextStyle(
                                  color: myColors.mywhite,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
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
                                        "assets/images/img_periar_history_blue.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "Prior History :",
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
                                    patientmedicalpriorhistory,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/img_medication_blue.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          "Medications :  ",
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

                                  child: Text(
                                    patientmedicalmedications,
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



                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ));
  }

  Future<void> ViewDoctorPatientProfileApi(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['patient_id'] = widget.modeldata.patientId;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.doctorviewpatientprofileurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    DoctorViewPatientProfileResponse responsemain = await DoctorViewPatientProfileResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);

      patientname = responsemain.data!.result!.patientInformation!.name.toString();
      patientage = responsemain.data!.result!.patientInformation!.age.toString();
      patientgender = responsemain.data!.result!.patientInformation!.gender.toString();
      patientphone = responsemain.data!.result!.patientInformation!.phone.toString();
      patientemail = responsemain.data!.result!.patientInformation!.email.toString();

      patientemename = responsemain.data!.result!.emergencyContact!.name.toString();
      patientemerelation = responsemain.data!.result!.emergencyContact!.relation.toString();
      patientemephone = responsemain.data!.result!.emergencyContact!.phone.toString();

      patientcancertype = responsemain.data!.result!.cancerProfile!.type.toString();
      patientcancerstage = responsemain.data!.result!.cancerProfile!.state.toString();
      patientcancernew = responsemain.data!.result!.cancerProfile!.newOrRecurrent.toString();
      patientcancerdate = responsemain.data!.result!.cancerProfile!.firstDiagnosisOn.toString();


      patientmedicalpriorhistory = responsemain.data!.result!.medicalHistory!.priorHistory.toString();
      for(int i=0;i<responsemain.data!.result!.medicalHistory!.medications!.length;i++){
        Medications medicationdata = responsemain.data!.result!.medicalHistory!.medications![i];
        String title = medicationdata.medicineName.toString()+" "+medicationdata.dosage.toString()+"mg ";
        if(medicationdata.times=="1"){
          if(medicationdata.duration=="Daily"){
            title = title+"Once a day";
          }
          else if(medicationdata.duration=="Weekly"){
            title = title+"Once a week";
          }
          else if(medicationdata.duration=="Monthly"){
            title = title+"Once a month";
          }
        }
        else if(medicationdata.times=="2"){
          if(medicationdata.duration=="Daily"){
            title = title+"Twice a day";
          }
          else if(medicationdata.duration=="Weekly"){
            title = title+"Twice a week";
          }
          else if(medicationdata.duration=="Monthly"){
            title = title+"Twice a month";
          }
        }
        else if(medicationdata.times=="3"){
          if(medicationdata.duration=="Daily"){
            title = title+"Three times in a day";
          }
          else if(medicationdata.duration=="Weekly"){
            title = title+"Three times in a week";
          }
          else if(medicationdata.duration=="Monthly"){
            title = title+"Three times in a month";
          }
        }
        else if(medicationdata.times=="4"){
          if(medicationdata.duration=="Daily"){
            title = title+"Four times in a day";
          }
          else if(medicationdata.duration=="Weekly"){
            title = title+"Four times in a week";
          }
          else if(medicationdata.duration=="Monthly"){
            title = title+"Four times in a month";
          }
        }

        patientmedicalmedications = patientmedicalmedications+title.toString()+",";

      }


      setState(() {

      });
    }
    else {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {

      });
    }
    return;
  }

}
