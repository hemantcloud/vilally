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
import '../../modelclass/response/ViewDoctorHomeResponse.dart';
import '../../modelclass/response/ViewDoctorPatientDailyResponse.dart';
import '../../modelclass/viewdoctorpatientdailysymptomsmodelclass.dart';
import '../../utils/Utility.dart';
import 'dart:convert' as convert;

import '../../utils/UtilityHlepar.dart';

class Doctor_Today_Details extends StatefulWidget {
  Items modeldata;

  Doctor_Today_Details({Key? key, required this.modeldata}) : super(key: key);

  @override
  _Doctor_Today_DetailsState createState() => _Doctor_Today_DetailsState();
}

class _Doctor_Today_DetailsState extends State<Doctor_Today_Details> {
  String imgdailyfeeling = "";
  String datadailyfeeling = "";
  String timedailyfeeling = "";
  String vitalsreportdailystatus = "";
  String temperaturedata = "";
  String pulsedata = "";
  String blood_pressuredata = "";
  String O2_Saturationdata = "";
  List<ViewDoctorPatientDailySymptoms>? symptomsReport = [];

  @override
  void initState() {
    super.initState();
    ViewDoctorPatientDailyProfileApi(context);
    setState(() {});
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
                          margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
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
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Today",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: myColors.lightblue,
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  18, /*decoration: TextDecoration.underline,*/
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "How is Your Patient Feeling Today?",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: myColors.lightblue,
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  15, /*decoration: TextDecoration.underline,*/
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  imgdailyfeeling == ""
                      ? Container()
                      : Container(
                          color: myColors.lightgrey6,
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          padding: EdgeInsets.fromLTRB(15, 20, 20, 15),
                          child: Container(
                            child: Center(
                              child: Column(
                                children: [
                                  imgdailyfeeling == ""
                                      ? Container()
                                      : Container(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            imgdailyfeeling,
                                            width: 40,
                                            height: 40,
                                          ),
                                        ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      datadailyfeeling,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: myColors.lightblue,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  timedailyfeeling == ""
                                      ? Container()
                                      : Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "(" + timedailyfeeling + ")",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: myColors.lightblue,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  vitalsreportdailystatus == ""
                      ? Container()
                      : Container(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Vitals Reported",
                                        style: TextStyle(
                                          color: myColors.lightblue,
                                          fontSize: 15,
                                          fontWeight: FontWeight
                                              .w600, /*decoration: TextDecoration.underline,*/
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 5, 20, 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/img_rect_blue.png"),
                                              fit: BoxFit.cover)),
                                      child: Center(
                                        child: Text(
                                          "Add",
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
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "Temperature : ",
                                              style: TextStyle(
                                                color: myColors.lightblue,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              temperaturedata,
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
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "Pulse : ",
                                              style: TextStyle(
                                                color: myColors.lightblue,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              pulsedata,
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
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "Blood Pressure : ",
                                              style: TextStyle(
                                                color: myColors.lightblue,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              blood_pressuredata,
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
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "O2 Saturation : ",
                                              style: TextStyle(
                                                color: myColors.lightblue,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              O2_Saturationdata,
                                              style: TextStyle(
                                                color: myColors.lightblue,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                  symptomsReport!.length == 0
                      ? Container()
                      : Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Symptoms Reported",
                                    style: TextStyle(
                                      color: myColors.lightblue,
                                      fontSize: 15,
                                      fontWeight: FontWeight
                                          .w600,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/img_rect_blue.png"),
                                          fit: BoxFit.cover)),
                                  child: Center(
                                    child: Text(
                                      "Add",
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
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                            child: ListView.builder(
                                itemCount: symptomsReport!.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: ProductListItem(
                                        data: symptomsReport![index].data,
                                    image:symptomsReport![index].images),
                                  );
                                },
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics()),
                          ),
                        ],
                      )
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> ViewDoctorPatientDailyProfileApi(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['patient_id'] = widget.modeldata.patientId;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(
        Uri.parse(APIservices.doctorviewpatientdailyurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer " + prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewDoctorPatientDailyResponse responsemain =
        await ViewDoctorPatientDailyResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      if (responsemain.data!.todayFeeling!.name.toString() != "null") {
        timedailyfeeling = responsemain.data!.todayFeeling!.date.toString();
        if (responsemain.data!.todayFeeling!.name == "None") {
          imgdailyfeeling = "assets/images/img_emoji1_bg.png";
          datadailyfeeling = "None";
        } else if (responsemain.data!.todayFeeling!.name == "Mild") {
          imgdailyfeeling = "assets/images/img_emoji_pineyellow.png";
          datadailyfeeling = "Mild";
        } else if (responsemain.data!.todayFeeling!.name == "Moderate") {
          imgdailyfeeling = "assets/images/img_emoji_yellow.png";
          datadailyfeeling = "Moderate";
        } else if (responsemain.data!.todayFeeling!.name == "Severe") {
          imgdailyfeeling = "assets/images/img_emoji_orange.png";
          datadailyfeeling = "Severe";
        } else if (responsemain.data!.todayFeeling!.name == "Unbearable") {
          imgdailyfeeling = "assets/images/img_emoji_red.png";
          datadailyfeeling = "Unbearable";
        } else {
          imgdailyfeeling = "assets/images/img_emoji1_bg.png";
          datadailyfeeling = "None";
        }
      }

      if (responsemain.data!.vitalReports!.id.toString() == "null") {
        vitalsreportdailystatus = "";
      }
      else {
        vitalsreportdailystatus = "true";
        temperaturedata =
            responsemain.data!.vitalReports!.bodyTemperature.toString();
        pulsedata = responsemain.data!.vitalReports!.pulse.toString();
        blood_pressuredata = responsemain.data!.vitalReports!.systolic
                .toString()
                .replaceAll("mmHg", "") +
            "/" +
            responsemain.data!.vitalReports!.diastolic
                .toString()
                .replaceAll("mmHg", "") +
            "mmHg";
        O2_Saturationdata =
            responsemain.data!.vitalReports!.oxygenSaturation.toString();
      }
      for (int i = 0; i < responsemain.data!.symptomsReport!.length; i++) {
        String symptomsimage = "";
        if (responsemain.data!.symptomsReport![i].condition.toString() == "None") {
          symptomsimage = "assets/images/img_emoji1_bg.png";

        } else if (responsemain.data!.symptomsReport![i].condition.toString() == "Mild") {
          symptomsimage = "assets/images/img_emoji_pineyellow.png";

        } else if (responsemain.data!.symptomsReport![i].condition.toString() == "Moderate") {
          symptomsimage = "assets/images/img_emoji_yellow.png";

        } else if (responsemain.data!.symptomsReport![i].condition.toString() == "Severe") {
          symptomsimage = "assets/images/img_emoji_orange.png";

        } else if (responsemain.data!.symptomsReport![i].condition.toString() == "Unbearable") {
          symptomsimage = "assets/images/img_emoji_red.png";

        } else {
          symptomsimage = "assets/images/img_emoji1_bg.png";

        }
        ViewDoctorPatientDailySymptoms parameter = ViewDoctorPatientDailySymptoms(symptomsimage,responsemain.data!.symptomsReport![i]);
        symptomsReport!.add(parameter);
      }
      setState(() {});
    } else {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {});
    }
    return;
  }
}

class ProductListItem extends StatelessWidget {
  final SymptomsReport data;
  final String image;

  ProductListItem({required this.data,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
      child: Container(
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                image,
                width: 40,
                height: 40,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                data.name.toString(),
                style: TextStyle(
                  color: myColors.lightblue,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Spacer(),
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      data.condition.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: myColors.lightblue,
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "("+data.date.toString()+")",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: myColors.lightblue,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
