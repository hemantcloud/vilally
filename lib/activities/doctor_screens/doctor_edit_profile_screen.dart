import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';
import 'package:vitally/modelclass/response/CommandResponse.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/response/ViewDoctorProfileResponse.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'dart:convert' as convert;

class Doctor_Edit_profile extends StatefulWidget {
   Doctor_Edit_profile({Key? key}) : super(key: key);

  @override
  _Doctor_Edit_profileState createState() => _Doctor_Edit_profileState();
}

class _Doctor_Edit_profileState extends State<Doctor_Edit_profile> {
  var nameController = new TextEditingController();
  var mcinoController = new TextEditingController();
  var AffiliationController = new TextEditingController();
  var phoneController = new TextEditingController();
  var emephoneController = new TextEditingController();
  var emeemailController = new TextEditingController();
  var specialityController = new TextEditingController();
  int _value = 1;
  @override
  void initState() {
    super.initState();
    FocusManager.instance.primaryFocus?.unfocus();
    nameController.text = "";
    mcinoController.text = "";
    AffiliationController.text = "";
    phoneController.text = "";
    emephoneController.text = "";
    emeemailController.text = "";
    ViewDoctorProfileApi(context);
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
                "Edit Profile",
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
                          margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text(
                            "Name",
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
                                  SvgPicture.asset(
                                    "assets/images/ic_user_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                      width: 250,
                                      child: TextField(
                                        controller: nameController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter Your Name',
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
                            "MCI Registration No.",
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
                                  SvgPicture.asset(
                                    "assets/images/ic_dr_mci_reg_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                      width: 250,
                                      child: TextField(
                                        controller: mcinoController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter MCI Registration No',
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
                            "Role",
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
                              padding: EdgeInsets.fromLTRB(12, 7, 12, 7),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/ic_user_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 20),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        icon: SvgPicture.asset(
                                          "assets/images/ic_down_arrow_grey.svg",
                                          width: 20,
                                          height: 10,
                                        ),
                                        value: _value,
                                        items: [
                                          DropdownMenuItem(
                                            child: Container(
                                                width: 230,
                                                child:
                                                    Text("Select Role")),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(
                                                width: 230,
                                                child:
                                                    Text("Physician")),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(
                                                width: 230,
                                                child:
                                                    Text("Resident")),
                                            value: 3,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(
                                                width: 230,
                                                child:
                                                Text("Specialist")),
                                            value: 4,
                                          )
                                        ],
                                        onChanged: (int? value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        },
                                        hint: Text(
                                          "Select Gender",
                                          style: TextStyle(
                                              fontSize: 15,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text(
                            "Affiliation",
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
                                  SvgPicture.asset(
                                    "assets/images/ic_dr_afflication_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                      width: 240,
                                      child: TextField(
                                        controller: AffiliationController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter Your Afflication',
                                          fillColor: myColors.lightgrey3,
                                        ),
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
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
                            "Phone",
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
                                  SvgPicture.asset(
                                    "assets/images/ic_telephone_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                      width: 250,
                                      child: TextField(
                                        controller:phoneController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: '+91-2055550145',
                                          fillColor: myColors.lightgrey3,
                                        ),
                                        keyboardType: TextInputType.number,
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
                            "Your specialty (max 30 characters)",
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
                                  Image.asset(
                                    "assets/images/img_doctor_spec.png",
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                      width: 250,
                                      child: TextField(
                                        controller: specialityController,
                                        maxLength: 30,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,

                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter your specialty',
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
                            "Emergency Number (Optional)",
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
                                  SvgPicture.asset(
                                    "assets/images/ic_telephone_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                      width: 250,
                                      child: TextField(
                                        controller: emephoneController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter emargency number',
                                          fillColor: myColors.lightgrey3,
                                        ),
                                        keyboardType: TextInputType.number,
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
                            "Email ID",
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
                                  SvgPicture.asset(
                                    "assets/images/ic_dr_email_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                      width: 230,
                                      child: TextField(
                                        controller: emeemailController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter Your Email',
                                          fillColor: myColors.lightgrey3,
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                    child: InkWell(
                      onTap: () {
                        String name = nameController.text;
                        String mcireno = mcinoController.text;
                        String affiliation =AffiliationController.text;
                        String phone = phoneController.text;
                        String specility = specialityController.text;
                        String mainrole = "";
                        if(_value==1){
                          mainrole = "Select Role";
                        }
                        else if(_value==2){
                          mainrole = "Physician";
                        }
                        else if(_value==3){
                          mainrole = "Resident";
                        }
                        else if(_value==4){
                          mainrole = "Specialist";
                        }
                        if(name.isEmpty){
                          UtilityHlepar().getToast("Please enter name.");
                        }
                        else if(mcireno.isEmpty){
                          UtilityHlepar().getToast("Please enter MCI registration no.");
                        }
                        else if(mainrole =="Select Role"){
                          UtilityHlepar().getToast("Please select role.");
                        }
                        else if(affiliation.isEmpty){
                          UtilityHlepar().getToast("Please enter affiliation.");
                        }
                        else if(phone.isEmpty){
                          UtilityHlepar().getToast("Please enter phone.");
                        }
                        else if(specility.isEmpty){
                          UtilityHlepar().getToast("Please enter specialty.");
                        }
                        else{
                          DoctorUpdateProfile(context);

                        }
                      },
                      child: Container(
                        height: Mysize.height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: AssetImage("assets/images/img_btn_bg.png"), fit: BoxFit.cover)),
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

  Future<void> ViewDoctorProfileApi(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.doctorviewprofileurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewDoctorProfileResponse responsemain = await ViewDoctorProfileResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      Doctor? data = responsemain.data!.doctor;
      nameController.text = data!.firstname.toString();
      mcinoController.text = data.regNumber.toString();
      AffiliationController.text = data.affiliation.toString();
      phoneController.text = data.phone.toString();
      emephoneController.text = data.ePhone.toString();
      emeemailController.text = data.email.toString();
      specialityController.text = data.doctor_speciality.toString();

      if(data.doctor_profile=="Select Role"){
        _value = 1;
      }
      else if(data.doctor_profile=="Physician"){
        _value = 2;
      }
      else if(data.doctor_profile=="Resident"){
        _value = 3;
      }
      else if(data.doctor_profile=="Specialist"){
        _value = 4;
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

  Future<void> DoctorUpdateProfile(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    String mainrole = "";
    if(_value==1){
      mainrole = "Select Role";
    }
    else if(_value==2){
      mainrole = "Physician";
    }
    else if(_value==3){
      mainrole = "Resident";
    }
    else if(_value==4){
      mainrole = "Specialist";
    }

    String emeemail = emeemailController.text;
    request['firstname'] = nameController.text;
    request['affiliation'] = AffiliationController.text;
    request['reg_number'] = mcinoController.text;
    request['e_phone'] = emephoneController.text;
    request['email'] = emeemail;
    request['doctor_profile'] = mainrole;
    request['doctor_speciality'] = specialityController.text;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.doctorupdateprofileurl),
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
      ViewDoctorProfileApi(context);
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
