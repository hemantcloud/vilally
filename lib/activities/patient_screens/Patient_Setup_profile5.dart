import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_more_text_popup/show_more_text_popup.dart';
import 'package:vitally/activities/patient_screens/patient_dashboard.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/newcancermodelclass.dart';
import '../../modelclass/newcurrentmoodmodelclass.dart';
import '../../modelclass/response/CommandResponse.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'dart:convert' as convert;

class Patient_Setup_Profile5 extends StatefulWidget {
  Patient_Setup_Profile5({Key? key,
    required this.languagelist,
    required this.stagecount,
    required this.cancertype,
    required this.cancerdate,
    required this.medicinename,
    required this.dosage,
    required this.daytype,
    required this.manytimes
  }) : super(key: key);
  List<NewCancelModelClass> languagelist;
  String stagecount="";
  String cancertype="";
  String cancerdate="";
  String medicinename="";
  String dosage="";
  String daytype="";
  String manytimes="";

  @override
  _Patient_Setup_Profile5State createState() => _Patient_Setup_Profile5State();
}

class _Patient_Setup_Profile5State extends State<Patient_Setup_Profile5> {
  final String text="Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  late String firstHalf;
  late String secondHalf;
  GlobalKey key = new GlobalKey();
  bool flag = true;
  List<NewCurrentMoodModelClass> CurrentMoodModelanguagelist = <NewCurrentMoodModelClass>[];
  @override
  void initState() {
    super.initState();
    CurrentMoodModelanguagelist = getLanguageList();

    if (text.length > 40) {
      firstHalf = text.substring(0, 40);
      secondHalf = text.substring(40, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
    print("languagelist cancer name >>>>"+widget.languagelist.length.toString());
    print("stagecount >>>>"+widget.stagecount.toString());
    print("cancertype >>>>"+widget.cancertype.toString());
    print("medicinename >>>>"+widget.medicinename.toString());
    print("dosage >>>>"+widget.dosage.toString());
    print("daytype >>>>"+widget.daytype.toString());
    print("manytimes >>>>"+widget.manytimes.toString());
    print("cancerdate >>>>"+widget.cancerdate.toString());



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
              alignment: Alignment.center,
              child: Text(
                "Tap ONCE to select your input",
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    color: myColors.lightblue,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                   margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          child: Image.asset("assets/images/img_profile5_bg.png", fit: BoxFit.fill,),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(00, 10, 00, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,

                                      child: Text(
                                        "How are you feeling today?",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: myColors.lightblue,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(width: 5,),
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
                                margin: EdgeInsets.fromLTRB(00, 10, 00, 0),
                                child: Container(
                                  alignment: Alignment.center,

                                  child: Text(
                                    "Tap to select your current Mood",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: myColors.lightblue,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              Container(
                                height: 90,
                                margin: EdgeInsets.fromLTRB(00, 10, 00, 0),
                                child: ListView.builder(
                                    itemCount: CurrentMoodModelanguagelist.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {

                                            if(CurrentMoodModelanguagelist[index].ischeck){

                                              for(int i=0;i<CurrentMoodModelanguagelist.length;i++){
                                                CurrentMoodModelanguagelist[i].setIscheck(false);
                                              }
                                            }
                                            else{

                                              for(int i=0;i<CurrentMoodModelanguagelist.length;i++){
                                                CurrentMoodModelanguagelist[i].setIscheck(false);
                                              }
                                              CurrentMoodModelanguagelist[index].setIscheck(true);
                                            }
                                            ProductListItem(
                                                selectedimage: CurrentMoodModelanguagelist[index].selectedimage,
                                                unselectedimage:CurrentMoodModelanguagelist[index].unselectedimage,
                                              title: CurrentMoodModelanguagelist[index].title,
                                              ischeck: CurrentMoodModelanguagelist[index].ischeck,
                                                position:index
                                            );
                                          });
                                        },
                                        child: ProductListItem(
                                            selectedimage: CurrentMoodModelanguagelist[index].selectedimage,
                                            unselectedimage:CurrentMoodModelanguagelist[index].unselectedimage,
                                            title: CurrentMoodModelanguagelist[index].title,
                                            ischeck: CurrentMoodModelanguagelist[index].ischeck,
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
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Container(
                      child: Text(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: myColors.lightblue,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  bool flag = false;
                  int pos = -1;
                  for(int i=0;i<CurrentMoodModelanguagelist.length;i++){
                    if(CurrentMoodModelanguagelist[i].ischeck){
                      flag = true;
                      pos = i;
                      break;
                    }
                  }
                  if(flag){
                   /* Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Patient_Dashboard()));*/
                    print("feeling name >>>>>>"+CurrentMoodModelanguagelist[pos].title.toString());
                    PatientAddDatasetup2(context);

                  }
                  else{
                    UtilityHlepar().getToast("Please select your feeling.");
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
                      "Next",
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

  List<NewCurrentMoodModelClass> getLanguageList() {
    final products = <NewCurrentMoodModelClass>[
      NewCurrentMoodModelClass("None","assets/images/img_emoji1_bg_unselected.png",'assets/images/img_emoji1_bg.png', true),
      NewCurrentMoodModelClass("Mild","assets/images/img_emoji2_bg.png",'assets/images/img_emoji_pineyellow.png', false),
      NewCurrentMoodModelClass("Moderate","assets/images/img_emoji3_bg.png",'assets/images/img_emoji_yellow.png', false),
      NewCurrentMoodModelClass("Severe","assets/images/img_emoji4_bg.png",'assets/images/img_emoji_orange.png', false),
      NewCurrentMoodModelClass("Unbearable","assets/images/img_emoji5_bg.png",'assets/images/img_emoji_red.png', false),


    ];

    return products;
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

  Future<void> PatientAddDatasetup2(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    String cancer_id = "";
    for(int i=0;i<widget.languagelist.length;i++){
      if(widget.languagelist[i].ischeck==true){
        cancer_id = cancer_id+widget.languagelist[i].id.toString()+",";
      }
    }
    if (cancer_id != null && cancer_id.length > 0) {
      cancer_id = cancer_id.substring(0, cancer_id.length - 1);
    }

    String current_mood = "";
    for(int j=0;j<CurrentMoodModelanguagelist.length;j++){
      if(CurrentMoodModelanguagelist[j].ischeck==true){
        current_mood = CurrentMoodModelanguagelist[j].title;
        break;
      }
    }
    String first_diagnosis_year = "";
    String first_diagnosis_month = "";
    if(widget.cancerdate!=""){
      DateTime tempDate = new DateFormat("MMM-yyyy").parse(widget.cancerdate);
      String formattedDate = DateFormat('MM-yyyy').format(tempDate);
      int idx = formattedDate.indexOf("-");
      first_diagnosis_year = formattedDate.substring(idx+1).trim();
      first_diagnosis_month = formattedDate.substring(0,idx).trim();
    }

    request['cancer_id'] = cancer_id;
    request['first_diagnosis_year'] = first_diagnosis_year;
    request['first_diagnosis_month'] = first_diagnosis_month;
    request['cancer_type'] = widget.cancertype.replaceAll(" Cancer","");
    request['stage'] = int.parse(widget.stagecount)+1;
    request['medical_history'] = "";
    request['medicine_name'] = widget.medicinename;
    request['dosage'] = widget.dosage;
    request['duration'] = widget.daytype;
    request['how_many_times'] =widget.manytimes;
    request['current_mood'] = current_mood;


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.patientaddsetup2url),
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
      // UtilityHlepar().getToast(responsemain.message.toString());
      prefs.setBool("is_user_login",true);
      prefs.setBool("is_patient",true);
      prefs.setBool("patient_setup1",false);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          Patient_Dashboard()), (Route<dynamic> route) => false);
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
class ProductListItem extends StatelessWidget {
  String selectedimage;
  String unselectedimage;
  String title;
  bool ischeck;
  int position;


  ProductListItem({required this.selectedimage,required this.unselectedimage, required this.title, required this.ischeck,required this.position});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 0,0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(ischeck==true? selectedimage:unselectedimage,width: 40,height: 40,),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child:  Text(
              title,
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