import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';
import 'package:vitally/modelclass/patientviewmedicinelist.dart';
import 'package:vitally/modelclass/patientviewmedicinelist.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/languagemodelclass.dart';
import '../../modelclass/languagemodelclass2.dart';
import '../../modelclass/patientviewmedicinelist.dart';
import '../../modelclass/patientviewmedicinelist.dart';
import '../../modelclass/patientviewmedicinelist.dart';
import '../../modelclass/response/CommandResponse.dart';
import '../../modelclass/response/ViewPatientMedicineListResponse.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'dart:convert' as convert;


class Patient_track_medication_intake extends StatefulWidget {
  final Function Oncallbacksub;
   Patient_track_medication_intake({Key? key,required this.Oncallbacksub}) : super(key: key);

  @override
  _Patient_track_medication_intakeState createState() => _Patient_track_medication_intakeState();

}

class _Patient_track_medication_intakeState extends State<Patient_track_medication_intake>{

  List<PatientViewMedicineList> products = <PatientViewMedicineList>[];
  List<PatientViewMedicineList> products2 = <PatientViewMedicineList>[];

  @override
  void initState() {
    super.initState();
    ViewPatientMedicationApi(context);
  }
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    var Mysize = MediaQuery.of(context).size;
    return MediaQuery(
        data: mediaQueryData.copyWith(textScaleFactor: 1.0),
        child: WillPopScope(
          onWillPop: () => _willPopCallback(),
          child: Scaffold(
            backgroundColor: myColors.screen_bg,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: myColors.screen_bg,
              leading:  ElevatedButton(
                  onPressed: () {
                    widget.Oncallbacksub();
                    Navigator.of(context).pop(false);
                  },
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
                  "Track Medication Intake",
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
                InkWell(
                  onTap: () {
                   /* Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Patient_UploadReport()));*/
                    showCustomDialog(context);
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Image.asset("assets/images/img_add_blue_bg.png" ,width: 24, height: 24,),
                  ),
                )
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    products.length==0?Container():Container(
                      margin: EdgeInsets.fromLTRB(20,20,20,0),
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      color: myColors.mythmes,
                      alignment: Alignment.center,
                      child: Text(
                        "Priscribed by your doctor",
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          color: myColors.mywhite,
                          fontWeight: FontWeight.w500,

                        ),
                      ),
                    ),
                    products.length==0?Container():Container(
                        margin: EdgeInsets.fromLTRB(20, 00, 20, 00),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: myColors.Color_D8E9F6_2,
                          ),
                          color: myColors.Color_D8E9F6_2,

                          borderRadius: BorderRadius.only(topLeft: Radius.zero,topRight: Radius.zero,bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),

                        ),
                        child: ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    ProductListItem(
                                      data : products[index],
                                      title: products[index].title,
                                      productsListmain : products[index].productslist,
                                      onupdate: OncallBack,
                                    );
                                  });
                                },
                                child: ProductListItem(
                                  data : products[index],
                                  title: products[index].title,
                                  productsListmain : products[index].productslist,
                                  onupdate: OncallBack,
                                ),
                              );
                            },
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: new BouncingScrollPhysics())
                    ),
                    products2.length==0?Container():Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 00),
                        child: ListView.builder(
                            itemCount: products2.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    ProductListItem2(
                                      data : products2[index],
                                      title: products2[index].title,
                                      productsListmain : products2[index].productslist,
                                      onupdate: OncallBack,
                                    );
                                  });
                                },
                                child: ProductListItem2(
                                  data : products2[index],
                                  title: products2[index].title,
                                  productsListmain : products2[index].productslist,
                                  onupdate: OncallBack,
                                ),
                              );
                            },
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: new BouncingScrollPhysics())
                    ),

                  ],
                ),

              ),

            ),


          ),
        )
    );

  }

  Future<void> ViewPatientMedicationApi(BuildContext context) async {
    products2.clear();
    products.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientviewmedicationurl),
        body: convert.jsonEncode(request),

        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewPatientMedicineListResponse responsemain = await ViewPatientMedicineListResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);

      //medicine_name+dosage+"mg"+times+duration
      for(int i=0;i<responsemain.data!.patientMedication!.length;i++){

        if(responsemain.data!.patientMedication![i].addedBy=="doctor"){
          PatientMedication medicationdata = responsemain.data!.patientMedication![i];
          String title = medicationdata.medicineName.toString()+" "+medicationdata.dosage.toString()+"mg ";
          if(medicationdata.times=="1"){
            if(medicationdata.duration=="Daily"){
              title = title+"Once a day";
            }
            else if(medicationdata.duration=="Weekly"){
              title = title+"Once a week";
            }
            else if(medicationdata.duration=="Monthly"){
              title = title+"Once a month";
            }
          }
          else if(medicationdata.times=="2"){
            if(medicationdata.duration=="Daily"){
              title = title+"Twice a day";
            }
            else if(medicationdata.duration=="Weekly"){
              title = title+"Twice a week";
            }
            else if(medicationdata.duration=="Monthly"){
              title = title+"Twice a month";
            }
          }
          else if(medicationdata.times=="3"){
            if(medicationdata.duration=="Daily"){
              title = title+"Three times in a day";
            }
            else if(medicationdata.duration=="Weekly"){
              title = title+"Three times in a week";
            }
            else if(medicationdata.duration=="Monthly"){
              title = title+"Three times in a month";
            }
          }
          else if(medicationdata.times=="4"){
            if(medicationdata.duration=="Daily"){
              title = title+"Four times in a day";
            }
            else if(medicationdata.duration=="Weekly"){
              title = title+"Four times in a week";
            }
            else if(medicationdata.duration=="Monthly"){
              title = title+"Four times in a month";
            }
          }

          List<PatientMedicationDose> productslist = [];
          for(int j=0;j<medicationdata.patientMedicationDose!.length;j++){
            productslist.add(medicationdata.patientMedicationDose![j]);
          }

          PatientViewMedicineList parameter = PatientViewMedicineList(title,productslist,medicationdata);
          products.add(parameter);
        }
        else{
          PatientMedication medicationdata = responsemain.data!.patientMedication![i];
          String title = medicationdata.medicineName.toString()+" "+medicationdata.dosage.toString()+"mg ";
          if(medicationdata.times=="1"){
            if(medicationdata.duration=="Daily"){
              title = title+"Once a day";
            }
            else if(medicationdata.duration=="Weekly"){
              title = title+"Once a week";
            }
            else if(medicationdata.duration=="Monthly"){
              title = title+"Once a month";
            }
          }
          else if(medicationdata.times=="2"){
            if(medicationdata.duration=="Daily"){
              title = title+"Twice a day";
            }
            else if(medicationdata.duration=="Weekly"){
              title = title+"Twice a week";
            }
            else if(medicationdata.duration=="Monthly"){
              title = title+"Twice a month";
            }
          }
          else if(medicationdata.times=="3"){
            if(medicationdata.duration=="Daily"){
              title = title+"Three times in a day";
            }
            else if(medicationdata.duration=="Weekly"){
              title = title+"Three times in a week";
            }
            else if(medicationdata.duration=="Monthly"){
              title = title+"Three times in a month";
            }
          }
          else if(medicationdata.times=="4"){
            if(medicationdata.duration=="Daily"){
              title = title+"Four times in a day";
            }
            else if(medicationdata.duration=="Weekly"){
              title = title+"Four times in a week";
            }
            else if(medicationdata.duration=="Monthly"){
              title = title+"Four times in a month";
            }
          }

          List<PatientMedicationDose> productslist = [];
          for(int j=0;j<medicationdata.patientMedicationDose!.length;j++){
            productslist.add(medicationdata.patientMedicationDose![j]);
          }

          PatientViewMedicineList parameter = PatientViewMedicineList(title,productslist,medicationdata);
          products2.add(parameter);
        }

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

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Center(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: myColors.mywhite.withOpacity(0.01),
                ),
                height: MediaQuery.of(context).size.height,
                child: popup(OncallBack : OncallBack)),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        }
        else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  OncallBack(){
    ViewPatientMedicationApi(context);
    setState(() {

    });
  }

  Future<bool> _willPopCallback() async {
    this.widget.Oncallbacksub();
    Navigator.pop(this.context);
    return true; // return true if the route to be popped
  }
}

