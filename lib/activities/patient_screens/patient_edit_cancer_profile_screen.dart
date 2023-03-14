import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/activities/patient_screens/patient_prior_medical_history_screen.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/cancermodelclass.dart';
import 'dart:convert' as convert;

import '../../modelclass/newcancermodelclass.dart';
import '../../modelclass/response/CommandResponse.dart';
import '../../modelclass/response/PatientGetCancerListResponse.dart';
import '../../modelclass/response/ViewPatientCancerProfileResponse.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';

class Patient_Edit_cancer_profile extends StatefulWidget {
  const Patient_Edit_cancer_profile({Key? key}) : super(key: key);

  @override
  _Patient_Edit_cancer_profileState createState() =>
      _Patient_Edit_cancer_profileState();
}

class _Patient_Edit_cancer_profileState extends State<Patient_Edit_cancer_profile> {
  List<String> cancer_type_list = ['Please choose cancer type'];

  List<String> cancer_newold_list = ['Please choose cancer recurred'];
  String _selectedcancer_newold = 'Please choose cancer recurred';

  List<String> cancer_stage_list = ['Please choose cancer stage'];
  String _selectedcancer_stage = 'Please choose cancer stage';

  List<String> recurrent_list = ['Please choose'];
  String _selectedrecurrent = 'Please choose';
  List<String> organs_list = ['Please choose'];
  String _selectedorgans = 'Please choose';

  late DateTime initialDate;
  DateTime? selectedDate;

  String selectedyear = "Select Year/Month";
  String selectedmedicalhistory = "";

  String stagecount = "1";
  List<String> strarray = [];
  List<NewCancelModelClass> languagelistmain = [];

  String date="";
  @override
  void initState() {
    super.initState();

    cancer_type_list.add("Adrenal Cancer");
    cancer_type_list.add("Bone Cancer");
    cancer_type_list.add("Breast Cancer");
    cancer_type_list.add("Colon Cancer");
    cancer_type_list.add("Leukimia");
    cancer_type_list.add("Lung Cancer");
    cancer_type_list.add("Pancreatic Cancer");

    cancer_newold_list.add("New Cancer");
    cancer_newold_list.add("Recurred Cancer");

    cancer_stage_list.add("Stage 1");
    cancer_stage_list.add("Stage 2");
    cancer_stage_list.add("Stage 3");
    cancer_stage_list.add("Stage 4");

    recurrent_list.add("Yes");
    recurrent_list.add("No");

    organs_list.add("Brain");
    organs_list.add("Bone");
    organs_list.add("Lung");
    organs_list.add("Liver");
    organs_list.add("Kidney");
    organs_list.add("Other");

    initialDate = DateTime.now();
    selectedDate = initialDate;

    Future.delayed(Duration.zero, () {
      this.getcancerslist(context);
    });

    setState(() {});
  }

