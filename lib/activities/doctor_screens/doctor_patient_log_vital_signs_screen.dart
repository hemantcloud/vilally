import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/currentmoodmodelclass.dart';
import '../../modelclass/response/ViewDocterPatientAddVitalLogsResponse.dart';
import '../../modelclass/response/ViewDoctorHomeResponse.dart';
import '../../utils/Utility.dart';
import 'dart:convert' as convert;

import '../../utils/UtilityHlepar.dart';

class Doctor_Patient_Log_Vital_Signs extends StatefulWidget {
  final Items subdata;
  Doctor_Patient_Log_Vital_Signs({Key? key, required this.subdata})
      : super(key: key);

  @override
  _Doctor_Patient_Log_Vital_SignsState createState() =>
      _Doctor_Patient_Log_Vital_SignsState();
}

class _Doctor_Patient_Log_Vital_SignsState
    extends State<Doctor_Patient_Log_Vital_Signs> {
  List<CurrentMoodModelClass> productlist1 = <CurrentMoodModelClass>[];

  @override
  void initState() {
    super.initState();
    productlist1 = getProductList1();
    ViewDoctorPatientLogVitalSignsApi(context);
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
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Recommendation Log Vital Signs",
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        color: myColors.lightblue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                        itemCount: productlist1.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (productlist1[index].ischeck) {
                                setState(() {
                                  productlist1[index].ischeck = false;
                                });
                              } else {
                                setState(() {
                                  productlist1[index].ischeck = true;
                                });
                              }
                            },
                            child: ProductListItem1(
                              imagePath: productlist1[index].image,
                              title: productlist1[index].title,
                              ischeck: productlist1[index].ischeck,
                            ),
                          );
                        },
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: new BouncingScrollPhysics()),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  AddDoctorPatientLogVitalSignsApi(context);
                },
                child: Container(
                  height: Mysize.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("assets/images/img_btn_bg.png"),
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
          ),
        ));
  }

  List<CurrentMoodModelClass> getProductList1() {
    List<CurrentMoodModelClass> productbook = <CurrentMoodModelClass>[];
    CurrentMoodModelClass sliderModelbook1 = new CurrentMoodModelClass(
        "Body temperature", "assets/images/img_myreport_demo.png", false);
    CurrentMoodModelClass sliderModelbook2 = new CurrentMoodModelClass(
        "Blood Pressure", "assets/images/img_myreport_demo.png", false);
    CurrentMoodModelClass sliderModelbook3 = new CurrentMoodModelClass(
        "Pulse", "assets/images/img_myreport_demo.png", false);
    CurrentMoodModelClass sliderModelbook4 = new CurrentMoodModelClass(
        "Water Intake", "assets/images/img_myreport_demo.png", false);
    CurrentMoodModelClass sliderModelbook5 = new CurrentMoodModelClass(
        "Sleep", "assets/images/img_myreport_demo.png", false);
    CurrentMoodModelClass sliderModelbook6 = new CurrentMoodModelClass(
        "Activity", "assets/images/img_myreport_demo.png", false);

    productbook.add(sliderModelbook1);
    productbook.add(sliderModelbook2);
    productbook.add(sliderModelbook3);
    productbook.add(sliderModelbook4);
    productbook.add(sliderModelbook5);
    productbook.add(sliderModelbook6);

    return productbook;
  }

  Future<void> ViewDoctorPatientLogVitalSignsApi(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['patient_id'] = widget.subdata.patientId;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(
        Uri.parse(APIservices.doctorviewpatientlogvitalsignssurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer " + prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewDocterPatientAddVitalLogsResponse responsemain =
        await ViewDocterPatientAddVitalLogsResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);

      RecomVitals? recomVitals = responsemain.data!.recomVitals;

      for (int i = 0; i < productlist1.length; i++) {
        if (productlist1[i].title == "Body temperature") {
          if (recomVitals!.bodyTemprature.toString() == "1") {
            productlist1[i].ischeck = true;
          } else {
            productlist1[i].ischeck = false;
          }
        } else if (productlist1[i].title == "Blood Pressure") {
          if (recomVitals!.bloodPressure.toString() == "1") {
            productlist1[i].ischeck = true;
          } else {
            productlist1[i].ischeck = false;
          }
        } else if (productlist1[i].title == "Pulse") {
          if (recomVitals!.pulse.toString() == "1") {
            productlist1[i].ischeck = true;
          } else {
            productlist1[i].ischeck = false;
          }
        } else if (productlist1[i].title == "Water Intake") {
          if (recomVitals!.waterIntake.toString() == "1") {
            productlist1[i].ischeck = true;
          } else {
            productlist1[i].ischeck = false;
          }
        } else if (productlist1[i].title == "Sleep") {
          if (recomVitals!.sleep.toString() == "1") {
            productlist1[i].ischeck = true;
          } else {
            productlist1[i].ischeck = false;
          }
        } else if (productlist1[i].title == "Activity") {
          if (recomVitals!.activity.toString() == "1") {
            productlist1[i].ischeck = true;
          } else {
            productlist1[i].ischeck = false;
          }
        }
      }
      setState(() {});
    } else {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {});
    }
    return;
  }

  Future<void> AddDoctorPatientLogVitalSignsApi(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    String Body_temperature = "0";
    String Blood_Pressure = "0";
    String Pulse = "0";
    String Water_Intake = "0";
    String Sleep = "0";
    String Activity = "0";
    for (int i = 0; i < productlist1.length; i++) {
      if (productlist1[i].title == "Body temperature") {
        if (productlist1[i].ischeck) {
          Body_temperature = "1";
        } else {
          Body_temperature = "0";
        }
      } else if (productlist1[i].title == "Blood Pressure") {
        if (productlist1[i].ischeck) {
          Blood_Pressure = "1";
        } else {
          Blood_Pressure = "0";
        }
      } else if (productlist1[i].title == "Pulse") {
        if (productlist1[i].ischeck) {
          Pulse = "1";
        } else {
          Pulse = "0";
        }
      } else if (productlist1[i].title == "Water Intake") {
        if (productlist1[i].ischeck) {
          Water_Intake = "1";
        } else {
          Water_Intake = "0";
        }
      } else if (productlist1[i].title == "Sleep") {
        if (productlist1[i].ischeck) {
          Sleep = "1";
        } else {
          Sleep = "0";
        }
      } else if (productlist1[i].title == "Activity") {
        if (productlist1[i].ischeck) {
          Activity = "1";
        } else {
          Activity = "0";
        }
      }
    }
    request['patient_id'] = widget.subdata.patientId;
    request['body_temprature'] = Body_temperature;
    request['blood_pressure'] = Blood_Pressure;
    request['pulse'] = Pulse;
    request['water_intake'] = Water_Intake;
    request['sleep'] = Sleep;
    request['activity'] = Activity;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(
        Uri.parse(APIservices.doctorupdatepatientlogvitalsignssurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer " + prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewDocterPatientAddVitalLogsResponse responsemain =
        await ViewDocterPatientAddVitalLogsResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      OncallBack();
      setState(() {});
    } else {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {});
    }
    return;
  }

  OncallBack() {
    ViewDoctorPatientLogVitalSignsApi(context);
    setState(() {});
  }
}

class ProductListItem1 extends StatefulWidget {
  String imagePath;
  String title;
  bool ischeck;

  ProductListItem1(
      {required this.imagePath, required this.title, required this.ischeck});

  @override
  State<ProductListItem1> createState() => _ProductListItem1State();
}

class _ProductListItem1State extends State<ProductListItem1> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: myColors.mywhite,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Row(
          children: [
            Container(
              child: widget.ischeck == true
                  ? Image.asset(
                      "assets/images/img_fill_box_blue.png",
                      width: 18,
                      height: 18,
                    )
                  : Image.asset(
                      "assets/images/img_notfill_box_blue.png",
                      width: 18,
                      height: 18,
                    ) /*Checkbox(
                checkColor: Colors.white,
                activeColor: Color(0xff406075),
                side: BorderSide(
                  color: Color(0xff406075), //your desire colour here
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                value: this.widget.ischeck,
                onChanged: (bool? value) {
                  setState(() {
                    this.widget.ischeck = value!;
                  });
                },
              )*/
              ,
            ),
            SizedBox(width: 15),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                this.widget.title,
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  color: myColors.lightblue,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
