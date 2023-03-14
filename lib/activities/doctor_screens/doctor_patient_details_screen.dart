import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../modelclass/response/ViewDoctorHomeResponse.dart';
import 'doctor_patient_add_symptoms_screen.dart';
import 'doctor_patient_log_vital_signs_screen.dart';
import 'doctor_patient_medicine_screen.dart';
import 'doctor_patient_myreport_screen.dart';
import 'doctor_patient_profile_screen.dart';
import 'doctor_today_details_screen.dart';

class Doctor_Patient_Details extends StatefulWidget {
  Items model;

  Doctor_Patient_Details({Key? key, required this.model}) : super(key: key);

  @override
  _Doctor_Patient_DetailsState createState() => _Doctor_Patient_DetailsState();
}

class _Doctor_Patient_DetailsState extends State<Doctor_Patient_Details> {
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
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: myColors.lightgrey6,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(15, 20, 20, 15),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.of(context).pop(false),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              child: SvgPicture.asset(
                                "assets/images/ic_back_blue.svg",
                                width: 24,
                                height: 24,
                              ),
                            )),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                              color: myColors.Color_D8E9F6,
                              border: Border.all(
                                color: myColors.Color_D8E9F6,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              widget.model.patientName![0],
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: myColors.Color_0281C6,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  widget.model.patientName.toString(),
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
                                  widget.model.dob.toString()+"/"+widget.model.gender![0],
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
                                  widget.model.criticalityCount.toString(),
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
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(30, 40, 30, 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Doctor_Today_Details(
                                        modeldata: widget.model)));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/img_dr_tab1_logo1.png",
                                  width: 112,
                                  height: 112,
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Today",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: myColors.lightblue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            /*Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Patient_track_medication_intake()));*/
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/img_tab1_logo2.png",
                                  width: 112,
                                  height: 112,
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Trend Chart",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: myColors.lightblue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(30, 20, 30, 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Doctor_Patient_medicine(id: widget.model.patientId.toString(),)));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/img_tab1_logo3.png",
                                  width: 112,
                                  height: 112,
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Medications",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: myColors.lightblue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Doctor_Patient_MyReport()));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/img_tab1_logo4.png",
                                  width: 112,
                                  height: 112,
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Reports",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: myColors.lightblue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(30, 40, 30, 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            showCustomDialog(context, Mysize,widget.model);
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/img_tab1_logo5.png",
                                  width: 112,
                                  height: 112,
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Prescribe",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: myColors.lightblue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Doctor_Patient_Profile(
                                        modeldata: widget.model)));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/img_tab1_logo6.png",
                                  width: 112,
                                  height: 112,
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  width: 120,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Patient Profile",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: myColors.lightblue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void showCustomDialog(BuildContext context, Size mysize, Items model) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Center(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: myColors.mywhite.withOpacity(0.01),
                ),
                height: 300,
                child: popup(data:model)),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}

class popup extends StatefulWidget {
  final Items data;
   popup({Key? key,required this.data}) : super(key: key);

  @override
  State<popup> createState() => _popupState();
}

class _popupState extends State<popup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.05),
      body: Container(
        height: 250,
        width: double.infinity,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  "assets/images/ic_cross_red.svg",
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Doctor_Patient_Add_Symptoms(subdata: widget.data,)));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Row(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/img_add_sys_blue.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: 150,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Add Symptoms",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: myColors.lightblue,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Doctor_Patient_Log_Vital_Signs(subdata: widget.data,)));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Row(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/img_heart_blue.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: 120,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Add Vital Logs",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: myColors.lightblue,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Row(
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/img_add_pricap_blue.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Add Medication",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: myColors.lightblue,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
