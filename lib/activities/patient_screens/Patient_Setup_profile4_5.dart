import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../modelclass/newcancermodelclass.dart';
import '../../utils/UtilityHlepar.dart';
import 'Patient_Setup_profile5.dart';

class Patient_Setup_Profile4_5 extends StatefulWidget {
  Patient_Setup_Profile4_5({Key? key,required this.languagelist,required this.stagecount,required this.cancertype,required this.cancerdate}) : super(key: key);
  List<NewCancelModelClass> languagelist;
  String stagecount="";
  String cancertype="";
  String cancerdate="";

  @override
  _Patient_Setup_Profile4_5State createState() => _Patient_Setup_Profile4_5State();
}

class _Patient_Setup_Profile4_5State extends State<Patient_Setup_Profile4_5> {
  int _value = 1;
  int _value2 = 1;
  var medicinenameController = new TextEditingController();
  var medicinedosageController = new TextEditingController();

  String medicinename = "";
  String medicinedosage = "";
  String daytype = "";
  String manytimes = "";

  @override
  void initState() {
    super.initState();

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
            title: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Patient_Setup_Profile5(
                        languagelist:widget.languagelist,
                        stagecount:widget.stagecount,
                        cancertype:widget.cancertype,
                        cancerdate:widget.cancerdate,
                        medicinename:medicinename.toString(),
                        dosage:medicinedosage,
                        daytype:daytype,
                        manytimes:_value.toString()
                    )));
              },
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Skip",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      color: myColors.lightblue,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child:Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: Container(
                        alignment: Alignment.center,

                        child: Text(
                          "Please enter the medications you are currently taking",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: myColors.lightblue,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                            child: Text(
                              "Enter Medicine Name",
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
                                    /*SvgPicture.asset(
                                      "assets/images/ic_user_grey.svg",
                                      width: 24,
                                      height: 24,
                                    ),*/
                                    SizedBox(width: 10),
                                    Container(
                                        width: 250,
                                        child: TextField(
                                          controller: medicinenameController,
                                          style: TextStyle(
                                            color: myColors.myblack,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          decoration: InputDecoration.collapsed(
                                            hintText: '',
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
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Text(
                              "Dosage (mg)",
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
                                    /*SvgPicture.asset(
                                      "assets/images/ic_user_grey.svg",
                                      width: 24,
                                      height: 24,
                                    ),*/
                                    SizedBox(width: 10),
                                    Container(
                                        width: 250,
                                        child: TextField(
                                          controller: medicinedosageController,
                                          style: TextStyle(
                                            color: myColors.myblack,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          decoration: InputDecoration.collapsed(
                                            hintText: '',
                                            fillColor: myColors.lightgrey3,
                                          ),
                                          keyboardType: TextInputType.text,
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
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Text(
                              "Daily/weekly/Monthly",
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
                                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                child: Row(
                                  children: [
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          icon: SvgPicture.asset(
                                            "assets/images/ic_down_arrow_grey.svg",
                                            width: 20,
                                            height: 10,
                                          ),
                                          value: _value2,
                                          items: [
                                            DropdownMenuItem(
                                              child: Container(
                                                width: 270,
                                                child: Text("Daily",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontStyle: FontStyle.normal,
                                                      color: myColors.lightblue,
                                                      fontWeight: FontWeight.w300),),
                                              ),
                                              value: 1,
                                            ),
                                            DropdownMenuItem(
                                              child: Container(
                                                width: 270,
                                                child: Text("Weekly",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontStyle: FontStyle.normal,
                                                      color: myColors.lightblue,
                                                      fontWeight: FontWeight.w300),),
                                              ),
                                              value: 2,
                                            ),
                                            DropdownMenuItem(
                                              child: Container(
                                                width: 270,
                                                child: Text("Monthly",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontStyle: FontStyle.normal,
                                                      color: myColors.lightblue,
                                                      fontWeight: FontWeight.w300),),
                                              ),
                                              value: 3,
                                            )
                                          ],
                                          onChanged: (int? value) {
                                            setState(() {
                                              _value2 = value!;
                                              print("_value2 >>>"+_value2.toString());
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
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Text(
                              "How many Times ",
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
                                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                child: Row(
                                  children: [
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
                                                width: 270,
                                                child: Text("1",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontStyle: FontStyle.normal,
                                                      color: myColors.lightblue,
                                                      fontWeight: FontWeight.w300),),
                                              ),
                                              value: 1,
                                            ),
                                            DropdownMenuItem(
                                              child: Container(
                                                width: 270,
                                                child: Text("2",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontStyle: FontStyle.normal,
                                                      color: myColors.lightblue,
                                                      fontWeight: FontWeight.w300),),
                                              ),
                                              value: 2,
                                            ),
                                            DropdownMenuItem(
                                              child: Container(
                                                width: 270,
                                                child: Text("3",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontStyle: FontStyle.normal,
                                                      color: myColors.lightblue,
                                                      fontWeight: FontWeight.w300),),
                                              ),
                                              value: 3,
                                            ),
                                            DropdownMenuItem(
                                              child: Container(
                                                width: 270,
                                                child: Text("4",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontStyle: FontStyle.normal,
                                                      color: myColors.lightblue,
                                                      fontWeight: FontWeight.w300),),
                                              ),
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
                                                fontSize: 12,
                                                fontStyle: FontStyle.normal,
                                                color: myColors.lightblue,
                                                fontWeight: FontWeight.w300),)
                                      ),
                                    ),
                                    /*Spacer(),
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
                  ],
                )
            ),
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Padding(
              padding:  EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  String medicinename = medicinenameController.text;
                  String medicinedosage = medicinedosageController.text;
                  if(medicinename.isEmpty){
                    UtilityHlepar().getToast("Please enter medicine name.");
                  }
                  else if(medicinedosage.isEmpty){
                    UtilityHlepar().getToast("Please enter medicine dosage.");
                  }
                  else{

                    if(_value2==1){
                     daytype = "Daily";
                    }
                    else if(_value2==2){
                      daytype = "Weekly";
                    }
                    else{
                      daytype = "Monthly";
                    }

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Patient_Setup_Profile5(
                          languagelist:widget.languagelist,
                          stagecount:widget.stagecount,
                          cancertype:widget.cancertype,
                          cancerdate:widget.cancerdate,
                        medicinename:medicinename.toString(),
                          dosage:medicinedosage,
                          daytype:daytype,
                          manytimes:_value.toString()

                      )));
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
                      "Add",
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
}