
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_more_text_popup/show_more_text_popup.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/currentmoodmodelclass.dart';
import '../../modelclass/languagemodelclass.dart';
import '../../modelclass/languageyoursymptomsmodelclass.dart';
import '../../modelclass/newcurrentmoodmodelclass.dart';
import '../../modelclass/response/CommandResponse.dart';
import '../../modelclass/response/ViewPatientHomeResponse.dart';
import '../../modelclass/response/ViewPatientSymptomsListResponse.dart';
import '../../modelclass/response/ViewPatientSymptomsListResponse.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'dart:convert' as convert;


class Patient_your_symptoms extends StatefulWidget {
  final Function Oncallback;
  Patient_your_symptoms({Key? key,required this.Oncallback}) : super(key: key);

  @override
  _Patient_your_symptomsState createState() => _Patient_your_symptomsState();
}

class _Patient_your_symptomsState extends State<Patient_your_symptoms>{
  List<NewCurrentMoodModelClass> languagelist = <NewCurrentMoodModelClass>[];

  @override
  void initState() {
    super.initState();
    languagelist = getLanguageList("");

    Future.delayed(Duration.zero, () {
      this.ViewPatientSymptomsApi(context);
    });
  }
  Oncallback2(){
    ViewPatientSymptomsApi(context);
  }
  List<Language> products = <Language>[
    Language('assets/images/img_en_bg.png', "Nausea", true),
    Language('assets/images/img_hi_bg.png', "Vomiting", false)];

