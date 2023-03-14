import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/currentmoodmodelclass.dart';
import '../../modelclass/doctorpatientviewmedicinelist.dart';
import '../../modelclass/patientviewmedicinelist.dart';
import '../../modelclass/response/CommandResponse.dart';
import '../../modelclass/response/ViewDoctorPatientMedicineListResponse.dart';
import '../../modelclass/response/ViewPatientMedicineListResponse.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'dart:convert' as convert;


class Doctor_Patient_medicine extends StatefulWidget {
final String id;
  const Doctor_Patient_medicine({Key? key,required this.id}) : super(key: key);

  @override
  _Doctor_Patient_medicineState createState() => _Doctor_Patient_medicineState();
}

class _Doctor_Patient_medicineState extends State<Doctor_Patient_medicine>{
  List<PatientViewMedicineList1> productlist1 = <PatientViewMedicineList1>[];
  @override
  void initState() {
    super.initState();
    // productlist1 = getProductList1();
    ViewDoctorPatientMedicineListApi(context);
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
                "Patient Medicine",
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
                  showCustomDialog(context,Mysize,OncallBack);
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
              child: Container(
                child: ListView.builder(
                    itemCount: productlist1.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {

                        },
                        child: ProductListItem1(
                          data: productlist1[index],
                            OncallBacksub : OncallBack

                        ),
                      );
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: new BouncingScrollPhysics()),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                },
                child: Container(
                  height: Mysize.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("assets/images/img_btn_bg.png"),
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
  List<CurrentMoodModelClass> getProductList1() {
    List<CurrentMoodModelClass> productbook = <CurrentMoodModelClass>[];
    CurrentMoodModelClass sliderModelbook1 = new CurrentMoodModelClass("Ibuprofen 200mg Once a day","assets/images/img_myreport_demo.png",false);
    CurrentMoodModelClass sliderModelbook2 = new CurrentMoodModelClass("Neulasta Once a day","assets/images/img_myreport_demo.png",false);
    CurrentMoodModelClass sliderModelbook3 = new CurrentMoodModelClass("Keytruda Twice a day","assets/images/img_myreport_demo.png",false);
    CurrentMoodModelClass sliderModelbook4 = new CurrentMoodModelClass("Ibuprofen 200mg Once a day","assets/images/img_myreport_demo.png",false);
    CurrentMoodModelClass sliderModelbook5 = new CurrentMoodModelClass("Neulasta Three Times a day","assets/images/img_myreport_demo.png",false);
    CurrentMoodModelClass sliderModelbook6 = new CurrentMoodModelClass("Neulasta Three Times a day","assets/images/img_myreport_demo.png",false);

    productbook.add(sliderModelbook1);
    productbook.add(sliderModelbook2);
    productbook.add(sliderModelbook3);
    productbook.add(sliderModelbook4);
    productbook.add(sliderModelbook5);
    productbook.add(sliderModelbook6);

    return productbook;
  }
  void showCustomDialog(BuildContext context, Size mysize, Function oncallBack) {
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
                child: popup(patient_id:widget.id,oncallBacksub : oncallBack)),
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
  Future<void> ViewDoctorPatientMedicineListApi(BuildContext context) async {
    productlist1.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['patient_id'] = widget.id.toString();


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.doctorviewpatientmedicinelisturl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewDoctorPatientMedicineListResponse responsemain = await ViewDoctorPatientMedicineListResponse.fromJson(jsonResponse);
    Utility.ProgressloadingDialog(context, false);
    if (jsonResponse['status'] == true) {
      /*for(int i=0;i<responsemain.data!.items!.length;i++){
        productlist1.add(responsemain.data!.items![i]);
      }*/
      //medicine_name+dosage+"mg"+times+duration
      for(int i=0;i<responsemain.data!.items!.length;i++){
        Items medicationdata = responsemain.data!.items![i];
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

        PatientViewMedicineList1 parameter = PatientViewMedicineList1(title,medicationdata.dosage.toString(),medicationdata);
        productlist1.add(parameter);
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
  OncallBack(){
    ViewDoctorPatientMedicineListApi(context);
    setState(() {

    });
  }
}
class ProductListItem1 extends StatefulWidget {
 final PatientViewMedicineList1 data;
 final Function OncallBacksub;
  ProductListItem1({required this.data,required this.OncallBacksub});

  @override
  State<ProductListItem1> createState() => _ProductListItem1State();
}

class _ProductListItem1State extends State<ProductListItem1> {
  int? itemindex;
  @override
  Widget build(BuildContext context) {
    var Mysize = MediaQuery.of(context).size;
    return Column(
      children: [
        Card(
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
          child: Container(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.data.title.toString(),
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        color: myColors.lightblue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),

            widget.data.parameter.addedBy=="doctor"?
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
                   showCustomDialogUpate(context,Mysize);
                 }
                 else if(value=="delete"){
                   showAlertDialog(context,widget.data.parameter.id.toString());
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
          ),
        ),
        itemindex == 1 ? Container(
    padding: EdgeInsets.only(top: 0),
    alignment: Alignment.topRight,
    child: customitempopup(),) : Container()
      ],
    );
  }

  customitempopup(){
    return Column(
      children: [
        Text('Edit', style: TextStyle(
      fontSize: 15,
      fontStyle: FontStyle.normal,
      color: myColors.lightblue,
      fontWeight: FontWeight.w400,
    ),),
        Text('Delete', style: TextStyle(
          fontSize: 15,
          fontStyle: FontStyle.normal,
          color: myColors.lightblue,
          fontWeight: FontWeight.w400,
        ),)
      ],
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

    var response = await http.post(Uri.parse(APIservices.doctordeletepatientmedicineurl),
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

  void showCustomDialogUpate(BuildContext context, Size mysize) {
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
                height: 600,
                child: popupUpdate()),
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
}

class popup extends StatefulWidget {
  final String patient_id;
  final Function oncallBacksub;
   popup({Key? key,required this.patient_id,required this.oncallBacksub}) : super(key: key);

  @override
  State<popup> createState() => _popupState();
}

class _popupState extends State<popup> {
  int _value = 1;
  int _value2 = 1;
  var medicinenameController = new TextEditingController();
  var medicinedosageController = new TextEditingController();
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
                InkWell(
                  onTap: (){
                    String medicinename = medicinenameController.text;
                    String medicinedosage = medicinedosageController.text;
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
                      DoctorPatientAddMedicationApi(context,medicinename,medicinedosage,daytype,_value,widget.patient_id,widget.oncallBacksub);
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
  Future<void> DoctorPatientAddMedicationApi(BuildContext context,String medicinename,String medicinedosage,String daytype, int _value,String patient_id, Function oncallBacksub) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['medicine_name'] = medicinename;
    request['patient_id'] = patient_id;
    request['dosage'] = medicinedosage;
    request['duration'] = daytype;
    request['how_many_times'] = _value.toString();


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.doctoraddpatientmedicineurl),
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
    Utility.ProgressloadingDialog(context, false);
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
  const popupUpdate({Key? key}) : super(key: key);

  @override
  State<popupUpdate> createState() => _popupUpdateState();
}

class _popupUpdateState extends State<popupUpdate> {
  int _value = 1;
  int _value2 = 1;
  var medicinenameController = new TextEditingController();
  var medicinedosageController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.05),
      body: Container(
        height: 600,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(00, 20, 00, 0),
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
              InkWell(
                onTap: (){
                  String medicinename = medicinenameController.text;
                  String medicinedosge = medicinedosageController.text;

                  if(medicinename.isEmpty){
                    UtilityHlepar().getToast("Please enter medicine name.");
                  }
                  else if(medicinedosge.isEmpty){
                    UtilityHlepar().getToast("Please enter medicine dosage.");
                  }
                  else{
                    Navigator.pop(context);
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
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}