class ProductListItem extends StatefulWidget {
  String title;
  List<PatientMedicationDose> productsListmain;
  PatientViewMedicineList data;
  final Function onupdate;

  ProductListItem({required this.data,required this.title,required this.productsListmain,required this.onupdate});

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 15, 12,15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    widget.title.toString(),
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      color: myColors.lightblue,
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Tap & select when taken",
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      color: myColors.lightblue,
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ),
                widget.productsListmain.length==0? Container():
                Container(height: 50,
                    margin: EdgeInsets.fromLTRB(20, 00, 20, 00),
                    child: ListView.builder(
                        itemCount: widget.productsListmain.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                              });
                            },
                            child:  ProductListItem3(
                                ischeck: widget.productsListmain[index],
                                subdata:widget.data,
                                subindex :index
                            ),
                          );
                        },
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: new BouncingScrollPhysics())
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProductListItem2 extends StatefulWidget {

  String title;
  List<PatientMedicationDose> productsListmain;
  PatientViewMedicineList data;
  final Function onupdate;

  ProductListItem2({ required this.data,required this.title,required this.productsListmain,required this.onupdate});

  @override
  State<ProductListItem2> createState() => _ProductListItem2State();
}

class _ProductListItem2State extends State<ProductListItem2> {
  @override
  Widget build(BuildContext context) {
    var Mysize = MediaQuery.of(context).size;
    return  Card(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 10, 12,10),
        child: Container(
          child:Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: PopupMenuButton(
                  padding: EdgeInsets.zero,
                  icon: Image.asset("assets/images/img_3dot_blue.png",width: 10,height: 20,),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit', style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          color: myColors.lightblue,
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete', style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          color: myColors.lightblue,
                          fontWeight: FontWeight.w600,
                        ),),
                      )
                    ];
                  },
                  onSelected: (String value){
                    if(value=="edit"){
                      showCustomDialogUpate(context,widget.data,widget.onupdate);
                    }
                    else if(value=="delete"){
                      showAlertDialog(context,widget.data,widget.onupdate);
                    }
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      widget.title.toString(),
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        color: myColors.lightblue,
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Tap & select when taken",
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        color: myColors.lightblue,
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                  ),
                  widget.productsListmain.length==0? Container():
                  Container(height: 50,
                      margin: EdgeInsets.fromLTRB(20, 00, 20, 00),
                      child: ListView.builder(
                          itemCount: widget.productsListmain.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                 /* bool ischecksub = false;
                                  if(widget.productsListmain[index]){
                                    ischecksub = false;
                                    for(int i=0;i<widget.productsListmain.length;i++){
                                      widget.productsListmain[i]=false;
                                    }
                                  }
                                  else{
                                    ischecksub = true;
                                    for(int i=0;i<widget.productsListmain.length;i++){
                                      widget.productsListmain[i]=false;
                                    }
                                    widget.productsListmain[index]=true;
                                  }
                                  ProductListItem3(
                                    ischeck: widget.productsListmain[index],
                                  );*/
                                });
                              },
                              child:  ProductListItem3(
                                ischeck: widget.productsListmain[index],
                                subdata:widget.data,
                                subindex :index
                              ),
                            );
                          },
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: new BouncingScrollPhysics())
                  ),
                ],
              ),
            ],
          )
        ),
      ),
    ) ;
  }

  void showCustomDialogUpate(BuildContext context,PatientViewMedicineList data,final Function onupdate) {

    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Center(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  //  color: myColors.lightblue2
                  color: myColors.mywhite.withOpacity(0.01),
                ),
                height: MediaQuery.of(context).size.height,
                child: popupUpdate(data:data,oncallback: onupdate,)),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  showAlertDialog(BuildContext context,PatientViewMedicineList data,final Function onupdate) {
    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure , You want to delete ?'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              PatientDeleteMedicationApi(context,data.parameter.id.toString(),onupdate);
            },
            child: const Text('Yes')),
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No'))
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

  Future<void> PatientDeleteMedicationApi(BuildContext context,String medicineid,final Function onupdate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['id'] = medicineid;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientdeletemedicationurl),
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
      // Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());

      this.widget.onupdate();
      setState(() {

      });
    }
    else {
      // Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {

      });
    }
    return;
  }

}