  List<LanguageYourSymptomsModelClass> products3 = [];
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
                  onPressed: ()  {
                  widget.Oncallback();
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
                  "Enter your symptoms",
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
                    showCustomDialog(context,Mysize,Oncallback2);
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
                    Container(
                      margin: EdgeInsets.fromLTRB(20,20,20,0),
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      color: myColors.mythmes,
                      alignment: Alignment.center,
                      child: Text(
                        "Prescribed by your doctor",
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          color: myColors.mywhite,
                          fontWeight: FontWeight.w500,

                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 00, 20, 00),
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: myColors.Color_D8E9F6_2,
                            ),
                          color: myColors.Color_D8E9F6_2,

                            borderRadius: BorderRadius.only(topLeft: Radius.zero,topRight: Radius.zero,bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),

                        ),
                      child:ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    bool ischecksub = false;
                                    if(products[index].ischeck){
                                      ischecksub = false;
                                      for(int i=0;i<products.length;i++){
                                        products[i].setIscheck(false);
                                      }
                                    }
                                    else{
                                      ischecksub = true;
                                      for(int i=0;i<products.length;i++){
                                        products[i].setIscheck(false);
                                      }
                                      products[index].setIscheck(true);
                                    }
                                    ProductListItem(
                                        imagePath: products[index].imageAssetPath,
                                        title: products[index].title,
                                        ischeck: products[index].ischeck,
                                        languagelist1 : languagelist
                                    );
                                  });
                                },
                                child: ProductListItem(
                                    imagePath: products[index].imageAssetPath,
                                    title: products[index].title,
                                    ischeck: products[index].ischeck,
                                    languagelist1 : languagelist

                                ),
                              );
                            },
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: new BouncingScrollPhysics()),
                    ),
                    products3.length==0?Container():Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        margin: EdgeInsets.fromLTRB(20, 00, 20, 00),
                        child: ListView.builder(
                            itemCount: products3.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                  });

                                },
                                child: ProductListItem3(
                                    title: products3[index].title,
                                    languagelist2 : products3[index].languagelistsub,
                                    Symptomdata : products3[index].Symptomdata,
                                    Oncallback2 : Oncallback2

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
  List<NewCurrentMoodModelClass> getLanguageList(String feelingname) {
    if(feelingname==""){
      final products = <NewCurrentMoodModelClass>[
        NewCurrentMoodModelClass("None", "assets/images/img_emoji1_bg_unselected.png", 'assets/images/img_emoji1_bg.png', true),
        NewCurrentMoodModelClass("Mild", "assets/images/img_emoji2_bg.png", 'assets/images/img_emoji_pineyellow.png', false),
        NewCurrentMoodModelClass("Moderate", "assets/images/img_emoji3_bg.png", 'assets/images/img_emoji_yellow.png', false),
        NewCurrentMoodModelClass("Severe", "assets/images/img_emoji4_bg.png", 'assets/images/img_emoji_orange.png', false),
        NewCurrentMoodModelClass("Unbearable", "assets/images/img_emoji5_bg.png", 'assets/images/img_emoji_red.png', false),
      ];
      return products;
    }
    else if(feelingname=="None"){
      final products = <NewCurrentMoodModelClass>[
        NewCurrentMoodModelClass("None", "assets/images/img_emoji1_bg_unselected.png", 'assets/images/img_emoji1_bg.png', true),
        NewCurrentMoodModelClass("Mild", "assets/images/img_emoji2_bg.png", 'assets/images/img_emoji_pineyellow.png', false),
        NewCurrentMoodModelClass("Moderate", "assets/images/img_emoji3_bg.png", 'assets/images/img_emoji_yellow.png', false),
        NewCurrentMoodModelClass("Severe", "assets/images/img_emoji4_bg.png", 'assets/images/img_emoji_orange.png', false),
        NewCurrentMoodModelClass("Unbearable", "assets/images/img_emoji5_bg.png", 'assets/images/img_emoji_red.png', false),
      ];
      return products;
    }
    else if(feelingname=="Mild"){
      final products = <NewCurrentMoodModelClass>[
        NewCurrentMoodModelClass("None", "assets/images/img_emoji1_bg_unselected.png", 'assets/images/img_emoji1_bg.png', false),
        NewCurrentMoodModelClass("Mild", "assets/images/img_emoji2_bg.png", 'assets/images/img_emoji_pineyellow.png', true),
        NewCurrentMoodModelClass("Moderate", "assets/images/img_emoji3_bg.png", 'assets/images/img_emoji_yellow.png', false),
        NewCurrentMoodModelClass("Severe", "assets/images/img_emoji4_bg.png", 'assets/images/img_emoji_orange.png', false),
        NewCurrentMoodModelClass("Unbearable", "assets/images/img_emoji5_bg.png", 'assets/images/img_emoji_red.png', false),
      ];
      return products;
    }
    else if(feelingname=="Moderate"){
      final products = <NewCurrentMoodModelClass>[
        NewCurrentMoodModelClass("None", "assets/images/img_emoji1_bg_unselected.png", 'assets/images/img_emoji1_bg.png', false),
        NewCurrentMoodModelClass("Mild", "assets/images/img_emoji2_bg.png", 'assets/images/img_emoji_pineyellow.png', false),
        NewCurrentMoodModelClass("Moderate", "assets/images/img_emoji3_bg.png", 'assets/images/img_emoji_yellow.png', true),
        NewCurrentMoodModelClass("Severe", "assets/images/img_emoji4_bg.png", 'assets/images/img_emoji_orange.png', false),
        NewCurrentMoodModelClass("Unbearable", "assets/images/img_emoji5_bg.png", 'assets/images/img_emoji_red.png', false),
      ];
      return products;
    }
    else if(feelingname=="Severe"){
      final products = <NewCurrentMoodModelClass>[
        NewCurrentMoodModelClass("None", "assets/images/img_emoji1_bg_unselected.png", 'assets/images/img_emoji1_bg.png', false),
        NewCurrentMoodModelClass("Mild", "assets/images/img_emoji2_bg.png", 'assets/images/img_emoji_pineyellow.png', false),
        NewCurrentMoodModelClass("Moderate", "assets/images/img_emoji3_bg.png", 'assets/images/img_emoji_yellow.png', false),
        NewCurrentMoodModelClass("Severe", "assets/images/img_emoji4_bg.png", 'assets/images/img_emoji_orange.png', true),
        NewCurrentMoodModelClass("Unbearable", "assets/images/img_emoji5_bg.png", 'assets/images/img_emoji_red.png', false),
      ];
      return products;
    }
    else if(feelingname=="Unbearable"){
      final products = <NewCurrentMoodModelClass>[
        NewCurrentMoodModelClass("None", "assets/images/img_emoji1_bg_unselected.png", 'assets/images/img_emoji1_bg.png', false),
        NewCurrentMoodModelClass("Mild", "assets/images/img_emoji2_bg.png", 'assets/images/img_emoji_pineyellow.png', false),
        NewCurrentMoodModelClass("Moderate", "assets/images/img_emoji3_bg.png", 'assets/images/img_emoji_yellow.png', false),
        NewCurrentMoodModelClass("Severe", "assets/images/img_emoji4_bg.png", 'assets/images/img_emoji_orange.png', false),
        NewCurrentMoodModelClass("Unbearable", "assets/images/img_emoji5_bg.png", 'assets/images/img_emoji_red.png', true),
      ];
      return products;
    }
    else{
      final products = <NewCurrentMoodModelClass>[
        NewCurrentMoodModelClass("None", "assets/images/img_emoji1_bg_unselected.png", 'assets/images/img_emoji1_bg.png', true),
        NewCurrentMoodModelClass("Mild", "assets/images/img_emoji2_bg.png", 'assets/images/img_emoji_pineyellow.png', false),
        NewCurrentMoodModelClass("Moderate", "assets/images/img_emoji3_bg.png", 'assets/images/img_emoji_yellow.png', false),
        NewCurrentMoodModelClass("Severe", "assets/images/img_emoji4_bg.png", 'assets/images/img_emoji_orange.png', false),
        NewCurrentMoodModelClass("Unbearable", "assets/images/img_emoji5_bg.png", 'assets/images/img_emoji_red.png', false),
      ];
      return products;
    }
  }
  void showCustomDialog(BuildContext context, Size mysize, Function() oncallback2) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return ClipRRect(borderRadius: BorderRadius.circular(20),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: myColors.mywhite.withOpacity(0.01),
              ),
                height: MediaQuery.of(context).size.height,
                child: popup(oncallback2:oncallback2)),
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

  Future<void> ViewPatientSymptomsApi(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientviewsymptomslisturl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    ViewPatientSymptomsListResponse responsemain = await ViewPatientSymptomsListResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);

      products3.clear();
      for(int i=0;i<responsemain.data!.symptom!.length;i++){

        List<NewCurrentMoodModelClass> languagelistsub = <NewCurrentMoodModelClass>[];
        languagelistsub = getLanguageList(responsemain.data!.symptom![i].selected.toString());
        LanguageYourSymptomsModelClass parameter = LanguageYourSymptomsModelClass(
            responsemain.data!.symptom![i].name.toString(),
            responsemain.data!.symptom![i],
            languagelistsub);
        products3.add(parameter);

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

  Future<bool> _willPopCallback() async {
    this.widget.Oncallback();
    Navigator.pop(this.context);
    return true; // return true if the route to be popped
  }
}

