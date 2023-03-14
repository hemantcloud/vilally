import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';
import '../../apiserver/allurls.dart';
import '../../modelclass/response/PatientAddSetup1Response.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'Patient_Setup_profile3.dart';
import 'dart:convert' as convert;

class Patient_Setup_Profile1 extends StatefulWidget {
  String number;
  String countrycode;
   Patient_Setup_Profile1({Key? key,required this.number,required this.countrycode}) : super(key: key);

  @override
  _Patient_Setup_Profile1State createState() => _Patient_Setup_Profile1State();
}

class _Patient_Setup_Profile1State extends State<Patient_Setup_Profile1> {
    String date = "";
    String CountryName = "";
  String StateName = "";
  DateTime selectedDate = DateTime.now();


  var FirstNameController = new TextEditingController();
  var LastNameController = new TextEditingController();
  var dobController = new TextEditingController();
  var PhoneNoController = new TextEditingController();
  var CountryController = new TextEditingController();
  var StateController = new TextEditingController();
  var CityController = new TextEditingController();
  var EmerNameController = new TextEditingController();
  var EmerRelPatientController = new TextEditingController();
  var EmerPhoneNoController = new TextEditingController();
  List<String> items = [
    'Select Gender',
    'Male',
    'Female'
  ];
  int _value = 1;
  String? extselectedValue="Select Gender";
  late String countryValue;
  late String stateValue;
  late String cityValue;

  late FocusNode focusNode;
  late FocusNode focusNode2;

