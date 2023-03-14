import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/response/PatientAddSetup1Response.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'doctor_dashboard_screen.dart';
import 'dart:convert' as convert;


class doctor_Setup_Profile1 extends StatefulWidget {
  String countrycode;
  String mobilenumber;

   doctor_Setup_Profile1({Key? key,required this.countrycode,required this.mobilenumber}) : super(key: key);

  @override
  _doctor_Setup_Profile1State createState() => _doctor_Setup_Profile1State();
}

class _doctor_Setup_Profile1State extends State<doctor_Setup_Profile1> {
  var nameController = new TextEditingController();
  var mcireController = new TextEditingController();
  var affiliController = new TextEditingController();
  var phoneController = new TextEditingController();
  var specialityController = new TextEditingController();
  var emephoneController = new TextEditingController();
  var emeemailController = new TextEditingController();
  int _value = 1;
  String? extselectedValue="Select Gender";
  String deviceid="";
  String devicetype="";
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneController.text = widget.mobilenumber;
    emephoneController.text = "";
    _getId();
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
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: myColors.screen_bg,
            title: Container(
              child: Text(
                "Setup  Profile",
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    color: myColors.lightblue,
                    fontWeight: FontWeight.w600),
              ),
            ),
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
                                          hintText: 'Enter Name',
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
                                        controller: mcireController,
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
                                              width:230,
                                                child: Text("Select Role")),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(width:230,child: Text("Physician")),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(width:230,child: Text("Resident")),
                                            value: 3,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(width:230,child: Text("Specialist")),
                                            value: 4,
                                          )
                                        ],
                                        onChanged: (int? value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        },
                                        hint:Text("Select Gender",
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
                                      width: 230,
                                      child: TextField(
                                        controller: affiliController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter Afflication',
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
                                        enableInteractiveSelection: false,
                                        focusNode: FocusNode(),
                                        controller: phoneController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: '',
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
                                          hintText: 'Enter emergency number',
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
                                          hintText: 'Enter Email',
                                          fillColor: myColors.lightgrey3,
                                        ),
                                        keyboardType: TextInputType.emailAddress,
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
                    padding:  EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                    child: InkWell(
                      onTap: () {
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
                        String name = nameController.text;
                        String mcire = mcireController.text;
                        String role = mainrole;
                        String affiliation = affiliController.text;
                        String phone = phoneController.text;
                        String specility = specialityController.text;
                        String emephone = emephoneController.text;
                        String emeemail = emeemailController.text;
                        if(name.isEmpty){
                          UtilityHlepar().getToast("Please enter name.");
                        }
                        else if(name.length<2){
                          UtilityHlepar().getToast("name should be 2 character.");
                        }
                        else if(mcire.isEmpty){
                          UtilityHlepar().getToast("Please enter MCI registration no.");
                        }
                        else if(role=="Select Role"){
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

                         /* Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Doctor_Dashboard()));*/

                          DoctorSetup1(context);
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
  Future<void> DoctorSetup1(BuildContext context) async {
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
    request['affiliation'] = affiliController.text;
    request['reg_number'] = mcireController.text;
    request['country_code'] = widget.countrycode;
    request['phone'] = widget.mobilenumber;
    request['e_phone'] = emephoneController.text;
    request['device'] = devicetype;
    request['device_id'] = deviceid;
    request['email'] = emeemail;
    request['fcm_token'] = prefs.getString("fcmtoken");
    request['role'] = "doctor";
    request['doctor_profile'] = mainrole;
    request['doctor_speciality'] = specialityController.text;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.doctorsetupprofileurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    PatientAddSetup1Response responsemain = await PatientAddSetup1Response.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      // UtilityHlepar().getToast(responsemain.message.toString());
      prefs.setString("token",responsemain.data!.token.toString());
      prefs.setBool("is_user_login",true);
      prefs.setBool("is_patient",false);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Doctor_Dashboard()), (Route<dynamic> route) => false);
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
  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceid=iosDeviceInfo.identifierForVendor!;
      devicetype="ios";
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceid=androidDeviceInfo.androidId!;
      devicetype="android";
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }
}

