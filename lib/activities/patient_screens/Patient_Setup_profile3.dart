import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../modelclass/cancermodelclass.dart';
import '../../utils/UtilityHlepar.dart';
import 'Patient_Setup_profile4.dart';

class Patient_Setup_Profile3 extends StatefulWidget {
   Patient_Setup_Profile3({Key? key}) : super(key: key);

  @override
  _Patient_Setup_Profile3State createState() => _Patient_Setup_Profile3State();
}

class _Patient_Setup_Profile3State extends State<Patient_Setup_Profile3> {
  List<CancelModelClass> languagelist = <CancelModelClass>[];
  List<CancelModelClass> organslist = <CancelModelClass>[];
  bool ischeck_NewCancer = false;
  bool ischeck_NewCancer2 = false;

  bool ischeck_organ = false;
  bool ischeck_organ2 = true;
  bool check_organ_status = false;
  bool check_cancer_type = false;

  String? extselectedValue="Select Year";
  String? extselectedValue2="Select Month";
  double percent = 0.0;
  String current_cancer_type="";

  String selectedyear="Select Year/Month";

  late DateTime initialDate;
  DateTime? selectedDate;
  String stagecount = "0";
  @override
  void initState() {
    super.initState();
    languagelist = getCancelDataList();
    organslist = getorgansDataList();

    late Timer timer;
    timer = Timer.periodic(Duration(milliseconds:1000),(_){
      setState(() {
        percent=60;
        // percent+=10;
        if(percent >= 60){
          timer.cancel();
          // percent=0;
        }
      });
    });

    initialDate = DateTime.now();
    selectedDate = initialDate;
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
                onPressed: null,
                child: Container(
                  margin:EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0)  ,
                  child: SvgPicture.asset(
                    "",
                    width: 24,
                    height: 24,
                  ),
                )),
            title: InkWell(
              onTap: () {
                print("stagecount >>>>>"+stagecount);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Patient_Setup_Profile4(
                        stagecount:stagecount
                        ,cancertype:""
                        ,cancerdate:"")));
              },
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Skip",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      color: myColors.lightblue,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child:Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20,10,20,0),
                      child:/*Image.asset(
                        "assets/images/img_progress2_bg.png",
                        width: double.infinity,
                        height: 30,
                      ) */
                      LinearPercentIndicator( //leaner progress bar
                        animation: true,
                        animationDuration: 1000,
                        lineHeight: 20.0,
                        percent:percent/100,
                        /* center: Text(
                          percent.toString() + "%",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),*/
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Color(0xff0281C6),
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: Container(
                        alignment: Alignment.center,

                        child: Text(
                          "Dear Warrior!",
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
                          "Tell us more about your cancer diagnosis",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: myColors.lightblue,
                              fontWeight: FontWeight.w300,
                              fontSize: 18),
                        ),
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
                              "When did you first receive your cancer diagnosis?",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: myColors.lightblue,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                         /* Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Card(
                                  color: myColors.mywhite,
                                  margin: EdgeInsets.fromLTRB(20, 10, 5, 5),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 12, 0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          icon: SvgPicture.asset(
                                            "assets/images/ic_dob_grey.svg",
                                            width: 24,
                                            height: 24,
                                          ),
                                          value: extselectedValue,
                                          items:items.map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              extselectedValue = value as String;
                                            });
                                          },
                                          hint:Text("Select Year",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                color: myColors.lightblue,
                                                fontWeight: FontWeight.w300),)
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Card(
                                  color: myColors.mywhite,
                                  margin: EdgeInsets.fromLTRB(5, 10, 30, 5),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Row(
                                      children: [
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              icon: SvgPicture.asset(
                                                "assets/images/ic_dob_grey.svg",
                                                width: 24,
                                                height: 24,
                                              ),
                                              value: extselectedValue2,
                                              items:itemsMonth.map((item) => DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style:  TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ))
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  extselectedValue2 = value as String;
                                                });
                                              },
                                              hint:Text("Select Month",
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
                              ),
                            ],
                          ),*/
                          InkWell(
                            onTap: (){
                              showMonthPicker(
                                context: context,
                                firstDate: DateTime(DateTime.now().year - 102, 1),
                                lastDate: DateTime(DateTime.now().year + 1, 0),
                                initialDate: selectedDate ?? initialDate,
                                locale: Locale("en"),
                              ).then((date) {
                                if (date != null) {
                                  setState(() {
                                    selectedDate = date;
                                    String formattedDate = DateFormat('MMM-yyyy').format(date);
                                    print("selectedDate >>>>"+formattedDate.toString());
                                    selectedyear = formattedDate.toString();
                                  });
                                }
                              });
                            },
                            child: Card(
                              color: myColors.mywhite,
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.fromLTRB(10, 12, 10, 10),
                                child:Row(
                                  children: [
                                    Text(selectedyear,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.normal,
                                          color: myColors.lightblue,
                                          fontWeight: FontWeight.w300),),
                                    Spacer(),
                                    SvgPicture.asset(
                                      "assets/images/ic_dob_grey.svg",
                                      width: 24,
                                      height: 24,
                                    )
                                  ],
                                )
                                /*DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      icon: SvgPicture.asset(
                                        "assets/images/ic_dob_grey.svg",
                                        width: 24,
                                        height: 24,
                                      ),
                                      value: extselectedValue,
                                      items:items.map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          extselectedValue = value as String;
                                        });
                                      },
                                      hint:Text("Select Year/Month",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            color: myColors.lightblue,
                                            fontWeight: FontWeight.w300),)
                                  ),
                                )*/,
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
                              "Is the current cancer new or has it returned (recurred)?",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: myColors.lightblue,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Row(
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
                                          value: this.ischeck_NewCancer,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.ischeck_NewCancer = value!;
                                              this.ischeck_NewCancer2 = false;
                                              this.check_cancer_type = false;
                                              if(this.ischeck_NewCancer){
                                                current_cancer_type = "New Cancer";
                                              }
                                              else{
                                                current_cancer_type = "";
                                              }

                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(00, 00, 20, 0),
                                        child: Container(
                                          alignment: Alignment.topLeft,

                                          child: Text(
                                            "New Cancer",
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
                                Spacer(),
                                Container(
                                  child: Row(
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
                                          value: this.ischeck_NewCancer2,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.ischeck_NewCancer2 = value!;
                                              this.ischeck_NewCancer = false;

                                              if(this.ischeck_NewCancer2){
                                                current_cancer_type = "Recurred Cancer";
                                                check_cancer_type = true;
                                              }
                                              else{
                                                current_cancer_type = "";
                                                check_cancer_type = false;
                                              }

                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(00, 00, 20, 0),
                                        child: Container(
                                          alignment: Alignment.topLeft,

                                          child: Text(
                                            "Recurred Cancer",
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
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    /*check_cancer_type==true?Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Text(
                              "Do you have metastatic or advanced cancer (cancer in more than one organ)?",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: myColors.lightblue,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Row(
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
                                          value: this.ischeck_organ,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.ischeck_organ = value!;
                                              this.ischeck_organ2 = false;
                                              if(this.ischeck_organ){
                                                // current_cancer_type = "New Cancer";
                                                check_organ_status = true;
                                              }
                                              else{
                                                // current_cancer_type = "";
                                                check_organ_status = false;
                                              }

                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(00, 00, 20, 0),
                                        child: Container(
                                          alignment: Alignment.topLeft,

                                          child: Text(
                                            "Yes",
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
                               SizedBox(width: 100,),
                                Container(
                                  child: Row(
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
                                          value: this.ischeck_organ2,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.ischeck_organ2 = value!;
                                              this.ischeck_organ = false;
                                              check_organ_status = false;
                                              if(this.ischeck_organ2){
                                                // current_cancer_type = "Recurrent Cancer";
                                              }
                                              else{
                                                // current_cancer_type = "";
                                              }

                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(00, 00, 20, 0),
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "No",
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
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ):Container(),
                    check_organ_status==true?Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Container(
                              alignment: Alignment.centerLeft,

                              child: Text(
                                "Do you know which other organs have cancer, other than primary?",
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
                                itemCount: organslist.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (organslist[index].ischeck==false) {
                                            setState(() {
                                              organslist[index].ischeck = true;
                                            });
                                          } else {
                                            setState(() {
                                              organslist[index].ischeck = false;
                                            });
                                          }
                                          organsListItem(
                                            title: organslist[index].title,
                                            ischeck: organslist[index].ischeck,

                                          );
                                        });
                                      },
                                      child: organsListItem(
                                        title: organslist[index].title,
                                        ischeck: organslist[index].ischeck,

                                      ),
                                    ),
                                  );
                                },
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: new BouncingScrollPhysics()),
                          ),
                        ],
                      ) ,):Container(),*/

                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Container(
                        alignment: Alignment.centerLeft,

                        child: Text(
                          "What is the stage of your cancer?",
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
                            return Container(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    for(int i = 0; i < languagelist.length; i++) {
                                      if (i == index) {
                                        setState(() {
                                          languagelist[index].ischeck = true;
                                          stagecount = i.toString();
                                        });
                                      } else {
                                        setState(() {
                                          languagelist[i].ischeck = false;
                                        });
                                      }
                                    }
                                    ProductListItem(
                                      title: languagelist[index].title,
                                      ischeck: languagelist[index].ischeck,

                                    );
                                  });
                                },
                                child: ProductListItem(
                                  title: languagelist[index].title,
                                  ischeck: languagelist[index].ischeck,

                                ),
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
              padding:  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  bool flag = false;
                  for(int i=0;i<languagelist.length;i++){
                    if(languagelist[i].ischeck){
                      flag = true;
                      break;
                    }
                  }

                 /* if(extselectedValue=="Select Year"){
                    UtilityHlepar().getToast("Please select year.");
                  }
                  else if(extselectedValue2=="Select Month"){
                    UtilityHlepar().getToast("Please select month.");
                  }
                  else*/

                  if(selectedyear=="Select Year/Month"){
                    UtilityHlepar().getToast("Please select date.");
                  }
                 else if(current_cancer_type==""){
                    UtilityHlepar().getToast("Please select cancer type.");
                  }
                  else if(!flag){
                    UtilityHlepar().getToast("Please select cancer stage.");
                  }
                  else{
                     Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Patient_Setup_Profile4(stagecount:stagecount,cancertype:current_cancer_type,cancerdate:selectedyear)));
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
  List<CancelModelClass> getCancelDataList() {
    final products = <CancelModelClass>[
      CancelModelClass("Stage 1", true),
      CancelModelClass("Stage 2", false),
      CancelModelClass("Stage 3", false),
      CancelModelClass("Stage 4", false)
    ];

    return products;
  }

  List<CancelModelClass> getorgansDataList() {
    final products = <CancelModelClass>[
      CancelModelClass("Brain", false),
      CancelModelClass("Bone", false),
      CancelModelClass("Lung", false),
      CancelModelClass("Liver", false),
      CancelModelClass("Kidney", false),
      CancelModelClass("Other", false)
    ];

    return products;
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


class organsListItem extends StatefulWidget {
  String title;
  bool ischeck;

  organsListItem({required this.title, required this.ischeck});

  @override
  State<organsListItem> createState() => _organsListItemState();
}

class _organsListItemState extends State<organsListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 15, 5,5),

        child: Row(
          children: [
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