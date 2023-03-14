import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/doctor_modelclass/doctor_list_modelclass.dart';
import '../../modelclass/response/ViewDoctorHomeResponse.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'doctor_patient_details_screen.dart';
import 'dart:convert' as convert;


class Doctor_Tab1 extends StatefulWidget {
  const Doctor_Tab1({Key? key}) : super(key: key);

  @override
  _Doctor_Tab1State createState() => _Doctor_Tab1State();
}

class _Doctor_Tab1State extends State<Doctor_Tab1> {
  List<Items> languagelist = <Items>[];
  String currentdate="";
  String doctorname="";
  @override
  void initState() {
    super.initState();
    // languagelist = getCancelDataList();
    var now = new DateTime.now();
    var formatter = new DateFormat('dd MMM yyyy');
    currentdate = formatter.format(now);
    Future.delayed(Duration.zero, () {
      this.ViewDoctorProfileApi(context);
    });
    setState(() {
    });
  }

   @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
        data: mediaQueryData.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: myColors.screen_bg,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                           doctorname.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: myColors.lightblue,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Today, "+currentdate.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: myColors.lightblue,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  languagelist.length > 0 ?
                  Container(
                    margin: EdgeInsets.fromLTRB(0,10,0,10),
                    child: ListView.builder(
                        itemCount: languagelist.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Doctor_Patient_Details(model:languagelist[index])));
                            },
                            child: ProductListItem(
                              data: languagelist[index],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: new BouncingScrollPhysics()),
                  ) : Container()
                ],
              ),
            ),
          ),
        ));
  }
  List<DoctorListModelClass> getCancelDataList() {
    final products = <DoctorListModelClass>[
      DoctorListModelClass("Amit Kapoor", "48/M Prostrate Ca","7"),
      DoctorListModelClass("Mohit Jain", "48/M Prostrate Ca","5"),
      DoctorListModelClass("Manish Sharma", "48/M Prostrate Ca","8"),
      DoctorListModelClass("Arun verma", "48/M Prostrate Ca","7"),
      DoctorListModelClass("Shoaib Khan", "48/M Prostrate Ca","10"),
      DoctorListModelClass("Nitin Mehta", "48/M Prostrate Ca","8"),
      DoctorListModelClass("Amit Kapoor", "48/M Prostrate Ca","7"),



    ];

    return products;
  }

  Future<void> ViewDoctorProfileApi(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.doctorhomeurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewDoctorHomeResponse responsemain = await ViewDoctorHomeResponse.fromJson(jsonResponse);
    Utility.ProgressloadingDialog(context, false);
    if (jsonResponse['status'] == true) {

      doctorname =  "Welcome, "+responsemain.data!.doctor!.firstname.toString()+" "+responsemain.data!.doctor!.lastname.toString();
      for(int i=0;i<responsemain.data!.items!.length;i++){
        languagelist.add(responsemain.data!.items![i]);
      }
      setState(() {

      });
    }
    else {
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {

      });
    }
    return;
  }
}

class ProductListItem extends StatefulWidget {
 final Items data;

  ProductListItem({required this.data});

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColors.lightgrey6,
        margin: EdgeInsets.fromLTRB(0,10,0,0),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                  color: myColors.Color_D8E9F6,
                  border: Border.all(
                    color: myColors.Color_D8E9F6,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40))
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  widget.data.patientName![0],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: myColors.Color_0281C6,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 12,0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.data.patientName.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: myColors.lightblue,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.data.dob.toString()+"/"+widget.data.gender![0],
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: myColors.lightblue,
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.data.criticalityCount.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: myColors.lightblue,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Criticality Score",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: myColors.lightblue,
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}