class popup extends StatefulWidget {
  final Function oncallback2;
   popup({Key? key,required this.oncallback2}) : super(key: key);

  @override
  State<popup> createState() => _popupState();
}

class _popupState extends State<popup> {
  var symptomnameController = new TextEditingController();
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
                        "Add a Symptom",
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
                    // Navigator.pop(context);
                    AddPatientSymptomApi(context, symptomname_data,this.widget.oncallback2);
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
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
  Future<void> AddPatientSymptomApi(BuildContext context,String feeling, Function oncallback2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['name'] = feeling;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientaddsymptomsurl),
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

class ProductListItem extends StatefulWidget {
  String imagePath;
  String title;
  bool ischeck;
  List<NewCurrentMoodModelClass> languagelist1;

  ProductListItem({required this.imagePath, required this.title, required this.ischeck,required this.languagelist1});

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  final String text="Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  late String firstHalf;
  late String secondHalf;
  GlobalKey key = new GlobalKey();
  bool flag = true;
  @override
  void initState() {
    super.initState();
    if (text.length > 40) {
      firstHalf = text.substring(0, 40);
      secondHalf = text.substring(40, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 0, 12,0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(00, 0, 00, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,

                      child: Text(
                        widget.title.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: myColors.lightblue,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: InkWell(

                      onTap: (){
                        showMoreText(text,context);
                      },
                      key: key,
                      child: SvgPicture.asset(
                        "assets/images/ic_info_bg.svg",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 90,
              margin: EdgeInsets.fromLTRB(00, 0, 00, 0),
              child: ListView.builder(
                  itemCount: widget.languagelist1.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if(widget.languagelist1[index].ischeck){
                            for(int i=0;i<widget.languagelist1.length;i++){
                              widget.languagelist1[i].setIscheck(false);
                            }
                          }
                          else{
                            for(int i=0;i<widget.languagelist1.length;i++){
                              widget.languagelist1[i].setIscheck(false);
                            }
                            widget.languagelist1[index].setIscheck(true);
                          }
                          ProductListItem2(
                              selectedimage: widget.languagelist1[index].selectedimage,
                              unselectedimage:widget.languagelist1[index].unselectedimage,
                              title: widget.languagelist1[index].title,
                              ischeck: widget.languagelist1[index].ischeck,
                              position:index
                          );
                        });

                      },
                      child: ProductListItem2(
                          selectedimage: widget.languagelist1[index].selectedimage,
                          unselectedimage:widget.languagelist1[index].unselectedimage,
                          title: widget.languagelist1[index].title,
                          ischeck: widget.languagelist1[index].ischeck,
                          position:index
                      ),
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: new BouncingScrollPhysics()),
            ),
          ],
        ),
      ),
    );
  }
  void showMoreText(String? text,BuildContext context) {
    ShowMoreTextPopup popup = ShowMoreTextPopup(context,
        text: text.toString(),
        textStyle: TextStyle(color: myColors.lightblue),
        height: 200,
        width: 120,
        backgroundColor: myColors.mywhite,
        padding: EdgeInsets.all(10.0),
        borderRadius: BorderRadius.circular(10.0),
        onDismiss: () {

        }
    );

    /// show the popup for specific widget
    popup.show(
      widgetKey: key,
    );
  }
}

