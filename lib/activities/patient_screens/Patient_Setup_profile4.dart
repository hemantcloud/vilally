import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/cancermodelclass.dart';
import '../../modelclass/newcancermodelclass.dart';
import '../../modelclass/response/PatientGetCancerListResponse.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'Patient_Setup_profile4_5.dart';
import 'dart:convert' as convert;

class Patient_Setup_Profile4 extends StatefulWidget {
  Patient_Setup_Profile4({Key? key,required this.stagecount,required this.cancertype,required this.cancerdate}) : super(key: key);
String stagecount="";
String cancertype="";
String cancerdate="";
  @override
  _Patient_Setup_Profile4State createState() => _Patient_Setup_Profile4State();
}

class _Patient_Setup_Profile4State extends State<Patient_Setup_Profile4> {
  List<NewCancelModelClass> languagelist = <NewCancelModelClass>[];
  bool ischeck_NewCancer = false;
  double percent = 0.0;
  @override
  void initState() {
    super.initState();

    // languagelist = getCancelDataList();
    late Timer timer;
    timer = Timer.periodic(Duration(milliseconds:1000),(_){
      setState(() {
        percent=100;
        if(percent >= 100){
          timer.cancel();
          // percent=0;
        }
      });
    });
    getcancerslist(context);
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
                languagelist.clear();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Patient_Setup_Profile4_5(
                        languagelist:languagelist,
                        stagecount:widget.stagecount,
                        cancertype:widget.cancertype,
                        cancerdate:widget.cancerdate)));
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
                      margin: EdgeInsets.fromLTRB(20,10,20,0),
                      child:/*Image.asset(
                        "assets/images/img_progress3_bg.png",
                        width: double.infinity,
                        height: 30,
                      )*/
                      LinearPercentIndicator( //leaner progress bar
                        animation: true,
                        animationDuration: 1000,
                        lineHeight: 20.0,
                        percent:percent/100,
                        /* center: Text(
                          percent.toString() + "%",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),*/
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Color(0xff0281C6),
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: Container(
                        alignment: Alignment.center,

                        child: Text(
                          "Tell us more about your medical history",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: myColors.lightblue,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Container(
                        alignment: Alignment.center,

                        child: Text(
                          "Do you have any previous or existing medical conditions?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: myColors.lightgrey4,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Container(
                        alignment: Alignment.centerLeft,

                        child: Text(
                          "What is the primary organ affected by your cancer?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: myColors.lightblue,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: languagelist.length==0?Container():ListView.builder(
                          itemCount: languagelist.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if(widget.stagecount=="0"||widget.stagecount=="1"||widget.stagecount=="2"){
                                  for(int i = 0; i < languagelist.length; i++) {
                                    if (i == index) {
                                      setState(() {
                                        languagelist[index].ischeck = true;
                                      });
                                    } else {
                                      setState(() {
                                        languagelist[i].ischeck = false;
                                      });
                                    }
                                  }
                                }
                                else{
                                  if (languagelist[index].ischeck) {
                                    setState(() {
                                      languagelist[index].ischeck = false;
                                    });
                                  } else {
                                    setState(() {
                                      languagelist[index].ischeck = true;
                                    });
                                  }
                                }
                                ProductListItem(
                                  title: languagelist[index].name.toString(),
                                  ischeck: languagelist[index].ischeck,
                                );
                              },
                              child: ProductListItem(
                                title: languagelist[index].name.toString(),
                                ischeck: languagelist[index].ischeck,
                              ),
                            );
                          },
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: new BouncingScrollPhysics()),
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
                  bool flag = false;
                  for(int i=0;i<languagelist.length;i++){
                    if(languagelist[i].ischeck==true){
                      flag = true;
                      break;
                    }
                  }
                  if(!flag){
                    UtilityHlepar().getToast("Please select primary organ affected by your cancer.");
                  }
                  else{
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Patient_Setup_Profile4_5(languagelist:languagelist,stagecount:widget.stagecount,cancertype:widget.cancertype,cancerdate:widget.cancerdate)));
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
                      "Continue",
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
    PatientGetCancerListResponse responsemain = await PatientGetCancerListResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);

      if(responsemain.data?.items?.length!=0){
        for(int i=0;i<responsemain.data!.items!.length;i++){
          NewCancelModelClass modelClass = NewCancelModelClass(
              false,
              responsemain.data!.items![i].id,
              responsemain.data!.items![i].name.toString(),
              responsemain.data!.items![i].status.toString());

          languagelist.add(modelClass);
        }
      }
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
class ProductListItem extends StatefulWidget {
  String title;
  bool ischeck;

  ProductListItem({required this.title, required this.ischeck});

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 15, 5,5),
        child: Row(
          children: [
            Container(
              child: widget.ischeck==true?Image.asset("assets/images/img_fill_box_blue.png",width: 18, height: 18,):Image.asset("assets/images/img_notfill_box_blue.png",width: 18, height: 18,),
            ),
            SizedBox(width: 15),
            Container(
              margin: EdgeInsets.fromLTRB(00, 00, 20, 0),
              child: Container(
                alignment: Alignment.topLeft,

                child: Text(
                  widget.title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: myColors.lightblue,
                      fontWeight: FontWeight.w300,
                      fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}