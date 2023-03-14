import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/activities/patient_screens/patient_upload_report_screen.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/patientdrlistmodelclass.dart';
import '../../modelclass/response/CommandResponse.dart';
import '../../modelclass/response/ViewPatientProfileResponse.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'dart:convert' as convert;


class Patient_Edit_profile extends StatefulWidget {
  const Patient_Edit_profile({Key? key}) : super(key: key);

  @override
  _Patient_Edit_profileState createState() => _Patient_Edit_profileState();
}

class _Patient_Edit_profileState extends State<Patient_Edit_profile>{

  String date = "";

  DateTime selectedDate = DateTime.now();

  var firstnameController = new TextEditingController();
  var lastnameController = new TextEditingController();
  var dobController = new TextEditingController();
  var phonenoController = new TextEditingController();
  var StateController = new TextEditingController();
  var cityController = new TextEditingController();
  var CountryController = new TextEditingController();
  var EmerNameController = new TextEditingController();
  var EmerRelPatientController = new TextEditingController();
  var EmerPhoneNoController = new TextEditingController();
  List<String> items = [
    'Select Gender',
    'Male',
    'Female'
  ];
  late String countryValue;
  int _value = 1;
  String? extselectedValue="Select Gender";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstnameController.text = "";
    lastnameController.text = "";
    dobController.text = date;
    phonenoController.text = "";
    StateController.text = "";
    cityController.text = "";
    phonenoController.text = "";
    EmerPhoneNoController.text = "";

    Future.delayed(Duration.zero, () {
      this.ViewPatientProfileApi(context);
    });

