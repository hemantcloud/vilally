import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/activities/patient_screens/patient_add_appointment_screen.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/patient_view_appointmentmodelclass.dart';
import '../../modelclass/patientdrlistmodelclass.dart';
import 'dart:convert' as convert;

import '../../modelclass/patientviewappointmentlistmodelclass.dart';
import '../../modelclass/response/ViewPatientAppointmentResponse.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';

class Patient_Tab3 extends StatefulWidget {
  const Patient_Tab3({Key? key}) : super(key: key);

  @override
  _Patient_Tab3State createState() => _Patient_Tab3State();
}

class _Patient_Tab3State extends State<Patient_Tab3>{
  List<AppointmentMain> languagelist = <AppointmentMain>[];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this.getappointmentlist(context);
    });
    setState(() {});
  }

  Oncallback(){
    getappointmentlist(context);

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
                )),
            title: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Appointment Reminder",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: myColors.lightblue,
                  fontWeight: FontWeight.w700,

                ),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Patient_add_appointment(Oncallbacksub : Oncallback)));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Image.asset("assets/images/img_add_blue_bg.png" ,width: 24, height: 24,),
                ),
              )
            ],
          ),
          body:  Container(
            child: ListView.builder(
                itemCount: languagelist.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                    },
                    child: ProductListItem(
                      data :  languagelist[index],
                    ),
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: new BouncingScrollPhysics()),
          ),
        )
    );
  }

  Future<void> getappointmentlist(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientviewappointmenturl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewPatientAppointmentResponse responsemain =
    await ViewPatientAppointmentResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      // languagelist
      languagelist.clear();
      for(int i=0;i<responsemain.data!.appointment!.length;i++){
        Appointment appointment = responsemain.data!.appointment![i];
        int? id = appointment.id;
        String? patientId=appointment.patientId;
        String? title=appointment.title;
        String? doctorName=appointment.doctorName;
        String? note = appointment.note;
        String? time = appointment.time;
        String? createdAt = appointment.createdAt;
        String? updatedAt = appointment.updatedAt;
        Null? deletedAt = appointment.deletedAt;
        AppointmentMain parameter = AppointmentMain(id,
            patientId,
            title,
            doctorName,
            note,
            time,
            createdAt,
            updatedAt,
            deletedAt);
        languagelist.add(parameter);
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
  AppointmentMain data;


  ProductListItem({required this.data});

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Card(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(12, 15, 12,15),
          child: Row(
            children: [
              Container(
                child: Image.asset("assets/images/img_view_appoint_bg.png",width: 77,height: 70,),
              ),
             Expanded(
               flex: 1,child: Container(
                 margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(

                       child:  Text(
                         widget.data.title.toString(),
                         style: TextStyle(
                             color: myColors.lightblue,
                             fontWeight: FontWeight.w600,
                             fontSize: 15),
                       )
                       ,
                     ),
                     Container(
                       margin: EdgeInsets.fromLTRB(0,5,0,0),
                       child:  Text(
                         widget.data.note.toString(),
                         style: TextStyle(
                             color: myColors.Color_899CA8,
                             fontWeight: FontWeight.w300,
                             fontSize: 12),
                       )
                       ,
                     ),
                     Container(
                       margin: EdgeInsets.fromLTRB(0,5,0,0),
                       child:  Text(
                         widget.data.time.toString(),
                         style: TextStyle(
                             color: myColors.Color_899CA8,
                             fontWeight: FontWeight.w300,
                             fontSize: 12),
                       )
                       ,
                     ),
                   ],
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}