import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/activities/patient_screens/patient_add_remove_doctors_screen.dart';
import 'package:vitally/activities/patient_screens/patient_edit_cancer_profile_screen.dart';
import 'package:vitally/activities/patient_screens/patient_edit_profile_screen.dart';
import 'package:vitally/activities/patient_screens/patient_myreport_screen.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/response/CommandResponse.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import '../choose_profile_screen.dart';
import '../privacy_policy_screen.dart';
import '../terms_condition_screen.dart';
import 'dart:convert' as convert;

class Patient_Tab4 extends StatefulWidget {
  const Patient_Tab4({Key? key}) : super(key: key);

  @override
  _Patient_Tab4State createState() => _Patient_Tab4State();
}

class _Patient_Tab4State extends State<Patient_Tab4> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    var Mysize = MediaQuery
        .of(context)
        .size;
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
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Profile",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: myColors.lightblue,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Patient_Edit_profile()));
                    },
                    child: Container(
                        color: myColors.lightgrey6,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Container(
                          child: Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/img_edit_profile_blue.png",
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 20),
                                Container(
                                    width: 200,
                                    child: Text("Edit Profile",
                                      style: TextStyle(
                                        color: myColors.myblack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      // Only numbers can be entered
                                    )),
                                Spacer(),
                                Image.asset(
                                  "assets/images/img_right_arrow_blue2.png",
                                  width: 24,
                                  height: 24,
                                ),

                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  InkWell(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Patient_Edit_cancer_profile()));
                    },
                    child: Container(
                        color: myColors.lightgrey6,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          child: Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/img_edit_cancer_blue.png",
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 20),
                                Container(
                                    width: 200,
                                    child: Text("Edit Cancer Profile",
                                      style: TextStyle(
                                        color: myColors.myblack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      // Only numbers can be entered
                                    )),
                                Spacer(),
                                Image.asset(
                                  "assets/images/img_right_arrow_blue2.png",
                                  width: 24,
                                  height: 24,
                                ),

                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Patient_AddRemoveDr()));
                    },
                    child: Container(
                        color: myColors.lightgrey6,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          child: Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/img_dr_blue.png",
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 20),
                                Container(
                                    width: 200,
                                    child: Text("Add/Remove Doctors",
                                      style: TextStyle(
                                        color: myColors.myblack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      // Only numbers can be entered
                                    )),
                                Spacer(),
                                Image.asset(
                                  "assets/images/img_right_arrow_blue2.png",
                                  width: 24,
                                  height: 24,
                                ),

                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Patient_MyReport()));
                    },
                    child: Container(
                        color: myColors.lightgrey6,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          child: Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/img_myreport_blue.png",
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 20),
                                Container(
                                    width: 200,
                                    child: Text("My Reports",
                                      style: TextStyle(
                                        color: myColors.myblack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      // Only numbers can be entered
                                    )),
                                Spacer(),
                                Image.asset(
                                  "assets/images/img_right_arrow_blue2.png",
                                  width: 24,
                                  height: 24,
                                ),

                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              TermsAndCondition()));
                    },
                    child: Container(
                        color: myColors.lightgrey6,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          child: Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/img_terms_blue.png",
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 20),
                                Container(
                                    width: 200,
                                    child: Text("Terms & Conditions",
                                      style: TextStyle(
                                        color: myColors.myblack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      // Only numbers can be entered
                                    )),
                                Spacer(),
                                Image.asset(
                                  "assets/images/img_right_arrow_blue2.png",
                                  width: 24,
                                  height: 24,
                                ),

                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Privacy_Policy()));
                    },
                    child: Container(
                        color: myColors.lightgrey6,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          child: Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/img_privacy_blue.png",
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 20),
                                Container(
                                    width: 200,
                                    child: Text("Privacy Policies",
                                      style: TextStyle(
                                        color: myColors.myblack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      // Only numbers can be entered
                                    )),
                                Spacer(),
                                Image.asset(
                                  "assets/images/img_right_arrow_blue2.png",
                                  width: 24,
                                  height: 24,
                                ),

                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Container(
                        color: myColors.lightgrey6,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          child: Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/img_logout_blue.png",
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 20),
                                Container(
                                    width: 200,
                                    child: Text("Logout",
                                      style: TextStyle(
                                        color: myColors.myblack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      // Only numbers can be entered
                                    )),

                              ],
                            ),
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure , You want to logout ?'),
      actions: [
        ElevatedButton(
            onPressed: () {
             /* Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  Choose_profile()), (Route<dynamic> route) => false);*/
              accountlogout(context);

            },
            child:  Text('Yes')),
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('No'))
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  Future<void> accountlogout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientaccountlogouturl),
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
      prefs.setString("token","");
      prefs.setBool("is_user_login",false);
      prefs.setBool("is_patient",false);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          Choose_profile()), (Route<dynamic> route) => false);
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