class popup extends StatefulWidget {
  Function OncallBack;
   popup({Key? key,required this.OncallBack}) : super(key: key);

  @override
  State<popup> createState() => _popupState();
}

class _popupState extends State<popup> {
  int _value = 1;
  int _value2 = 1;
  var medicinenameContoraller = new TextEditingController();
  var medicinedosageContoraller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.05),
      body: Center(
        child: Container(
          height: 600,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,child: Center(
                          child: Text(
                            "Add Medication",
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              color: myColors.lightblue,
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                        ),
                      ),
                      InkWell(onTap: (){
                        Navigator.pop(context);
                      },child: Image.asset("assets/images/img_cross_red.png",width: 24,height: 24,))
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
                                    width: 200,
                                    child: TextField(
                                      controller: medicinenameContoraller,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
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
                                    width: 200,
                                    child: TextField(
                                      controller: medicinedosageContoraller,
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
                                            width: 200,
                                            child: Text("Daily",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  color: myColors.lightblue,
                                                  fontWeight: FontWeight.w300),),
                                          ),
                                          value: 1,
                                        ),
                                        DropdownMenuItem(
                                          child: Container(
                                            width: 200,
                                            child: Text("Weekly",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  color: myColors.lightblue,
                                                  fontWeight: FontWeight.w300),),
                                          ),
                                          value: 2,
                                        ),
                                        DropdownMenuItem(
                                          child: Container(
                                            width: 200,
                                            child: Text("Monthly",
                                              style: TextStyle(
                                                  fontSize: 15,
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
                                          print("_value2 >>>>"+_value2.toString());
                                        });
                                      },
                                      hint:Text("Select Gender",
                                        style: TextStyle(
                                            fontSize: 15,
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
                                            width: 200,
                                            child: Text("1",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  color: myColors.lightblue,
                                                  fontWeight: FontWeight.w300),),
                                          ),
                                          value: 1,
                                        ),
                                        DropdownMenuItem(
                                          child: Container(
                                            width: 200,
                                            child: Text("2",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  color: myColors.lightblue,
                                                  fontWeight: FontWeight.w300),),
                                          ),
                                          value: 2,
                                        ),
                                        DropdownMenuItem(
                                          child: Container(
                                            width: 200,
                                            child: Text("3",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  color: myColors.lightblue,
                                                  fontWeight: FontWeight.w300),),
                                          ),
                                          value: 3,
                                        ),
                                        DropdownMenuItem(
                                          child: Container(
                                            width: 200,
                                            child: Text("4",
                                              style: TextStyle(
                                                  fontSize: 15,
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
                                          print("_value >>>>"+_value.toString());
                                        });
                                      },
                                      hint:Text("Select Gender",
                                        style: TextStyle(
                                            fontSize: 15,
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
                InkWell(
                  onTap: (){
                    String medicinename = medicinenameContoraller.text;
                    String medicinedosage = medicinedosageContoraller.text;
                    if(medicinename.isEmpty){
                      UtilityHlepar().getToast("Please enter medicine name.");
                    }
                    else if(medicinedosage.isEmpty){
                      UtilityHlepar().getToast("Please enter medicine dosage.");
                    }
                    else{
                      String daytype = "";
                      if(_value2==1){
                        daytype = "Daily";
                      }
                      else if(_value2==2){
                        daytype = "Weekly";
                      }
                      else if(_value2==3){
                        daytype = "Monthly";
                      }
                      Navigator.pop(context);
                      PatientAddMedicationApi(context,medicinename,medicinedosage,daytype,_value);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: myColors.mythmes,),
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
              ],
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
  Future<void> PatientAddMedicationApi(BuildContext context,String medicinename,String medicinedosage,String daytype, int _value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['medicine_name'] = medicinename;
    request['dosage'] = medicinedosage;
    request['duration'] = daytype;
    request['how_many_times'] = _value.toString();


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientaddmedicationurl),
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
      // Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      this.widget.OncallBack();
      setState(() {

      });
    }
    else {
      // Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {

      });
    }
    return;
  }
}