class ProductListItem2 extends StatefulWidget {
  String selectedimage;
  String unselectedimage;
  String title;
  bool ischeck;
  int position;
  ProductListItem2({required this.selectedimage,required this.unselectedimage, required this.title, required this.ischeck,required this.position});

  @override
  State<ProductListItem2> createState() => _ProductListItem2State();
}

class _ProductListItem2State extends State<ProductListItem2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0,0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(widget.ischeck==true? widget.selectedimage:widget.unselectedimage,width: 40,height: 40,),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child:  Text(
              widget.title,
              style: TextStyle(
                  color: myColors.lightblue,
                  fontWeight: FontWeight.w300,
                  fontSize: 10),
            )
            ,
          ),
        ],
      ),
    );
  }
}

class ProductListItem4 extends StatefulWidget {
  String selectedimage;
  String unselectedimage;
  String title;
  bool ischeck;
  int position;
  ProductListItem4({required this.selectedimage,required this.unselectedimage, required this.title, required this.ischeck,required this.position});

  @override
  State<ProductListItem4> createState() => _ProductListItem4State();
}

class _ProductListItem4State extends State<ProductListItem4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0,0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(widget.ischeck==true? widget.selectedimage:widget.unselectedimage,width: 40,height: 40,),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child:  Text(
              widget.title,
              style: TextStyle(
                  color: myColors.lightblue,
                  fontWeight: FontWeight.w300,
                  fontSize: 10),
            )
            ,
          ),
        ],
      ),
    );
  }
}

class ProductListItem3 extends StatefulWidget {

  String title;
  List<NewCurrentMoodModelClass> languagelist2;
  Symptom Symptomdata;
  final Function Oncallback2;
  ProductListItem3({ required this.title,required this.languagelist2,required this.Symptomdata,required this.Oncallback2});

  @override
  State<ProductListItem3> createState() => _ProductListItem3State();
}

class _ProductListItem3State extends State<ProductListItem3> {

  late String firstHalf;

  late String secondHalf;

  GlobalKey key = new GlobalKey();

