import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';
import 'package:vitally/modelclass/response/CommandResponse.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/response/ViewDoctorPatientRequestListResponse.dart';
import '../../utils/Utility.dart';
import 'dart:convert' as convert;

import '../../utils/UtilityHlepar.dart';
import 'doctor_dashboard_screen.dart';


class Doctor_Tab2 extends StatefulWidget {
  final Function Oncallback;
  const Doctor_Tab2({Key? key,required this.Oncallback}) : super(key: key);

  @override
  _Doctor_Tab2State createState() => _Doctor_Tab2State();
}

class _Doctor_Tab2State extends State<Doctor_Tab2> {

  List<Myrequest> languagelist = <Myrequest>[];
  @override
  void initState() {
    super.initState();
    // languagelist = getCancelDataList();
    ViewDoctorPatientRequestlist(context);
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
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: Center(
              child: Text(
                "Patient Request",
                /* maxLines: 2,*/
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
              child: ListView.builder(
                  itemCount: languagelist.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                      },
                      child: ProductListItem(
                        data: languagelist[index]
                      ),
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: new BouncingScrollPhysics()),
            ),
          ),
        )
    );
  }
  Future<void> ViewDoctorPatientRequestlist(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.doctorviewpatientrequestlisturl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewDoctorPatientRequestListResponse responsemain = await ViewDoctorPatientRequestListResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);

      if(responsemain.data?.myrequest?.length!=0){
        for(int i=0;i<responsemain.data!.myrequest!.length;i++){
          languagelist.add(responsemain.data!.myrequest![i]);
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
  final Myrequest data;

  ProductListItem({required this.data});
  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Container(
          color: myColors.lightgrey6,
          margin: EdgeInsets.fromLTRB(0,10,0,0),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Row(
            children: [
              Container(
                child: Image.asset("assets/images/img_dr_patient_request_blue.png",
                  width: 24,height: 24,),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child:  Text(
                        widget.data.firstname.toString()+" "+widget.data.lastname.toString(),
                        style: TextStyle(
                            color: myColors.mythmes,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      child:  Text(
                        "Criticality: "+widget.data.criticality_count.toString(),
                        style: TextStyle(
                            color: myColors.mythmes,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              widget.data.status!="Pending"?Container():
              Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        showAlertDialog(context,"Are you sure you want to accept?","Accepted",widget.data.id.toString());
                        //Are you sure you want to accept?
                        //Are you sure you want to reject?
                        // AddDoctorPatientRequestAction(context, "Accepted",widget.data.id.toString());
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/img_rect_blue.png"
                                ),
                                fit: BoxFit.cover
                            )),
                        child: Center(
                          child: Text(
                            "Accept",
                            style: TextStyle(
                                color: myColors.mywhite,
                                fontSize: 10,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        showAlertDialog(context,"Are you sure you want to reject?","Rejected",widget.data.id.toString());
                        // AddDoctorPatientRequestAction(context, "Rejected",widget.data.id.toString());
                      },child: Container(
                        margin: EdgeInsets.fromLTRB(0,15,0,0),
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/img_rect_red.png"
                                ),
                                fit: BoxFit.cover
                            )),
                        child: Center(
                          child: Text(
                            "Reject",
                            style: TextStyle(
                                color: myColors.mywhite,
                                fontSize: 10,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )

            ],
          )
      ),
    );
  }

  Future<void> AddDoctorPatientRequestAction(BuildContext context,String action, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['id'] = id;
    request['status'] = action.toString();

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.doctoraddpatientrequestactionurl),
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

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          Doctor_Dashboard()),(Route<dynamic> route) => false);

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

  showAlertDialog(BuildContext context,String msg,String action,String id) {
    // set up the button
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title:  Text(msg.toString()),
      actions: [
        ElevatedButton(
            onPressed: () {
              AddDoctorPatientRequestAction(context, action,id);
            },
            child:  Text('Yes')),
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child:  Text('No'))
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

}

