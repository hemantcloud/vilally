import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../utils/UtilityHlepar.dart';


class Patient_UploadReport extends StatefulWidget {
  const Patient_UploadReport({Key? key}) : super(key: key);

  @override
  _Patient_UploadReportState createState() => _Patient_UploadReportState();
}

class _Patient_UploadReportState extends State<Patient_UploadReport>{
 var reportnameController = new TextEditingController();
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
            title: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Upload Report",
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
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                        color: myColors.lightgrey6,
                         margin: EdgeInsets.fromLTRB(20,20,20,0),
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        child: Center(
                          child:Column(
                            children: [
                              SvgPicture.asset(
                                "assets/images/ic_upload_bg.svg",
                                color: myColors.mythmes,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 30,0, 0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Upload Report",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.normal,
                                    color: myColors.lightblue,
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),
                              )
                            ],
                          ),
                        )
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
                            "Enter Report Name",
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
                            elevation: 2,
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
                                  SizedBox(width: 20),
                                  Container(
                                      width: 240,
                                      child: TextField(
                                        controller: reportnameController,
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
                        ),

                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      "Note :  30 MB storage available",
                      style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          color: myColors.lightblue,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                    child: InkWell(
                      onTap: () {
                        String report_name = reportnameController.text;
                        if(report_name.isEmpty){
                          UtilityHlepar().getToast("Please enter report name.");
                        }
                        else {
                          Navigator.pop(context);
                        }

                        /*Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Patient_Setup_Profile1()));*/
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
                            "Upload",
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
}