  bool flag = true;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var Mysize = MediaQuery.of(context).size;
    return Container(
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 0, 12,0),
        margin: EdgeInsets.fromLTRB(0, 0, 0,0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(00, 0, 00, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,

                      child: Text(
                        this.widget.title.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: myColors.lightblue,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  widget.Symptomdata.addedBy=="patient"?Container():Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: InkWell(

                      onTap: (){
                        showMoreText(widget.Symptomdata.description.toString(),context);
                      },
                      key: key,
                      child: SvgPicture.asset(
                        "assets/images/ic_info_bg.svg",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  widget.Symptomdata.addedBy=="patient"?
                  InkWell(
                    onTap: (){

                    }
                    ,child:  Container(
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
                          showCustomDialogUpate(context,Mysize,this.widget.Oncallback2,this.widget.Symptomdata);
                        }
                        else if(value=="delete"){
                          showAlertDialog(context,this.widget.Oncallback2);
                        }
                      },
                    ),
                  ),
                  ):Container()
                ],
              ),
            ),
            Container(
              height: 80,
              margin: EdgeInsets.fromLTRB(00, 10, 00, 0),
              child: ListView.builder(
                  itemCount: widget.languagelist2.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if(widget.languagelist2[index].ischeck){
                            for(int i=0;i<widget.languagelist2.length;i++){
                              widget.languagelist2[i].setIscheck(false);
                            }
                          }
                          else{
                            for(int i=0;i<widget.languagelist2.length;i++){
                              widget.languagelist2[i].setIscheck(false);
                            }
                            widget.languagelist2[index].setIscheck(true);
                            PatientSymptomFeelingUpdateApi(context,widget.languagelist2[index].title);
                          }
                          ProductListItem4(
                              selectedimage: widget.languagelist2[index].selectedimage,
                              unselectedimage:widget.languagelist2[index].unselectedimage,
                              title: widget.languagelist2[index].title,
                              ischeck: widget.languagelist2[index].ischeck,
                              position:index
                          );
                        });
                      },
                      child: ProductListItem4(
                          selectedimage: widget.languagelist2[index].selectedimage,
                          unselectedimage:widget.languagelist2[index].unselectedimage,
                          title: widget.languagelist2[index].title,
                          ischeck: widget.languagelist2[index].ischeck,
                          position:index
                      ),
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: new BouncingScrollPhysics()),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, Function oncallback2) {
    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure , You want to delete ?'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              DeletePatientSymptomApi(context,this.widget.Symptomdata);
            },
            child: const Text('Yes')),
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No'))
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showCustomDialogUpate(BuildContext context, Size mysize, Function oncallback2, Symptom symptomdata) {
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
                child: popupUpdate(oncallback2:oncallback2,Symptomsubdata:symptomdata)),
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

  void showMoreText(String? text,BuildContext context) {
    ShowMoreTextPopup popup = ShowMoreTextPopup(context,
        text: text.toString(),
        textStyle: TextStyle(color: myColors.lightblue),
        height: 200,
        width: 120,
        backgroundColor: myColors.mywhite,
        padding: EdgeInsets.all(10.0),
        borderRadius: BorderRadius.circular(10.0),
        onDismiss: () {

        }
    );

    /// show the popup for specific widget
    popup.show(
      widgetKey: key,
    );
  }

  Future<void> DeletePatientSymptomApi(BuildContext context, Symptom symptomdata) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['id'] = symptomdata.id;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientdeletesymptomsurl),
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
    if (jsonResponse['status'] == true) {
      UtilityHlepar().getToast(responsemain.message.toString());
      this.widget.Oncallback2();
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

  Future<void> PatientSymptomFeelingUpdateApi(BuildContext context, String title) async {
    Utility.ProgressloadingDialog(context, true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var request = {};
    request['id'] = this.widget.Symptomdata.id;
    request['condition'] = title;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientupdatesymptomsfeelingurl),
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
    if (jsonResponse['status'] == true) {
      UtilityHlepar().getToast(responsemain.message.toString());
      this.widget.Oncallback2();
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
  Symptom Symptomsubdata;
   popupUpdate({Key? key,required this.oncallback2,required this.Symptomsubdata}) : super(key: key);

  @override
  State<popupUpdate> createState() => _popupUpdateState();
}

class _popupUpdateState extends State<popupUpdate> {
  var symptomnameController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    symptomnameController.text = this.widget.Symptomsubdata.name.toString();
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
  Future<void> UpdatePatientSymptomApi(BuildContext context, Symptom symptomdata,String updatename) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['id'] = symptomdata.id;
    request['name'] = updatename;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientupdatesymptomsurl),
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



