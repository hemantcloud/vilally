import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/activities/patient_screens/patient_dashboard.dart';
import 'package:vitally/colortheme/colortheme.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:vitally/modelclass/response/CommandResponse.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/response/PatientViewDoctorDataResponse.dart';
import '../../utils/Utility.dart';
import 'dart:convert' as convert;

import '../../utils/UtilityHlepar.dart';


class Patient_view_dr_details_scan extends StatefulWidget {
  String scanBarcode;
   Patient_view_dr_details_scan({Key? key,required this.scanBarcode}) : super(key: key);

  @override
  _Patient_view_dr_details_scanState createState() => _Patient_view_dr_details_scanState();
}

class _Patient_view_dr_details_scanState extends State<Patient_view_dr_details_scan>{
String doctorname = "";
String doctorid = "";
Getdoctor? getdoctor=null;
  @override
  void initState() {
    super.initState();
    ViewPatientDoctorProfileApi(context);
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
                        color: myColors.lightgrey6,
                        margin: EdgeInsets.fromLTRB(20,20,20,0),
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        child: Center(
                          child:Column(
                            children: [
                              Image.asset(
                                "assets/images/img_cart_blue.png",
                                color: myColors.mythmes,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 30,0, 0),
                                alignment: Alignment.center,
                                child: Text(
                                  doctorname,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontStyle: FontStyle.normal,
                                    color: myColors.lightblue,
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  doctorid,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.normal,
                                    color: myColors.lightblue,
                                    fontWeight: FontWeight.w300,

                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ],
                )),
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  // Navigator.pop(context);
                  AddPatientDoctorProfileApi(context);
                },
                child: Container(
                  height: Mysize.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/img_btn_bg.png"
                          ),
                          fit: BoxFit.cover
                      )),
                  child: Center(
                    child: Text(
                      "Send Request",
                      style: TextStyle(
                          color: myColors.mywhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }

  Future<void> ViewPatientDoctorProfileApi(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['doctor_id'] = widget.scanBarcode;


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientviewdoctorurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    PatientViewDoctorDataResponse responsemain = await PatientViewDoctorDataResponse.fromJson(jsonResponse);
    Utility.ProgressloadingDialog(context, false);
    if (jsonResponse['status'] == true) {

      getdoctor = responsemain.data!.getdoctor;

      doctorid = "ID "+getdoctor!.id.toString();
      doctorname = getdoctor!.firstname.toString()!+" "+getdoctor!.lastname.toString();

      setState(() {

      });
      return;
    }
    else {
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {

      });
    }
    return;
  }

Future<void> AddPatientDoctorProfileApi(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Utility.ProgressloadingDialog(context, true);
  var request = {};
  request['doctor_id'] = getdoctor!.doctorId.toString();

  HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);

  var response = await http.post(Uri.parse(APIservices.patientadddoctorurl),
      body: convert.jsonEncode(request),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        "Accept-Language": prefs.getString("language").toString(),
        "Authorization": "Bearer "+prefs.getString("token").toString()
      });

  Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
  CommandResponse responsemain = await CommandResponse.fromJson(jsonResponse);
  Utility.ProgressloadingDialog(context, false);
  if (jsonResponse['status'] == true) {
    UtilityHlepar().getToast(responsemain.message.toString());
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        Patient_Dashboard()), (Route<dynamic> route) => false);
    setState(() {

    });
    return;
  }
  else {
    UtilityHlepar().getToast(responsemain.message.toString());
    setState(() {

    });
  }
  return;
}

}