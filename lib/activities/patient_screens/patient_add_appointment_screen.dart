// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/response/CommandResponse.dart';

import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'dart:convert' as convert;

class Patient_add_appointment extends StatefulWidget {
  final Function Oncallbacksub;
   Patient_add_appointment({Key? key,required this.Oncallbacksub}) : super(key: key);

  @override
  _Patient_add_appointmentState createState() => _Patient_add_appointmentState();
}

class _Patient_add_appointmentState extends State<Patient_add_appointment>{
  // String date = "";
 // DateTime selectedDate = DateTime.now();
  var dobController = new TextEditingController();
  var firstnameController = new TextEditingController();
  var lastnameController = new TextEditingController();
  var noteController = new TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   /* date = "";
    dobController.text = date;*/
    dobController.text = getDateTime();
    firstnameController.text = "";
    lastnameController.text = "";
    noteController.text = "";
    setState(() {

    });
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
                "Add Appointment",
                /* maxLines: 2,*/
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
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
                          child: Text(
                            "Appointment Name",
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: myColors.lightblue,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          child: Card(
                            color: myColors.mywhite,
                            margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(12, 15, 12, 15),
                              child: Row(
                                children: [
                                  Container(
                                      width: 250,
                                      child: TextField(
                                        controller:  firstnameController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter Appointment Name',
                                          fillColor: myColors.lightgrey3,
                                        ),
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        // Only numbers can be entered
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text(
                            "Doctor Name",
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: myColors.lightblue,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          child: Card(
                            color: myColors.mywhite,
                            margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(12, 15, 12, 15),
                              child: Row(
                                children: [
                                  Container(
                                      width: 250,
                                      child: TextField(
                                        controller:  lastnameController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter Doctor Name',
                                          fillColor: myColors.lightgrey3,
                                        ),
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        // Only numbers can be entered
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _selectDateTime(context);
                      showDateTime = true;
                      setState(() {
                      });
                     /* _selectDate(context).then((value) {
                        date = value;
                        DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
                        DateFormat dateFormat2 = DateFormat("yyyy-MM-dd HH:mm:ss");
                        DateTime dateTime = dateFormat.parse(date);
                        date = dateFormat2.format(dateTime);
                        dobController.text = date;
                        setState(() {

                        });

                      });*/

                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: Text(
                              "Select Date/Time",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: myColors.lightblue,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            child: Card(
                              color: myColors.mywhite,
                              margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(12, 15, 12, 15),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 200,
                                        child: TextField(
                                          controller: dobController,
                                          enabled: false,
                                          style: TextStyle(
                                            color: myColors.myblack,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          decoration: InputDecoration.collapsed(
                                            hintText: 'Select Date/Time',
                                            fillColor: myColors.lightgrey3,
                                          ),
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                        )),
                                    Spacer(),
                                    SvgPicture.asset(
                                      "assets/images/ic_dob_grey.svg",
                                      width: 24,
                                      height: 24,
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text(
                            "Add Note (optional)",
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: myColors.lightblue,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          child: Card(
                            color: myColors.mywhite,
                            margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(12, 15, 12, 15),
                              child: Row(
                                children: [
                                  Container(
                                      width: 280,
                                      height: 200,
                                      child: TextField(
                                        minLines: 1,
                                        maxLines: null,
                                        controller:  noteController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter Note Here',
                                          fillColor: myColors.lightgrey3,
                                        ),
                                        keyboardType: TextInputType.multiline,
                                        textInputAction: TextInputAction.done,
                                        // Only numbers can be entered
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                    child: InkWell(
                      onTap: () {
                        String appoint_name = firstnameController.text;
                        String doctor_name = lastnameController.text;
                        String dob_date = dobController.text;
                        String note = noteController.text;
                        if(appoint_name.isEmpty){
                          UtilityHlepar().getToast("Please enter appointment name.");
                        }
                        else if(doctor_name.isEmpty){
                          UtilityHlepar().getToast("Please enter doctor name.");
                        }
                        else if(dob_date.isEmpty){
                          UtilityHlepar().getToast("Please select date/time.");
                        }
                        else{

                          PatientAddData(context);
                        }
                      },
                      child: Container(
                        height: Mysize.height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            /* color: myColors.mythmes,*/
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/img_btn_bg.png"
                                ),
                                fit: BoxFit.cover
                            )),
                        child: Center(
                          child: Text(
                            "Create ",
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
        )
    );
  }

  Future _selectDateTime(BuildContext context) async {
    final date = await _selectDate(context);
    if (date == null) return;

    final time = await _selectTime(context);

    if (time == null) return;
    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
      DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
      DateFormat dateFormat2 = DateFormat("yyyy-MM-dd HH:mm a");
       DateTime dateTime1 = dateFormat.parse(dateTime.toString());
       String date1 = dateFormat2.format(dateTime1);
       dobController.text = date1;
       setState(() {

       });
    });
  }
 /* Future<String> _selectDate(BuildContext context) async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      // firstDate: DateTime(1920),
      // lastDate: DateTime.now(),
      lastDate: DateTime(2099),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
    return selectedDate.toString();
  }*/
  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate,
      // firstDate: DateTime(int.parse(currentyear)),
      lastDate: DateTime(2099),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getDateTime() {
    // ignore: unnecessary_null_comparison
    if (dateTime == null) {
      return 'select date timer';
    } else {
      return DateFormat('yyyy-MM-dd HH: ss a').format(dateTime);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  Future<void> PatientAddData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['title'] = firstnameController.text;
    request['doctor_name'] = lastnameController.text;
    request['note'] = noteController.text;
    request['time'] = dobController.text;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientaddappointmenturl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    CommandResponse responsemain = await CommandResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      widget.Oncallbacksub();
      Navigator.pop(context);
      setState(() {

      });
    } else {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {

      });
    }
    return;
  }
}