  void update(List<NewCancelModelClass> languagelist) {
    String data = "";
    for (int i = 0; i < languagelist.length; i++) {
      if (languagelist[i].ischeck) {
        data = data + languagelist[i].getName().toString() + ", ";
      }
    }
    selectedmedicalhistory = data;
    languagelistmain.clear();
    for(int i=0;i<languagelist.length;i++){
      languagelistmain.add(languagelist[i]);
    }
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
                "Edit Cancer Profile",
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
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Text(
                            "When did you first receive your cancer diagnosis?",
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: myColors.lightblue,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        /* Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Card(
                                  color: myColors.mywhite,
                                  margin: EdgeInsets.fromLTRB(20, 10, 5, 5),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 12, 0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          icon: SvgPicture.asset(
                                            "assets/images/ic_dob_grey.svg",
                                            width: 24,
                                            height: 24,
                                          ),
                                          value: extselectedValue,
                                          items:items.map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              extselectedValue = value as String;
                                            });
                                          },
                                          hint:Text("Select Year",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                color: myColors.lightblue,
                                                fontWeight: FontWeight.w300),)
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Card(
                                  color: myColors.mywhite,
                                  margin: EdgeInsets.fromLTRB(5, 10, 30, 5),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Row(
                                      children: [
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              icon: SvgPicture.asset(
                                                "assets/images/ic_dob_grey.svg",
                                                width: 24,
                                                height: 24,
                                              ),
                                              value: extselectedValue2,
                                              items:itemsMonth.map((item) => DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style:  TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ))
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  extselectedValue2 = value as String;
                                                });
                                              },
                                              hint:Text("Select Month",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight: FontWeight.w300),)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),*/
                        InkWell(
                          onTap: () {
                            showMonthPicker(
                              context: context,
                              firstDate: DateTime(DateTime.now().year - 102, 1),
                              lastDate: DateTime(DateTime.now().year + 1, 0),
                              initialDate: selectedDate ?? initialDate,
                              locale: Locale("en"),
                            ).then((date) {
                              if (date != null) {
                                setState(() {
                                  selectedDate = date;
                                  String formattedDate =
                                      DateFormat('MMM-yyyy').format(date);
                                  print("selectedDate >>>>" + formattedDate.toString());
                                  selectedyear = formattedDate.toString();
                                });
                              }
                            });
                          },
                          child: Card(
                            color: myColors.mywhite,
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(10, 12, 10, 10),
                              child: Row(
                                children: [
                                  Text(
                                    selectedyear,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        color: myColors.lightblue,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(
                                    "assets/images/ic_dob_grey.svg",
                                    width: 24,
                                    height: 24,
                                  )
                                ],
                              ) /*DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      icon: SvgPicture.asset(
                                        "assets/images/ic_dob_grey.svg",
                                        width: 24,
                                        height: 24,
                                      ),
                                      value: extselectedValue,
                                      items:items.map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          extselectedValue = value as String;
                                        });
                                      },
                                      hint:Text("Select Year/Month",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            color: myColors.lightblue,
                                            fontWeight: FontWeight.w300),)
                                  ),
                                )*/
                              ,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Is the current cancer new or has it returned (recurred)?",
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: myColors.lightblue,
                              fontWeight: FontWeight.w600,
                            ),
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
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(12, 7, 12, 7),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    icon: SvgPicture.asset(
                                      "assets/images/ic_down_arrow_grey.svg",
                                      width: 20,
                                      height: 10,
                                    ),
                                    items: cancer_newold_list.map((String val) {
                                      return new DropdownMenuItem<String>(
                                        value: val,
                                        child: Container(
                                          child: Text(val,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontStyle: FontStyle.normal,
                                                  color: myColors.lightblue,
                                                  fontWeight: FontWeight.w300)),
                                        ),
                                      );
                                    }).toList(),
                                    value: _selectedcancer_newold,
                                    hint: Text(""),
                                    onChanged: (newVal) {
                                      _selectedcancer_newold = newVal!;
                                      if (_selectedcancer_newold == "Recurrent Cancer") {
                                        _selectedrecurrent = "No";
                                      }
                                      print("_selectedcancer_newold >>>>>" +
                                          _selectedcancer_newold);
                                      this.setState(() {});
                                    }),
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
                            "What is the stage of your cancer?",
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: myColors.lightblue,
                              fontWeight: FontWeight.w600,
                            ),
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
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(12, 7, 12, 7),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    icon: SvgPicture.asset(
                                      "assets/images/ic_down_arrow_grey.svg",
                                      width: 20,
                                      height: 10,
                                    ),
                                    items: cancer_stage_list.map((String val) {
                                      return new DropdownMenuItem<String>(
                                        value: val,
                                        child: Container(
                                          child: Text(val,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontStyle: FontStyle.normal,
                                                  color: myColors.lightblue,
                                                  fontWeight: FontWeight.w300)),
                                        ),
                                      );
                                    }).toList(),
                                    value: _selectedcancer_stage,
                                    hint: Text(""),
                                    onChanged: (newVal) {
                                      _selectedcancer_stage = newVal!;
                                      if (_selectedcancer_stage == "Please choose cancer stage") {
                                        stagecount = "1";
                                      } else {
                                        stagecount = _selectedcancer_stage.replaceAll("Stage ", "");
                                      }
                                      selectedmedicalhistory="";
                                      strarray.clear();
                                      this.setState(() {});
                                    }),
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
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Text(
                            "What is the primary organ affected by your cancer?",
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: myColors.lightblue,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Patient_Prior_Medical_History(oncallback: update, stagecount: stagecount, strarray : strarray)));
                          },
                          child: Card(
                            color: myColors.mywhite,
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(10, 12, 10, 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      selectedmedicalhistory,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.normal,
                                          color: myColors.lightblue,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    "assets/images/ic_down_arrow_grey.svg",
                                    width: 20,
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                    child: InkWell(
                      onTap: () {
                        bool flag = false;
                        for(int i=0;i<languagelistmain.length;i++){
                          if(languagelistmain[i].ischeck){
                            flag = true;
                            break;
                          }
                        }

                        if(_selectedcancer_newold=="Please choose cancer recurred"){
                          UtilityHlepar().getToast("Please select cancer recurred.");
                        }
                       else if (_selectedcancer_stage == "Please choose cancer stage") {
                          UtilityHlepar().getToast("Please select cancer stage.");
                        }
                       else if(!flag){
                          UtilityHlepar().getToast("Please select any cancer type.");
                        }
                       else{
                          PatientUpdateCancerProfile(context);
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
                            "Save",
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

  Future<void> ViewPatientCancerProfileApi(BuildContext context, List<Items>? cancerlist) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(
        Uri.parse(APIservices.patientviewcancerprofileurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer " + prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewPatientCancerProfileResponse responsemain =
        await ViewPatientCancerProfileResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      if(responsemain.data!.getpatientdetails!.firstDiagnosisMonth!=""){
        date = responsemain.data!.getpatientdetails!.firstDiagnosisMonth.toString() +
            "-" +
            responsemain.data!.getpatientdetails!.firstDiagnosisYear.toString();
        DateTime tempDate = new DateFormat("MM-yyyy").parse(date);
        String formattedDate = DateFormat('MMM-yyyy').format(tempDate);
        selectedyear = formattedDate.toString();
      }

      if (responsemain.data!.getpatientdetails!.cancerType == "New") {
        _selectedcancer_newold = "New Cancer";
      } else {
        _selectedcancer_newold = "Recurred Cancer";
      }

      stagecount = responsemain.data!.getpatientdetails!.stage.toString();
      if (responsemain.data!.getpatientdetails!.stage == "1") {
        _selectedcancer_stage = "Stage 1";
      } else if (responsemain.data!.getpatientdetails!.stage == "2") {
        _selectedcancer_stage = "Stage 2";
      } else if (responsemain.data!.getpatientdetails!.stage == "3") {
        _selectedcancer_stage = "Stage 3";
      } else if (responsemain.data!.getpatientdetails!.stage == "4") {
        _selectedcancer_stage = "Stage 4";
      }

      if(responsemain.data!.getpatientdetails!.cancer_id==""){

      }
      else{
        strarray = responsemain.data!.getpatientdetails!.cancer_id.toString().split(",");
        print("size >>>>>"+strarray.length.toString());
        selectedmedicalhistory = "";
        for (int i = 0; i < cancerlist!.length; i++) {
          bool flag = false;
          for (int j = 0; j < strarray.length; j++) {
            if (cancerlist[i].id == int.parse(strarray[j])) {
              selectedmedicalhistory = selectedmedicalhistory + cancerlist[i].name.toString() + ",";
              flag= true;
              break;
            }
          }
          if(flag==true){
            NewCancelModelClass modelClass = NewCancelModelClass(
                true,
                cancerlist![i].id,
                cancerlist[i].name.toString(),
                cancerlist[i].status.toString());
            languagelistmain.add(modelClass);
          }
          else
          {
            NewCancelModelClass modelClass = NewCancelModelClass(
                false,
                cancerlist![i].id,
                cancerlist[i].name.toString(),
                cancerlist[i].status.toString());
            languagelistmain.add(modelClass);
          }
        }
      }


      if (selectedmedicalhistory != null && selectedmedicalhistory.length > 0) {
        selectedmedicalhistory = selectedmedicalhistory.substring(0, selectedmedicalhistory.length - 1);
      }
      setState(() {});
    } else {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {});
    }
    return;
  }

  Future<void> getcancerslist(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['page'] = "1";
    request['keyword'] = "";

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.getcancerurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    PatientGetCancerListResponse responsemain =
        await PatientGetCancerListResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);

      ViewPatientCancerProfileApi(context, responsemain.data!.items);
      setState(() {});
    } else {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {});
    }

    return;
  }

  Future<void> PatientUpdateCancerProfile (BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    String cancer_id = "";
    for(int i=0;i<languagelistmain.length;i++){
      if(languagelistmain[i].ischeck==true){
        cancer_id = cancer_id+languagelistmain[i].id.toString()+",";
      }
    }
    if (cancer_id != null && cancer_id.length > 0) {
      cancer_id = cancer_id.substring(0, cancer_id.length - 1);
    }
    String first_diagnosis_year = "";
    String first_diagnosis_month = "";
    if(date!=""){
      DateTime tempDate = new DateFormat("MM-yyyy").parse(date);
      String formattedDate = DateFormat('MM-yyyy').format(tempDate);
      int idx = formattedDate.indexOf("-");
      first_diagnosis_year = formattedDate.substring(idx+1).trim();
      first_diagnosis_month = formattedDate.substring(0,idx).trim();
    }

    print("stagecount >>>>"+stagecount.toString());
    request['cancer_id'] = cancer_id;
    request['first_diagnosis_year'] = first_diagnosis_year;
    request['first_diagnosis_month'] = first_diagnosis_month;
    request['cancer_type'] = _selectedcancer_newold.replaceAll(" Cancer","");
    request['stage'] = int.parse(stagecount);


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientupdatecancerprofileurl),
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
      Future.delayed(Duration.zero, () {
        this.getcancerslist(context);
      });
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