  String deviceid="";
  String devicetype="";
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    PhoneNoController.text = widget.number;
    EmerPhoneNoController.text = "";
    focusNode = FocusNode();
    focusNode2 = FocusNode();
    _getId();
    setState(() {

    });
  }
  @override
  void dispose() {
    focusNode.dispose();
    focusNode2.dispose();
    super.dispose();
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
              child: const Text(
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
                          margin: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                          child: const Text(
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
                            margin: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/ic_user_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                      width: 250,
                                      child: TextField(
                                        controller:FirstNameController,
                                        style: const TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: const InputDecoration.collapsed(
                                          hintText: 'Enter First  Name',
                                          fillColor: myColors.lightgrey3,
                                        ),
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        // Only numbers can be entered
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
                          margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: const Text(
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
                            margin: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/ic_user_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                      width: 250,
                                      child: TextField(
                                        controller: LastNameController,
                                        style: const TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: const InputDecoration.collapsed(
                                          hintText: 'Enter Last Name',
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
                            margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: const Text(
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
                              margin: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                              elevation: 3,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              ),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(12, 15, 23, 15),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/ic_dob_grey.svg",
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(width: 20),
                                    Container(
                                        width: 200,
                                        child: TextField(
                                          controller: dobController,
                                          enabled: false,
                                          style: const TextStyle(
                                            color: myColors.myblack,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          decoration: const InputDecoration.collapsed(
                                            hintText: 'Select Date of Birth',
                                            fillColor: myColors.lightgrey3,
                                          ),
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          // Only numbers can be entered
                                        )),
                                   const Spacer(),
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
                          margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: const Text(
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
                            margin: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/ic_gender_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 20),
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
                                                child: const Text("Select Gender"
                                                    ,style: TextStyle(
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    color: myColors.lightblue,
                                                    fontWeight: FontWeight.w300),)),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(width:230,child: const Text("Male", style: TextStyle(
                                                fontSize: 12,
                                                fontStyle: FontStyle.normal,
                                                color: myColors.lightblue,
                                                fontWeight: FontWeight.w300),)),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Container(width:230,child: const Text("Female", style: TextStyle(
                                                fontSize: 12,
                                                fontStyle: FontStyle.normal,
                                                color: myColors.lightblue,
                                                fontWeight: FontWeight.w300),)),
                                            value: 3,
                                          )
                                        ],
                                        onChanged: (int? value) {
                                          setState(() {
                                            print("value >>>>>"+value.toString());
                                            _value = value!;
                                          });
                                        },
                                        hint:const Text("Select Gender",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontStyle: FontStyle.normal,
                                              color: myColors.myblack,
                                              fontWeight: FontWeight.w300),)
                                    ),
                                  ),
                                 /* Spacer(),
                                  SvgPicture.asset(
                                    "assets/images/ic_down_arrow_grey.svg",
                                    width: 20,
                                    height: 10,
                                  )*/

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
                          margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: const Text(
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
                            margin: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/ic_telephone_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                      width: 250,
                                      child: TextField(
                                        enabled: false,
                                        focusNode: FocusNode(),
                                        enableInteractiveSelection: false,
                                        controller: PhoneNoController,
                                        style: const TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: const InputDecoration.collapsed(
                                          hintText: '',
                                          fillColor: myColors.lightgrey3,
                                        ),
                                        keyboardType: TextInputType.number,
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
                    margin: const EdgeInsets.fromLTRB(20,30,20,0),
                    child: const Text(
                      "Residence",
                      style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          color: myColors.lightblue,
                          fontWeight: FontWeight.w500),
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
                            margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: const Text(
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
                              margin: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                              elevation: 3,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              ),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/ic_location_pin_grey.svg",
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(width: 20),
                                    Container(
                                        width: 200,
                                        child: TextField(
                                          controller: CountryController,
                                          enabled: false,
                                          style: const TextStyle(
                                            color: myColors.myblack,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          decoration: const InputDecoration.collapsed(
                                            hintText: 'Select Country',
                                            fillColor: myColors.lightgrey3,
                                          ),
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          // Only numbers can be entered
                                        )),
                                    const Spacer(),
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
                 /* Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text(
                            "Select State",
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
                                        controller: StateController,
                                        enabled: false,
                                        style: TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'Select State',
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
                  ),*/
                  InkWell(
                    onTap: () {
                      showKeyboard2();
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: const Text(
                              "Select State",
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
                              margin: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                              elevation: 3,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              ),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/ic_city_grey.svg",
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(width: 20),
                                    Container(
                                        width: 250,
                                        child: TextField(
                                          controller: StateController,
                                          focusNode: focusNode2,
                                          style: const TextStyle(
                                            color: myColors.myblack,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          decoration: const InputDecoration.collapsed(
                                            hintText: 'Enter State',
                                            fillColor: myColors.lightgrey3,
                                          ),
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          // Only numbers can be entered
                                        )),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
    onTap: () {
      showKeyboard();
    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: const Text(
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
                              margin: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                              elevation: 3,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              ),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/ic_city_grey.svg",
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(width: 20),
                                    Container(
                                        width: 250,
                                        child: TextField(
                                          controller: CityController,
                                          focusNode: focusNode,
                                          style: const TextStyle(
                                            color: myColors.myblack,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          decoration: const InputDecoration.collapsed(
                                            hintText: 'Enter City/Town',
                                            fillColor: myColors.lightgrey3,
                                          ),
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          // Only numbers can be entered
                                        )),
                                    const Spacer(),

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
                    margin: const EdgeInsets.fromLTRB(20,30,20,0),
                    child: const Text(
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
                          margin: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                          child: const Text(
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
                            margin: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/ic_user_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                      width: 250,
                                      child: TextField(
                                        controller: EmerNameController,
                                        style: const TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: const InputDecoration.collapsed(
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
                          margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: const Text(
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
                            margin: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/ic_user_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                      width: 250,
                                      child: TextField(
                                        controller: EmerRelPatientController,
                                        style: const TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: const InputDecoration.collapsed(
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
                          margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: const Text(
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
                            margin: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/ic_telephone_grey.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                      width: 250,
                                      child: TextField(
                                        controller: EmerPhoneNoController,
                                        style: const TextStyle(
                                          color: myColors.myblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: const InputDecoration.collapsed(
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
                    padding:  const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                    child: InkWell(
                      onTap: () {
                        String firstname,lastname,gender,phoneno,cityname,emename,emerelpatient,emephoneno;
                        firstname =  FirstNameController.text;
                        lastname = LastNameController.text;
                        gender = items[_value-1].toString();
                        phoneno = PhoneNoController.text;
                        cityname = CityController.text;
                        emename = EmerNameController.text;
                        emerelpatient = EmerRelPatientController.text;
                        emephoneno = EmerPhoneNoController.text;
                        date = dobController.text;
                        CountryName = CountryController.text;
                        StateName = StateController.text;
                        if(firstname.isEmpty){
                          UtilityHlepar().getToast("Please enter first name.");
                        }
                        else if(firstname.length<2){
                          UtilityHlepar().getToast("First name should be 2 character.");
                        }
                        else if(lastname.isEmpty){
                          UtilityHlepar().getToast("Please enter last name.");
                        }
                        else if(lastname.length<2){
                          UtilityHlepar().getToast("Last name should be 2 character.");
                        }
                        else if(date.isEmpty){
                          UtilityHlepar().getToast("Please select Date of Birth.");
                        }
                        else if(gender.isEmpty){
                          UtilityHlepar().getToast("Please select gender.");
                        }
                        else if(phoneno.isEmpty){
                          UtilityHlepar().getToast("Please enter phone number.");
                        }
                        else if(CountryName.isEmpty){
                          UtilityHlepar().getToast("Please select country.");
                        }
                        else if(StateName.isEmpty){
                          UtilityHlepar().getToast("Please enter state name.");
                        }
                        else if(cityname.isEmpty){
                          UtilityHlepar().getToast("Please enter city name.");
                        }
                        else{
                         /* Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Patient_Setup_Profile3()));
                              // builder: (BuildContext context) => Patient_Setup_Profile2()));*/
                          PatientSetup1(context);
                        }

                      },
                      child: Container(
                        height: Mysize.height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            /* color: myColors.mythmes,*/
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/images/img_btn_bg.png"
                                ),
                                fit: BoxFit.cover
                            )),
                        child: const Center(
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

  void showKeyboard() {
    focusNode.requestFocus();
  }

  void showKeyboard2() {
    focusNode2.requestFocus();
  }

  Future<void> PatientSetup1(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};

    request['firstname'] = FirstNameController.text;
    request['lastname'] = LastNameController.text;
    request['dob'] = dobController.text;
    request['gender'] = items[_value-1].toString();
    request['country_code'] = widget.countrycode.replaceAll("+", "");
    request['phone'] = widget.number.replaceAll("+", "");
    request['country'] = CountryController.text;
    request['state'] = StateController.text;
    request['city'] = CityController.text;
    request['e_name'] = EmerNameController.text;
    request['e_rel_to_patient'] = EmerRelPatientController.text;
    request['e_phone'] = EmerPhoneNoController.text.replaceAll("+", "");
    request['device'] = devicetype;
    request['device_id'] = deviceid;
    request['fcm_token'] = prefs.getString("fcmtoken");
    request['role'] = "patient";

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientaddsetup1url),
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
      prefs.setBool("is_patient",true);
      prefs.setBool("patient_setup1",true);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Patient_Setup_Profile3()), (Route<dynamic> route) => false);
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