class ProductListItem3 extends StatefulWidget {
  int subindex;
  PatientMedicationDose ischeck;
  PatientViewMedicineList subdata;
  ProductListItem3({ required this.ischeck,required this.subdata,required this.subindex});

  @override
  State<ProductListItem3> createState() => _ProductListItem3State();
}

class _ProductListItem3State extends State<ProductListItem3> {
  bool check = false;
  @override
  void initState() {
    super.initState();
    if(widget.ischeck.status==0){
      check = false;
    }
    else{
      check = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Container(
          child:Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                    value: check,
                    onChanged: (bool? value) {
                      setState(() {
                        if(value==true){
                          widget.ischeck.status = 1;
                          check = true;
                          widget.subdata.productslist[widget.subindex].status = 1;
                        }
                        else{
                          widget.ischeck.status = 0;
                          check = false;
                          widget.subdata.productslist[widget.subindex].status = 0;
                        }
                        UpdatePatientMedicationFeelingApi(context);
                      });
                    },
                  ),
                ),
                ],
              ),
            ],
          )
      ),
    ) ;
  }
  Future<void> UpdatePatientMedicationFeelingApi(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['medication_daily'] = widget.subdata.productslist;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientupdatemedicinefeelingurl),
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

      // this.widget.onupdate();
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

