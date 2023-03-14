import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/activities/patient_screens/patient_add_dr_screen.dart';
import 'package:vitally/activities/patient_screens/patient_doctor_details_screen.dart';
import 'package:vitally/activities/patient_screens/patient_upload_report_screen.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/patientdrlistmodelclass.dart';
import '../../utils/Utility.dart';


class Patient_AddRemoveDr extends StatefulWidget {
  const Patient_AddRemoveDr({Key? key}) : super(key: key);

  @override
  _Patient_AddRemoveDrState createState() => _Patient_AddRemoveDrState();
}

class _Patient_AddRemoveDrState extends State<Patient_AddRemoveDr>{
  List<PatientDrListModelClass> languagelist = <PatientDrListModelClass>[];
  @override
  void initState() {
    super.initState();
    languagelist = getCancelDataList();
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
           automaticallyImplyLeading: false,
            titleSpacing: 0,
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
                "Doctors Tracking your Symptoms",
                /* maxLines: 2,*/
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: myColors.lightblue,
                  fontWeight: FontWeight.w600

                ),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Patient_AddDr()));
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
                      title: languagelist[index].title,
                      status: languagelist[index].status,
                      number: languagelist[index].number,
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
  List<PatientDrListModelClass> getCancelDataList() {
    final products = <PatientDrListModelClass>[
      PatientDrListModelClass("Dr.Jhon Deo", "Process","+9152728292782"),
      PatientDrListModelClass("Dr.Jhon Deo", "Pending",""),
      PatientDrListModelClass("Dr.Jhon Deo", "Process","+9152728292782"),
      PatientDrListModelClass("Dr.Jhon Deo", "Pending",""),
      PatientDrListModelClass("Dr.Jhon Deo", "Process",""),
      PatientDrListModelClass("Dr.Jhon Deo", "Pending",""),
      PatientDrListModelClass("Dr.Jhon Deo", "Process","+9152728292782"),


    ];

    return products;
  }

}
class ProductListItem extends StatefulWidget {
  String title;
  String status;
  String number;


  ProductListItem({required this.title, required this.status,required this.number});

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                Patient_Doctor_Details()));
      },
      child:  Container(
          color: myColors.lightgrey6,
          margin: EdgeInsets.fromLTRB(0,10,0,0),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Row(
            children: [
              Container(
                child: Image.asset("assets/images/img_cart_blue.png", width: 24,height: 24,),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child:  Text(
                        widget.title,
                        style: TextStyle(
                            color: myColors.mythmes,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      child:  Text(
                        "Emergency No : "+widget.number,
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
              Container(

                 child: InkWell(
                   onTap: () {

                   },
                   child:widget.status=="Process"?
                   Container(
                     padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                     child: Center(
                       child: Text(
                         "Pending",
                         style: TextStyle(
                             color: myColors.mythmes,
                             fontSize: 10,
                             fontWeight: FontWeight.w700),
                       ),
                     ),
                   ):
                   Container(
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
                         "Remove",
                         style: TextStyle(
                             color: myColors.mywhite,
                             fontSize: 10,
                             fontWeight: FontWeight.w700),
                       ),
                     ),
                   ),
                 )
              )
            ],
          )
      ),
    );
  }
}