    FocusManager.instance.primaryFocus?.unfocus();

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
                          margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
                          child: Text(
                            "First Name",
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
                                        controller:  firstnameController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter Your First  Name',
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
                            "Last Name",
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
                                        controller:  lastnameController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter Your Last Name',
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
                      _selectDate(context).then((value) {
                        date = value;
                        DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
                        DateFormat dateFormat2 = DateFormat("yyyy-MM-dd");
                        DateTime dateTime = dateFormat.parse(date);
                        date = dateFormat2.format(dateTime);
                        dobController.text = date;
                        setState(() {

                        });

                      });

                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: Text(
                              "Date of Birth",
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
                                      "assets/images/ic_dob_grey.svg",
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      flex: 1,child: Container(
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
                                              hintText: 'Select Date of Birth',
                                              fillColor: myColors.lightgrey3,
                                            ),
                                            keyboardType: TextInputType.text,
                                            textInputAction: TextInputAction.next,
                                            // Only numbers can be entered
                                          )),
                                    ),

                                    SvgPicture.asset(
                                      "assets/images/ic_right_arrow.svg",
                                      width: 20,
                                      height: 20,
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
                            "Gender",
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
                                    "assets/images/ic_gender_grey.svg",
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
                                            child: Flexible(
                                              flex: 1,
                                              child: Container(
                                                width:MediaQuery.of(context).size.width-120,
                                                child: Text("Select Gender",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontStyle: FontStyle.normal,
                                                      color: myColors.lightblue,
                                                      fontWeight: FontWeight.w300),),
                                              ),
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Flexible(
                                              flex: 1,
                                              child: Container(
                                                width:MediaQuery.of(context).size.width-120,
                                                child: Text("Male",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontStyle: FontStyle.normal,
                                                      color: myColors.lightblue,
                                                      fontWeight: FontWeight.w300),),
                                              ),
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Flexible(
                                              flex: 1,
                                              child: Container(
                                                width:MediaQuery.of(context).size.width-120,
                                                child: Text("Female",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontStyle: FontStyle.normal,
                                                      color: myColors.lightblue,
                                                      fontWeight: FontWeight.w300),),
                                              ),
                                            ),
                                            value: 3,
                                          )
                                        ],
                                        onChanged: (int? value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        },
                                        hint:Text("Select Gender",
                                          style: TextStyle(
                                              fontSize: 12,
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
                                        enabled: false,
                                        focusNode: FocusNode(),
                                        enableInteractiveSelection: false,
                                        controller: phonenoController,
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
                  InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                        exclude: <String>['KN', 'MF'],
                        //Optional. Shows phone code before the country name.
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          print('Select country: ${country.name}');
                          CountryController.text = country.name;
                          setState(() {});
                        },
                      );

                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: Text(
                              "Select Country",
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
                                      "assets/images/ic_location_pin_grey.svg",
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(width: 20),
                                    Container(
                                        width: 200,
                                        child: TextField(
                                          controller: CountryController,
                                          enabled: false,
                                          style: TextStyle(
                                            color: myColors.myblack,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          decoration: InputDecoration.collapsed(
                                            hintText: 'Select Country',
                                            fillColor: myColors.lightgrey3,
                                          ),
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          // Only numbers can be entered
                                        )),
                                    Spacer(),
                                    SvgPicture.asset(
                                      "assets/images/ic_down_arrow_grey.svg",
                                      width: 20,
                                      height: 10,
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
                            "State",
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
                                    "assets/images/ic_city_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                      width: 200,
                                      child: TextField(
                                        controller: StateController,
                                        // enabled: false,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter State',
                                          fillColor: myColors.lightgrey3,
                                        ),
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        // Only numbers can be entered
                                      )),
                                  Spacer(),
                                  /* SvgPicture.asset(
                                    "assets/images/ic_down_arrow_grey.svg",
                                    width: 20,
                                    height: 10,
                                  ),*/

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
                            "City/town",
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
                                    "assets/images/ic_city_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                      width: 200,
                                      child: TextField(
                                        controller: cityController,
                                        // enabled: false,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter City/Town',
                                          fillColor: myColors.lightgrey3,
                                        ),
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        // Only numbers can be entered
                                      )),
                                  Spacer(),
                                  /* SvgPicture.asset(
                                    "assets/images/ic_down_arrow_grey.svg",
                                    width: 20,
                                    height: 10,
                                  ),*/

                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20,30,20,0),
                    child: Text(
                      "Emergency Contact (Optional)",
                      style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          color: myColors.lightblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
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
                                        controller: EmerNameController,
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
                            "Relationship to patient",
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
                                        controller: EmerRelPatientController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter Relationship to patient',
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
                            "Phone Number",
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
                                        controller: EmerPhoneNoController,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Enter Phone Number',
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

                  Padding(
                    padding:  EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                    child: InkWell(
                      onTap: () {
                        String fname = firstnameController.text;
                        String lname = lastnameController.text;
                        String dob = dobController.text;
                        String gender = items[_value-1];
                        String phoneno = phonenoController.text;
                        String state = StateController.text;
                        String city = cityController.text;
                        if(fname.isEmpty){
                          UtilityHlepar().getToast("Please enter first name.");
                        }
                        else if(fname.length<2){
                          UtilityHlepar().getToast("First name should be 2 character.");
                        }
                        else if(lname.isEmpty){
                          UtilityHlepar().getToast("Please enter last name.");
                        }
                        else if(lname.length<2){
                          UtilityHlepar().getToast("Last name should be 2 character.");
                        }
                        else if(gender=="Select Gender"){
                          UtilityHlepar().getToast("Please select gender.");
                        }
                       /* else if(phoneno.isEmpty){
                          UtilityHlepar().getToast("Please enter phone number.");
                        }*/
                        else if(state.isEmpty){
                          UtilityHlepar().getToast("Please enter state.");
                        }
                        else if(city.isEmpty){
                          UtilityHlepar().getToast("Please enter city/town.");
                        }
                        else{
                          // Navigator.pop(context);
                          UpdatePatientProfileApi(context);
                        }
                        /*Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Patient_Setup_Profile2()));*/
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
        )
    );
  }
  Future<String> _selectDate(BuildContext context) async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      // lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
    return selectedDate.toString();
  }

  Future<void> ViewPatientProfileApi(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientviewprofileurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewPatientProfileResponse responsemain = await ViewPatientProfileResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);

      firstnameController.text = responsemain.data!.patient!.firstname.toString();
      lastnameController.text = responsemain.data!.patient!.lastname.toString();
      dobController.text = responsemain.data!.patient!.dob.toString();
      phonenoController.text = responsemain.data!.patient!.phone.toString();
      StateController.text = responsemain.data!.patient!.state.toString();
      cityController.text = responsemain.data!.patient!.city.toString();
      CountryController.text = responsemain.data!.patient!.country.toString();

      EmerNameController.text = responsemain.data!.patient!.e_name.toString();
      EmerPhoneNoController.text = responsemain.data!.patient!.e_phone.toString();
      EmerRelPatientController.text = responsemain.data!.patient!.e_rel_to_patient.toString();

      if(responsemain.data!.patient!.gender.toString()=="Male"){
        _value = 2;
      }
      else if(responsemain.data!.patient!.gender.toString()=="Female"){
        _value = 3;
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

  Future<void> UpdatePatientProfileApi(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};

    request['firstname'] = firstnameController.text;
    request['lastname'] = lastnameController.text;
    request['dob'] = dobController.text;
    request['gender'] = items[_value-1].toString();
    request['country'] = CountryController.text;
    request['state'] = StateController.text;
    request['city'] = cityController.text;

    request['e_name'] = EmerNameController.text;
    request['e_rel_to_patient'] = EmerRelPatientController.text;
    request['e_phone'] = EmerPhoneNoController.text;


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientupdateprofileurl),
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
      ViewPatientProfileApi(context);

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