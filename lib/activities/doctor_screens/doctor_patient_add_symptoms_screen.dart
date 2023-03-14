import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/currentmoodmodelclass.dart';
import '../../modelclass/response/CommandResponse.dart';
import '../../modelclass/response/ViewDoctorHomeResponse.dart';
import '../../modelclass/response/ViewDoctorPatientSymptomsResponse.dart';
import '../../modelclass/viewdoctorpatientsymptomsmodelclass.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'dart:convert' as convert;

class Doctor_Patient_Add_Symptoms extends StatefulWidget {
  final Items subdata;
  Doctor_Patient_Add_Symptoms({Key? key,required this.subdata}) : super(key: key);

  @override
  _Doctor_Patient_Add_SymptomsState createState() =>
      _Doctor_Patient_Add_SymptomsState();
}

class _Doctor_Patient_Add_SymptomsState extends State<Doctor_Patient_Add_Symptoms> {
  List<ViewDoctorPatientSymptomsModelClass> productlist1 = <ViewDoctorPatientSymptomsModelClass>[];

  @override
  void initState() {
    super.initState();
    ViewDoctorPatientSymptomsApi(context);
    setState(() {});
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
            leading: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: SvgPicture.asset(
                    "assets/images/ic_back_blue.svg",
                    width: 24,
                    height: 24,
                  ),
                )),
            title: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Patient Symptoms",
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
                  showCustomDialog(context, Mysize,OncallBack,widget.subdata.patientId.toString());
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Image.asset(
                    "assets/images/img_add_blue_bg.png",
                    width: 24,
                    height: 24,
                  ),
                ),
              )
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Recommend Symptoms for tracking",
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        color: myColors.lightblue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  productlist1.length==0?Container():Container(
                    child: ListView.builder(
                        itemCount: productlist1.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: ProductListItem1(
                              title: productlist1[index],
                              ischeck: productlist1[index].ischeck,
                              OncallBacksub: OncallBack,
                              patient_id:widget.subdata.patientId.toString()
                            ),
                          );
                        },
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: new BouncingScrollPhysics()),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: Mysize.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("assets/images/img_btn_bg.png"),
                          fit: BoxFit.cover)),
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
        ));
  }


  void showCustomDialog(BuildContext context, Size mysize, Function oncallBack,String patientId) {
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  //  color: myColors.lightblue2
                  color: myColors.mywhite.withOpacity(0.01),
                ),
                height:MediaQuery.of(context).size.height,
                child: popup(oncallBacksub: oncallBack,patientIddata: patientId,)),
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

  Future<void> ViewDoctorPatientSymptomsApi(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['patient_id'] = widget.subdata.patientId;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(
        Uri.parse(APIservices.doctorviewpatientsymptomsurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer " + prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewDoctorPatientSymptomsResponse responsemain =
    await ViewDoctorPatientSymptomsResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      productlist1.clear();
      for(int i=0;i<responsemain.data!.stymptoms!.length;i++){
        ViewDoctorPatientSymptomsModelClass modelClass = ViewDoctorPatientSymptomsModelClass(responsemain.data!.stymptoms![i], true);
        productlist1.add(modelClass);
      }
      setState(() {});
    } else {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {});
    }
    return;
  }

  OncallBack(){
    ViewDoctorPatientSymptomsApi(context);
    setState(() {

    });
  }
}

class ProductListItem1 extends StatefulWidget {
  ViewDoctorPatientSymptomsModelClass title;
  bool ischeck;
  final Function OncallBacksub;
  final String patient_id;

  ProductListItem1({required this.title, required this.ischeck, required this.OncallBacksub,required this.patient_id});

  @override
  State<ProductListItem1> createState() => _ProductListItem1State();
}

class _ProductListItem1State extends State<ProductListItem1> {

