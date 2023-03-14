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

class Patient_Prior_Medical_History extends StatefulWidget {
  Function oncallback;
  String stagecount;
  List<String> strarray;
  Patient_Prior_Medical_History({Key? key,required this.oncallback, required this.stagecount,required this.strarray}) : super(key: key);
  @override
  _Patient_Prior_Medical_HistoryState createState() => _Patient_Prior_Medical_HistoryState();
}

class _Patient_Prior_Medical_HistoryState extends State<Patient_Prior_Medical_History> {
  List<NewCancelModelClass> languagelist = <NewCancelModelClass>[];
  bool ischeck_NewCancer = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this.getcancerslist(context);
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
            title: InkWell(
              onTap: () {
                /*Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Patient_Setup_Profile4_5()));*/
              },
              child: Container(

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
                          "Select Prior Medical History",
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
                      child: ListView.builder(
                          itemCount: languagelist.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if(widget.stagecount=="1"||widget.stagecount=="2"||widget.stagecount=="3"){
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
                 Navigator.pop(context);
                 this.widget.oncallback(languagelist);
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
    PatientGetCancerListResponse responsemain =
    await PatientGetCancerListResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      if(responsemain.data?.items?.length!=0){
        for(int i=0;i<responsemain.data!.items!.length;i++){
          bool flag = false;
          for(int j=0;j<widget.strarray.length;j++){
            if (responsemain.data!.items![i].id == int.parse(widget.strarray[j])){
             flag = true;
             break;
            }
          }
          if(flag==true){
            NewCancelModelClass modelClass = NewCancelModelClass(
                true,
                responsemain.data!.items![i].id,
                responsemain.data!.items![i].name.toString(),
                responsemain.data!.items![i].status.toString());
            languagelist.add(modelClass);
          }
          else
            {
              NewCancelModelClass modelClass = NewCancelModelClass(
                  false,
                  responsemain.data!.items![i].id,
                  responsemain.data!.items![i].name.toString(),
                  responsemain.data!.items![i].status.toString());
              languagelist.add(modelClass);
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
            /*Container(
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: Color(0xff406075),
                side: BorderSide(

                  color: Color(0xff406075), //your desire colour here
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: this.widget.ischeck,
                onChanged: (bool? value) {
                  setState(() {
                    this.widget.ischeck = value!;
                  });
                },
              ),
            ),*/
            Container(
              child: widget.ischeck==true?Image.asset("assets/images/img_fill_box_blue.png",width: 18, height: 18,):Image.asset("assets/images/img_notfill_box_blue.png",width: 18, height: 18,),
              /*height: 23,
              width: 23,
              decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(4),
                // border: widget.ischeck == false ? Border.all(color: myColors.lightblue,width: 1.5) : Border.all()
        ),
              child: Container(
                decoration:BoxDecoration(
                  // color: myColors.mywhite
                ),
                child: widget.ischeck == true ?
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),

                    child: Icon(Icons.check_box_rounded,color: myColors.lightblue,size:23)) :Icon(Icons.check_box_outline_blank,color: myColors.lightblue,size:23),
              )*/
              // Checkbox(
              //   checkColor: Colors.white,
              //   activeColor: Color(0xff406075),
              //   side: BorderSide(
              //
              //     color: Color(0xff406075), //your desire colour here
              //     width: 1.5,
              //   ),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   value: widget.ischeck,
              //   onChanged: (bool? value) {
              //    /* setState(() {
              //       this.widget.ischeck = value!;
              //     });*/
              //   },
              // ),
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