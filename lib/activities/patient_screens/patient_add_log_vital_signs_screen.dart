import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_more_text_popup/show_more_text_popup.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/response/ViewActivityListResponse.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'dart:convert' as convert;

class Patient_Add_log_vital_signs extends StatefulWidget {
  final Function Oncallback;

  Patient_Add_log_vital_signs({Key? key, required this.Oncallback})
      : super(key: key);

  @override
  _Patient_Add_log_vital_signsState createState() =>
      _Patient_Add_log_vital_signsState();
}

class _Patient_Add_log_vital_signsState
    extends State<Patient_Add_log_vital_signs> {
  int _valuewaterlevel = 1;
  String sleeptime = "00:00 Hours";
  TimeOfDay selectedTime = TimeOfDay.now();
  final String text =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  late String firstHalf;
  late String secondHalf;
  GlobalKey key = new GlobalKey();
  bool flag = true;

  List<String> body_temp_list = ['body temperature'];
  String _selectedbodytemp = 'body temperature';

  List<String> pluse_list = ['Pulse'];
  String _selectedpluse = 'Pulse';

  List<String> systolic_list = ['Systolic'];
  String _selectedsystolic = 'Systolic';

  List<String> diastolic_list = ['Diastolic'];
  String _selecteddiastolic = 'Diastolic';

  List<String> oxygen_list = ['Oxygen saturation'];
  String _selectedoxygen = 'Oxygen saturation';

  List<String> activity_list_id = [];
  List<String> activity_list = [''];
  String _selectedactivity = '';
  String _selectedactivity_id = '';

  List<String> activity_time_list = ['Activity time'];
  String _selectedactivitytime = 'Activity time';

  String systolic = "00";
  String diastolic = "00";
  String oxygen_saturation = "";
  String activity = "";
  String activitytime = "";

  @override
  void initState() {
    super.initState();
    // body_temp_list  =
    double count = 96.0;
    for (int i = 0; i <= 79; i++) {
      count = count + 00.1;
      body_temp_list.add(
          double.parse(count.toString()).toStringAsFixed(1).toString() + "°F");
    }

    for (int i = 60; i <= 120; i++) {
      pluse_list.add(i.toString() + "bpm");
    }

    for (int i = 90; i <= 180; i++) {
      systolic_list.add(i.toString() + "mmHg");
    }

    for (int i = 60; i <= 105; i++) {
      diastolic_list.add(i.toString() + "mmHg");
    }

    for (int i = 90; i <= 100; i++) {
      oxygen_list.add(i.toString() + "%");
    }

    if (text.length > 40) {
      firstHalf = text.substring(0, 40);
      secondHalf = text.substring(40, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }

    activity_time_list.add("1 Hours");
    activity_time_list.add("2 Hours");
    activity_time_list.add("3 Hours");
    activity_time_list.add("4 Hours");
    activity_time_list.add("5 Hours");
    Future.delayed(Duration.zero, () {
      this.ViewActivityListApi(context);
    });
    this.setState(() {});
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
            leading: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: SvgPicture.asset(
                    "assets/images/ic_back_blue.svg",
                    width: 24,
                    height: 24,
                  ),
                )),
            title: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Log Vital Signs",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: myColors.lightblue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            actions: [],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    color: myColors.mythmes,
                    alignment: Alignment.center,
                    child: Text(
                      "Recommended by your doctor",
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        color: myColors.mywhite,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    color: myColors.Color_D8E9F6_2,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    margin: EdgeInsets.all(00),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Body Temperature",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.normal,
                                            color: myColors.lightblue,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          _selectedbodytemp,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.normal,
                                            color: myColors.lightblue,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                body_temp_list.length == 0
                                    ? Container()
                                    : Card(
                                        color: myColors.mywhite,
                                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding:
                                              EdgeInsets.fromLTRB(10, 7, 10, 7),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                                icon: SvgPicture.asset(
                                                  "assets/images/ic_down_arrow_grey.svg",
                                                  width: 20,
                                                  height: 10,
                                                ),
                                                items: body_temp_list
                                                    .map((String val) {
                                                  return new DropdownMenuItem<
                                                      String>(
                                                    value: val,
                                                    child: Text(val,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            color: myColors
                                                                .lightblue,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300)),
                                                  );
                                                }).toList(),
                                                value: _selectedbodytemp,
                                                hint: Text(""),
                                                onChanged: (newVal) {
                                                  _selectedbodytemp = newVal!;
                                                  this.setState(() {});
                                                }),
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Pulse",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal,
                                          color: myColors.lightblue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        _selectedpluse,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal,
                                          color: myColors.lightblue,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                color: myColors.mywhite,
                                margin: EdgeInsets.fromLTRB(15, 5, 0, 5),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                        icon: SvgPicture.asset(
                                          "assets/images/ic_down_arrow_grey.svg",
                                          width: 20,
                                          height: 10,
                                        ),
                                        items: pluse_list.map((String val) {
                                          return new DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight:
                                                        FontWeight.w300)),
                                          );
                                        }).toList(),
                                        value: _selectedpluse,
                                        hint: Text(""),
                                        onChanged: (newVal) {
                                          _selectedpluse = newVal!;
                                          this.setState(() {});
                                        }),
                                  ),
                                ),
                              )
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
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  "Blood Pressure",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    color: myColors.lightblue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Text(
                                  systolic + "/" + diastolic + "mmHg",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    color: myColors.lightblue,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Systolic",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontStyle: FontStyle.normal,
                                        color: myColors.lightblue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: myColors.mywhite,
                                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.fromLTRB(12, 7, 12, 7),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                            icon: SvgPicture.asset(
                                              "assets/images/ic_down_arrow_grey.svg",
                                              width: 20,
                                              height: 10,
                                            ),
                                            items:
                                                systolic_list.map((String val) {
                                              return new DropdownMenuItem<
                                                  String>(
                                                value: val,
                                                child: Container(
                                                  child: Text(val,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          color: myColors
                                                              .lightblue,
                                                          fontWeight:
                                                              FontWeight.w300)),
                                                ),
                                              );
                                            }).toList(),
                                            value: _selectedsystolic,
                                            hint: Text(""),
                                            onChanged: (newVal) {
                                              if (diastolic == "00") {
                                                _selectedsystolic = newVal!;
                                                String newdiastolic =
                                                    _selectedsystolic
                                                        .replaceAll("mmHg", "");
                                                systolic = newdiastolic;
                                                this.setState(() {});
                                              } else {
                                                int finaldata =
                                                    int.parse(diastolic) + 20;
                                                String newdiastolic = newVal!
                                                    .replaceAll("mmHg", "");
                                                if (finaldata <=
                                                    int.parse(newdiastolic)) {
                                                  _selecteddiastolic = newVal!;
                                                  String newdiastolic =
                                                      _selecteddiastolic
                                                          .replaceAll(
                                                              "mmHg", "");
                                                  print(
                                                      "_selecteddiastolic >>>>>" +
                                                          newdiastolic);
                                                  diastolic = newdiastolic;
                                                  this.setState(() {});
                                                } else {
                                                  UtilityHlepar().getToast(
                                                      "Please select right value.");
                                                }
                                              }
                                            }),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
                                child: SvgPicture.asset(
                                    "assets/images/ic_slash_grey_bg.svg"),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Diastolic",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontStyle: FontStyle.normal,
                                          color: myColors.lightblue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: myColors.mywhite,
                                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding:
                                            EdgeInsets.fromLTRB(12, 7, 12, 7),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                              icon: SvgPicture.asset(
                                                "assets/images/ic_down_arrow_grey.svg",
                                                width: 20,
                                                height: 10,
                                              ),
                                              items: diastolic_list
                                                  .map((String val) {
                                                return new DropdownMenuItem<
                                                    String>(
                                                  value: val,
                                                  child: Container(
                                                    child: Text(val,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            color: myColors
                                                                .lightblue,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300)),
                                                  ),
                                                );
                                              }).toList(),
                                              value: _selecteddiastolic,
                                              hint: Text(""),
                                              onChanged: (newVal) {
                                                if (systolic == "00") {
                                                  _selecteddiastolic = newVal!;
                                                  String newdiastolic =
                                                      _selecteddiastolic
                                                          .replaceAll(
                                                              "mmHg", "");
                                                  print(
                                                      "_selecteddiastolic >>>>>" +
                                                          newdiastolic);
                                                  diastolic = newdiastolic;
                                                  this.setState(() {});
                                                } else {
                                                  int finaldata =
                                                      int.parse(systolic) - 20;
                                                  String newdiastolic = newVal!
                                                      .replaceAll("mmHg", "");
                                                  if (finaldata >=
                                                      int.parse(newdiastolic)) {
                                                    _selecteddiastolic =
                                                        newVal!;
                                                    String newdiastolic =
                                                        _selecteddiastolic
                                                            .replaceAll(
                                                                "mmHg", "");
                                                    print(
                                                        "_selecteddiastolic >>>>>" +
                                                            newdiastolic);
                                                    diastolic = newdiastolic;
                                                    this.setState(() {});
                                                  } else {
                                                    UtilityHlepar().getToast(
                                                        "Please select right value.");
                                                  }
                                                }
                                              }),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 00, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Oxygen Saturation (%)",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.normal,
                                            color: myColors.lightblue,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          oxygen_saturation == ""
                                              ? ""
                                              : oxygen_saturation,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.normal,
                                            color: myColors.lightblue,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Card(
                                  color: myColors.mywhite,
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(12, 7, 12, 7),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                          icon: SvgPicture.asset(
                                            "assets/images/ic_down_arrow_grey.svg",
                                            width: 20,
                                            height: 10,
                                          ),
                                          items: oxygen_list.map((String val) {
                                            return new DropdownMenuItem<String>(
                                              value: val,
                                              child: Container(
                                                child: Text(val,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color:
                                                            myColors.lightblue,
                                                        fontWeight:
                                                            FontWeight.w300)),
                                              ),
                                            );
                                          }).toList(),
                                          value: _selectedoxygen,
                                          hint: Text(""),
                                          onChanged: (newVal) {
                                            _selectedoxygen = newVal!;
                                            oxygen_saturation = _selectedoxygen;
                                            this.setState(() {});
                                          }),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              _selectTime(context);
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            "Sleep",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontStyle: FontStyle.normal,
                                              color: myColors.lightblue,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            sleeptime,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontStyle: FontStyle.normal,
                                              color: myColors.lightblue,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Card(
                                      color: myColors.mywhite,
                                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                      ),
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(12, 22, 12, 22),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text(
                                                sleeptime,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            Spacer(),
                                            SvgPicture.asset(
                                              "assets/images/ic_down_arrow_grey.svg",
                                              width: 20,
                                              height: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Water Intake",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: myColors.lightblue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: InkWell(
                                  onTap: () {
                                    showMoreText(text, context);
                                  },
                                  key: key,
                                  child: SvgPicture.asset(
                                    "assets/images/ic_info_bg.svg",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Card(
                            color: myColors.mywhite,
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(12, 7, 12, 7),
                              child: Row(
                                children: [
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        icon: SvgPicture.asset(
                                          "assets/images/ic_down_arrow_grey.svg",
                                          width: 20,
                                          height: 10,
                                        ),
                                        value: _valuewaterlevel,
                                        items: [
                                          DropdownMenuItem(
                                            child: Container(
                                              width: 270,
                                              child: Text(
                                                "500 ML",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(
                                              width: 270,
                                              child: Text(
                                                "1 L",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(
                                              width: 270,
                                              child: Text(
                                                "2 L",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            value: 3,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(
                                              width: 270,
                                              child: Text(
                                                "3 L",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            value: 4,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(
                                              width: 270,
                                              child: Text(
                                                "4 L",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            value: 5,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(
                                              width: 270,
                                              child: Text(
                                                "5 L",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            value: 6,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(
                                              width: 270,
                                              child: Text(
                                                "6 L",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            value: 7,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(
                                              width: 270,
                                              child: Text(
                                                "7 L",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            value: 8,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(
                                              width: 270,
                                              child: Text(
                                                "8 L",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            value: 9,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(
                                              width: 270,
                                              child: Text(
                                                "9 L",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            value: 10,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(
                                              width: 270,
                                              child: Text(
                                                "10 L",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            value: 11,
                                          ),
                                        ],
                                        onChanged: (int? value) {
                                          setState(() {
                                            _valuewaterlevel = value!;
                                          });
                                        },
                                        hint: Text(
                                          "Select Gender",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontStyle: FontStyle.normal,
                                              color: myColors.lightblue,
                                              fontWeight: FontWeight.w300),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Activity",
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                              color: myColors.lightblue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              activity_list.length == 0
                                  ? Container()
                                  : Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              activity.toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontStyle: FontStyle.normal,
                                                color: myColors.lightblue,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: myColors.mywhite,
                                            margin:
                                                EdgeInsets.fromLTRB(0, 5, 0, 5),
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10)),
                                            ),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: EdgeInsets.fromLTRB(
                                                  12, 7, 12, 7),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                    icon: SvgPicture.asset(
                                                      "assets/images/ic_down_arrow_grey.svg",
                                                      width: 20,
                                                      height: 10,
                                                    ),
                                                    items: activity_list
                                                        .map((String val) {
                                                      return new DropdownMenuItem<
                                                          String>(
                                                        value: val,
                                                        child: Container(
                                                          child: Text(val,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  color: myColors
                                                                      .lightblue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300)),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    value: _selectedactivity,
                                                    hint: Text(""),
                                                    onChanged: (newVal) {
                                                      _selectedactivity =
                                                          newVal!;
                                                      activity =
                                                          _selectedactivity;

                                                      this.setState(() {});
                                                    }),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Text(
                                        activitytime,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal,
                                          color: myColors.lightblue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: myColors.mywhite,
                                      margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding:
                                            EdgeInsets.fromLTRB(12, 7, 12, 7),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                              icon: SvgPicture.asset(
                                                "assets/images/ic_down_arrow_grey.svg",
                                                width: 20,
                                                height: 10,
                                              ),
                                              items: activity_time_list
                                                  .map((String val) {
                                                return new DropdownMenuItem<
                                                    String>(
                                                  value: val,
                                                  child: Container(
                                                    child: Text(val,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            color: myColors
                                                                .lightblue,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300)),
                                                  ),
                                                );
                                              }).toList(),
                                              value: _selectedactivitytime,
                                              hint: Text(""),
                                              onChanged: (newVal) {
                                                _selectedactivitytime = newVal!;
                                                activitytime =
                                                    _selectedactivitytime;
                                                this.setState(() {});
                                              }),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 40, bottom: 20),
                    child: InkWell(
                      onTap: () {
                        print("_selectedbodytemp >>>>>" + _selectedbodytemp);
                        print("_selectedpluse >>>>>" + _selectedpluse);
                        print("systolic >>>>>" + systolic);
                        print("diastolic >>>>>" + diastolic);
                        print("_selectedoxygen >>>>>" + _selectedoxygen);
                        print("sleeptime >>>>>" + sleeptime);
                        print("_valuewaterlevel >>>>>" +
                            _valuewaterlevel.toString());
                        print("_selectedactivity >>>>>" + _selectedactivity);
                        print("_selectedactivitytime >>>>>" +
                            _selectedactivitytime);

                        if (_selectedbodytemp == "body temperature") {
                          UtilityHlepar()
                              .getToast("Please select body temperature.");
                        } else if (_selectedpluse == "Pulse") {
                          UtilityHlepar().getToast("Please select pulse.");
                        } else if (systolic == "00") {
                          UtilityHlepar().getToast("Please select systolic.");
                        } else if (diastolic == "00") {
                          UtilityHlepar().getToast("Please select diastolic.");
                        } else if (_selectedoxygen == "Oxygen saturation") {
                          UtilityHlepar()
                              .getToast("Please select oxygen saturation.");
                        } else if (sleeptime == "00:00 Hours") {
                          UtilityHlepar().getToast("Please select sleep time.");
                        } else if (_selectedactivity == "Activity") {
                          UtilityHlepar().getToast("Please select activity.");
                        } else if (_selectedactivitytime == "Activity time") {
                          UtilityHlepar()
                              .getToast("Please select activity time.");
                        } else {
                          String waterlevel = "";
                          if (_valuewaterlevel == 1) {
                            waterlevel = "500 ML";
                          } else if (_valuewaterlevel == 2) {
                            waterlevel = "1 L";
                          } else if (_valuewaterlevel == 3) {
                            waterlevel = "2 L";
                          } else if (_valuewaterlevel == 4) {
                            waterlevel = "3 L";
                          } else if (_valuewaterlevel == 5) {
                            waterlevel = "4 L";
                          } else if (_valuewaterlevel == 6) {
                            waterlevel = "5 L";
                          } else if (_valuewaterlevel == 7) {
                            waterlevel = "6 L";
                          } else if (_valuewaterlevel == 8) {
                            waterlevel = "7 L";
                          } else if (_valuewaterlevel == 9) {
                            waterlevel = "8 L";
                          } else if (_valuewaterlevel == 10) {
                            waterlevel = "9 L";
                          } else if (_valuewaterlevel == 11) {
                            waterlevel = "10 L";
                          }

                          AddLogVitalSignsApi(context, waterlevel);
                        }
                      },
                      child: Container(
                        height: Mysize.height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            /* color: myColors.mythmes,*/
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/img_btn_bg.png"),
                                fit: BoxFit.cover)),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: myColors.mywhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.input,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? Container(),
        );
      },
    );

    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        sleeptime = selectedTime.hour.toString() +
            ":" +
            selectedTime.minute.toString() +
            " Hours";
      });
    }
  }

  void showMoreText(String? text, BuildContext context) {
    ShowMoreTextPopup popup = ShowMoreTextPopup(context,
        text: text.toString(),
        textStyle: TextStyle(color: myColors.lightblue),
        height: 200,
        width: 120,
        backgroundColor: myColors.mywhite,
        padding: EdgeInsets.all(10.0),
        borderRadius: BorderRadius.circular(10.0),
        onDismiss: () {});

    /// show the popup for specific widget
    popup.show(
      widgetKey: key,
    );
  }

  Future<void> ViewActivityListApi(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(
        Uri.parse(APIservices.patientviewactivitylisturl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer " + prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewActivityListResponse responsemain =
        await ViewActivityListResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);

      // activity_list.clear();
      // activity_list_id.clear();
      for (int i = 0; i < responsemain.data!.getactiviy!.length; i++) {
        activity_list.add(responsemain.data!.getactiviy![i].name.toString());
        activity_list_id.add(responsemain.data!.getactiviy![i].id.toString());
      }
      setState(() {});
    } else {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {});
    }
    return;
  }

  Future<void> AddLogVitalSignsApi(
      BuildContext context, String waterlevel) async {
    for (int i = 0; i < activity_list_id.length; i++) {
      if (_selectedactivity == activity_list[i]) {
        _selectedactivity_id = activity_list_id[i - 1];
        break;
      }
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['body_temperature'] = _selectedbodytemp;
    request['pulse'] = _selectedpluse;
    request['systolic'] = systolic + "mmHg";
    request['diastolic'] = diastolic + "mmHg";
    request['oxygen_saturation'] = _selectedoxygen;
    request['sleep'] = sleeptime.replaceAll(" Hours", "");
    request['water_intake'] = waterlevel;
    request['activity'] = _selectedactivity_id;
    request['activity_time'] = _selectedactivitytime;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(
        Uri.parse(APIservices.patientaddlogvitalsignsurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer " + prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewActivityListResponse responsemain =
        await ViewActivityListResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      this.widget.Oncallback();
      Navigator.pop(context);
      setState(() {});
    } else {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {});
    }
    return;
  }
}