  @override
  Widget build(BuildContext context) {
    var Mysize = MediaQuery.of(context).size;
    return Card(

      color: myColors.mywhite,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)),
      ),
      child:Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: widget.title.title.addedBy.toString()=="doctor"?Image.asset("assets/images/img_fill_box_blue.png",width: 18, height: 18,):Image.asset("assets/images/img_notfill_box_blue.png",width: 18, height: 18,),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                this.widget.title.title.name.toString(),
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  color: myColors.lightblue,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          widget.title.title.addedBy=="doctor"?
          Container(
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
                  showCustomDialogUpate(context,Mysize,this.widget.OncallBacksub,this.widget.title,widget.patient_id.toString());
                }
                else if(value=="delete"){
                  showAlertDialog(context,widget.title.title.id.toString());
                }
              },
            ),
          ):
          PopupMenuButton(
            padding: EdgeInsets.zero,
            icon: Image.asset("assets/images/img_3dot_white.png",width: 10,height: 20,),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: '',
                  child: Container(),
                ),
              ];
            },
            onSelected: (String value){
            },
          ),
        ],
      ),
    );
  }

  void showCustomDialogUpate(BuildContext context, Size mysize, Function oncallback2, ViewDoctorPatientSymptomsModelClass symptomdata,String patient_id) {
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
                child: popupUpdate(oncallback2:oncallback2,Symptomsubdata:symptomdata, patient_id: widget.patient_id,)),
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

  showAlertDialog(BuildContext context,String id) {
    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure , You want to delete ?'),
      actions: [
        ElevatedButton(
            onPressed: () {
              DoctorPatientDeleteMedicationApi(context,id,widget.OncallBacksub);
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

  Future<void> DoctorPatientDeleteMedicationApi(BuildContext context,String medicineid,final Function onupdate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['id'] = medicineid;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.doctordeletepatientsymptomsurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    CommandResponse responsemain = await CommandResponse.fromJson(jsonResponse);
    Navigator.of(context).pop();
    Utility.ProgressloadingDialog(context, false);
    if (jsonResponse['status'] == true) {
      UtilityHlepar().getToast(responsemain.message.toString());
      this.widget.OncallBacksub();
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

class popup extends StatefulWidget {
  final Function oncallBacksub;
  final String patientIddata;
   popup({Key? key,required this.oncallBacksub,required this.patientIddata}) : super(key: key);

  @override
  State<popup> createState() => _popupState();
}

class _popupState extends State<popup> {
 var sympnameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.05),
      body: Center(
        child: Container(
          height: 300,
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
                          "Recommend Symptom",
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
                          "Enter Symptom Name",
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
                                      controller: sympnameController,
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
                InkWell(
                  onTap: (){
                    String sympname = sympnameController.text;
                    if(sympname.isEmpty){
                      UtilityHlepar().getToast("Please enter symptom name.");
                    }
                    else{
                      DoctorPatientAddSymptomsApi(context,sympname);
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
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
 Future<void> DoctorPatientAddSymptomsApi(BuildContext context,String medicinename) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   Utility.ProgressloadingDialog(context, true);
   var request = {};
   request['patient_id'] = widget.patientIddata.toString();
   request['name'] = medicinename;


   HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
     HttpLogger(logLevel: LogLevel.BODY),
   ]);

   var response = await http.post(Uri.parse(APIservices.doctoraddpatientsymptomsurl),
       body: convert.jsonEncode(request),
       headers: {
         "content-type": "application/json",
         "accept": "application/json",
         "Accept-Language": prefs.getString("language").toString(),
         "Authorization": "Bearer "+prefs.getString("token").toString()
       });

   Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
   CommandResponse responsemain = await CommandResponse.fromJson(jsonResponse);
   Utility.ProgressloadingDialog(context, false);
   Navigator.pop(context);
   if (jsonResponse['status'] == true) {
     UtilityHlepar().getToast(responsemain.message.toString());
     this.widget.oncallBacksub();
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

class popupUpdate extends StatefulWidget {
  final Function oncallback2;
  ViewDoctorPatientSymptomsModelClass Symptomsubdata;
  final String patient_id;
  popupUpdate({Key? key,required this.oncallback2,required this.Symptomsubdata,required this.patient_id}) : super(key: key);

  @override
  State<popupUpdate> createState() => _popupUpdateState();
}

class _popupUpdateState extends State<popupUpdate> {
  var symptomnameController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    symptomnameController.text = widget.Symptomsubdata.title.name.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.05),
      body: Center(
        child: Container(
          height: 350,
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
                        "Update a Symptom",
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
                margin: EdgeInsets.fromLTRB(00, 40, 00, 00),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        "Enter Symptom Name",
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
                                    controller: symptomnameController,
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
              InkWell(
                onTap: (){
                  String symptomname_data = symptomnameController.text.toString();
                  if(symptomname_data.isEmpty){
                    UtilityHlepar().getToast("Please enter symptom name.");
                  }
                  else{
                    UpdatePatientSymptomApi(context, this.widget.Symptomsubdata,symptomname_data);
                  }
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
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
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
  Future<void> UpdatePatientSymptomApi(BuildContext context, ViewDoctorPatientSymptomsModelClass symptomdata,String updatename) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['patient_id'] = widget.patient_id.toString();
    request['id'] = symptomdata.title.id;
    request['name'] = updatename;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.doctorupdatepatientsymptomsurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    CommandResponse responsemain = await CommandResponse.fromJson(jsonResponse);
    Navigator.pop(context);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      this.widget.oncallback2();
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

