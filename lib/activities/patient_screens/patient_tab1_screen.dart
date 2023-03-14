import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/activities/patient_screens/patient_add_log_vital_signs_screen.dart';
import 'package:vitally/activities/patient_screens/patient_track_medication_intake_screen.dart';
import 'package:vitally/activities/patient_screens/patient_you_feeling_now_screen.dart';
import 'package:vitally/activities/patient_screens/patient_your_symptoms_screen.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/response/ViewPatientHomeResponse.dart';
import '../../modelclass/response/ViewPatientProfileResponse.dart';
import '../../utils/Utility.dart';
import 'dart:convert' as convert;

import '../../utils/UtilityHlepar.dart';

class Patient_Tab1 extends StatefulWidget {
  const Patient_Tab1({Key? key}) : super(key: key);

  @override
  _Patient_Tab1State createState() => _Patient_Tab1State();
}

class _Patient_Tab1State extends State<Patient_Tab1> {
  String name = "";
  String formattedDate = "";
  String taskremaningcount = "";
  String tab1_img1 = "assets/images/ic_tab1_icon1_unactive.png";
  String tab1_img2 = "assets/images/ic_tab1_icon2_unactive.png";
  String tab1_img3 = "assets/images/ic_tab1_icon3_unactive.png";
  String tab1_img4 = "assets/images/ic_tab1_icon4_unactive.png";
  String feelingname = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      this.ViewPatientProfileApi(context);
    });

    var now = new DateTime.now();
    var formatter = new DateFormat('dd MMM yyyy');
    formattedDate = formatter.format(now);
    print(formattedDate);
    setState(() {

    });
  }
  Oncallback(){
    ViewPatientProfileApi(context);
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
                    margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            name.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: myColors.lightblue,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Today, "+formattedDate,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: myColors.lightblue,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset("assets/images/img_circle_not_fill_bg.png",width: 200,height: 200,),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 50, 0, 40),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      taskremaningcount.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height: 1,
                                          color: myColors.lightblue,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 80),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Task Remaning",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: myColors.lightblue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(30, 40, 30, 0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Patient_You_Feeling_Now(Onacallback: Oncallback,feelingname:feelingname)));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(tab1_img1.toString(),width: 110,height: 110,),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "How are you feeling now?",
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
                                builder: (BuildContext context) => Patient_your_symptoms(Oncallback:Oncallback)));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(tab1_img2.toString(),width: 110,height: 110,),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Track  Symptoms",
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
                                builder: (BuildContext context) => Patient_Add_log_vital_signs(Oncallback:Oncallback)));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(tab1_img3.toString(),width: 110,height: 110,),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Log Vital Signs",
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
                                builder: (BuildContext context) => Patient_track_medication_intake(Oncallbacksub:Oncallback)));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(tab1_img4.toString(),width: 110,height: 110,),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Take Medicine",
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
  Future<void> ViewPatientProfileApi(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientviewhomeurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewPatientHomeResponse responsemain = await ViewPatientHomeResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);

      name = "Welcome, "+responsemain.data!.firstname.toString()+" "+responsemain.data!.lastname.toString();
      taskremaningcount = responsemain.data!.remaining.toString();
      if(responsemain.data!.feeling==0){
        tab1_img1 = "assets/images/ic_tab1_icon1_unactive.png";
      }
      else{
        tab1_img1 = "assets/images/ic_tab1_icon1_active.png";
      }

      if(responsemain.data!.trackSymptoms==0){
        tab1_img2 = "assets/images/ic_tab1_icon2_unactive.png";
      }
      else{
        tab1_img2 = "assets/images/ic_tab1_icon2_active.png";
      }


      if(responsemain.data!.logVitalSign==0){
        tab1_img3 = "assets/images/ic_tab1_icon3_unactive.png";
      }
      else{
        tab1_img3 = "assets/images/ic_tab1_icon3_active.png";
      }


      if(responsemain.data!.takeMedicine==0){
        tab1_img4 = "assets/images/ic_tab1_icon4_unactive.png";
      }
      else{
        tab1_img4 = "assets/images/ic_tab1_icon4_active.png";
      }

      feelingname = responsemain.data!.name.toString();
      print("feelingname >>>>"+feelingname);

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