class popupUpdate extends StatefulWidget {
  PatientViewMedicineList data;
  final Function oncallback;
   popupUpdate({Key? key,required this.data,required this.oncallback}) : super(key: key);

  @override
  State<popupUpdate> createState() => _popupUpdateState();
}

class _popupUpdateState extends State<popupUpdate> {
  int _value = 1;
  int _value2 = 1;

  var medicinenameContoraller = new TextEditingController();
  var medicinedosageContoraller = new TextEditingController();
  @override
  void initState() {
    super.initState();
    medicinenameContoraller.text = widget.data.parameter.medicineName.toString();
    medicinedosageContoraller.text = widget.data.parameter.dosage.toString();
    if(widget.data.parameter.duration=="Daily"){
      _value2 = 1;
    }
    else if(widget.data.parameter.duration=="Weekly"){
      _value2 = 2;
    }
    else if(widget.data.parameter.duration=="Monthly"){
      _value2 = 3;
    }

    _value = int.parse(widget.data.parameter.times.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.05),
      body: Center(
        child: Container(
          height: 600,
          child:SingleChildScrollView(
            child:Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,child: Center(
                        child: Text(
                          "Update Medication",
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            color: myColors.lightblue,
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                      ),
                      ),
                      InkWell(onTap: (){
                        Navigator.pop(context);
                      },child: Image.asset("assets/images/img_cross_red.png",width: 24,height: 24,))
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
                                    width: 200,
                                    child: TextField(
                                      controller: medicinenameContoraller,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
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
                                    width: 200,
                                    child: TextField(
                                      controller: medicinedosageContoraller,
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
                                      iconSize: 0.0,
                                      value: _value2,
                                      items: [
                                        DropdownMenuItem(
                                          child: Container(
                                            width: 200,
                                            child: Text("Daily",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  color: myColors.lightblue,
                                                  fontWeight: FontWeight.w300),),
                                          ),
                                          value: 1,
                                        ),
                                        DropdownMenuItem(
                                          child: Container(
                                            width: 200,
                                            child: Text("Weekly",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  color: myColors.lightblue,
                                                  fontWeight: FontWeight.w300),),
                                          ),
                                          value: 2,
                                        ),
                                        DropdownMenuItem(
                                          child: Container(
                                            width: 200,
                                            child: Text("Monthly",
                                              style: TextStyle(
                                                  fontSize: 15,
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
                                        });
                                      },
                                      hint:Text("Select Gender",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            color: myColors.lightblue,
                                            fontWeight: FontWeight.w300),)
                                  ),
                                ),

                                Spacer(),
                                SvgPicture.asset(
                                  "assets/images/ic_down_arrow_grey.svg",
                                  width: 20,
                                  height: 10,
                                )

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
                                      iconSize: 0.0,
                                      value: _value,
                                      items: [
                                        DropdownMenuItem(
                                          child: Container(
                                            width: 200,
                                            child: Text("1",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  color: myColors.lightblue,
                                                  fontWeight: FontWeight.w300),),
                                          ),
                                          value: 1,
                                        ),
                                        DropdownMenuItem(
                                          child: Container(
                                            width: 200,
                                            child: Text("2",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  color: myColors.lightblue,
                                                  fontWeight: FontWeight.w300),),
                                          ),
                                          value: 2,
                                        ),
                                        DropdownMenuItem(
                                          child: Container(
                                            width: 200,
                                            child: Text("3",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  color: myColors.lightblue,
                                                  fontWeight: FontWeight.w300),),
                                          ),
                                          value: 3,
                                        ),
                                        DropdownMenuItem(
                                          child: Container(
                                            width: 200,
                                            child: Text("4",
                                              style: TextStyle(
                                                  fontSize: 15,
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
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            color: myColors.lightblue,
                                            fontWeight: FontWeight.w300),)
                                  ),
                                ),
                                Spacer(),
                                SvgPicture.asset(
                                  "assets/images/ic_down_arrow_grey.svg",
                                  width: 20,
                                  height: 10,
                                )

                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    String medicinename = medicinenameContoraller.text;
                    String medicinedosage = medicinedosageContoraller.text;
                    if(medicinename.isEmpty){
                      UtilityHlepar().getToast("Please enter medicine name.");
                    }
                    else if(medicinedosage.isEmpty){
                      UtilityHlepar().getToast("Please enter medicine dosage.");
                    }
                    else{
                      String daytype = "";
                      if(_value2==1){
                        daytype = "Daily";
                      }
                      else if(_value2==2){
                        daytype = "Weekly";
                      }
                      else if(_value2==3){
                        daytype = "Monthly";
                      }
                      Navigator.pop(context);
                      PatientUpdateMedicationApi(context,medicinename,medicinedosage,daytype,_value,widget.data.parameter.id.toString());

                    }
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: myColors.mythmes,),
                    child: Center(
                      child: Text(
                        "Update",
                        style: TextStyle(
                            color: myColors.mywhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ) ,
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
  Future<void> PatientUpdateMedicationApi(BuildContext context,String medicinename,String medicinedosage,String daytype, int _value,String medicineid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['id'] = medicineid;
    request['medicine_name'] = medicinename;
    request['dosage'] = medicinedosage;
    request['duration'] = daytype;
    request['how_many_times'] = _value.toString();

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientupdatemedicationurl),
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
      // Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      // ViewPatientMedicationApi();
      this.widget.oncallback();
      setState(() {

      });
    }
    else {
      // Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {

      });
    }
    return;
  }
}