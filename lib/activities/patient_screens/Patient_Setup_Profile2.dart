import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:show_more_text_popup/show_more_text_popup.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../modelclass/cancermodelclass.dart';
import '../../utils/UtilityHlepar.dart';
import 'Patient_Setup_profile3.dart';

class Patient_Setup_Profile2 extends StatefulWidget {
  const Patient_Setup_Profile2({Key? key}) : super(key: key);

  @override
  _Patient_Setup_Profile2State createState() => _Patient_Setup_Profile2State();
}

class _Patient_Setup_Profile2State extends State<Patient_Setup_Profile2> {
  List<CancelModelClass> languagelist = <CancelModelClass>[];
  List<CancelModelClass> filteredUsers = <CancelModelClass>[];
  double percent = 0.0;

  final String text="Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  late String firstHalf;
  late String secondHalf;
  GlobalKey key = new GlobalKey();
  bool flag = true;
  final SearchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    SearchController.dispose();
  }

  @override
  void initState() {
    super.initState();
    languagelist = getCancelDataList();
    filteredUsers = languagelist;
    late Timer timer;
    timer = Timer.periodic(Duration(milliseconds:1000),(_){
      setState(() {
        // percent+=10;
        percent = 40;
        if(percent >= 40){
          timer.cancel();
          // percent=0;
        }
      });
    });
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

              child: Text(
                "",
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    color: myColors.myblack,
                    fontWeight: FontWeight.w800),
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
                      "assets/images/img_progress1_bg.png",
                      width: double.infinity,
                      height: 30,
                    )*/
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
                        "Welcome Dear Warrior!",
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
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                    padding:  EdgeInsets.fromLTRB(15, 12, 15, 12),
                    decoration: BoxDecoration(
                        border: Border.all(color: myColors.mythmes),
                      borderRadius: BorderRadius.all(
                          Radius.circular(20.0)
                      ),
                    ),

                    child:Row(
                      children: [
                        Image.asset(
                          "assets/images/img_search_lightblue.png",
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 20),
                        Container(
                            width: 230,
                            child: TextField(
                              onChanged: (text) {
                                setState(() {
                                  filteredUsers = languagelist
                                      .where((u) => (u.title.toLowerCase().contains(text.toLowerCase()) || u.title.toLowerCase().contains(text.toLowerCase()))).toList();
                                });
                              },
                              controller: SearchController,
                              style: TextStyle(
                                color: myColors.myblack,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                              decoration: InputDecoration.collapsed(
                                hintText: 'Search',
                                fillColor: myColors.lightgrey3,
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              // Only numbers can be entered
                            ))
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,

                          child: Text(
                            "Which type of Primary cancer do you have?",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: myColors.lightblue,
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                          ),
                        ),
                        SizedBox(width: 5,),
                        InkWell(

                          onTap: (){
                            showMoreText(text,context);
                          },
                          key: key,
                          child: SvgPicture.asset(
                            "assets/images/ic_info_bg.svg",
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: ListView.builder(
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if(filteredUsers[index].ischeck){
                                  filteredUsers[index].setIscheck(false);
                                }
                                else{
                                  int count=0;
                                 for(int i=0;i<filteredUsers.length;i++){
                                   if(filteredUsers[i].ischeck){
                                     count++;
                                   }
                                 }
                                 if(count<2){
                                   filteredUsers[index].setIscheck(true);
                                 }
                                 else{
                                   UtilityHlepar().getToast("you can select a maximum of 2 cancer types.");
                                 }

                                }
                                ProductListItem(
                                  title: filteredUsers[index].title,
                                  ischeck: filteredUsers[index].ischeck,
                                );
                              });
                            },
                            child: ProductListItem(
                              title: filteredUsers[index].title,
                              ischeck: filteredUsers[index].ischeck,
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
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  bool flag = false;
                  for(int i=0;i<languagelist.length;i++){
                    if(languagelist[i].ischeck){
                      print("check status>>>>"+languagelist[i].ischeck.toString());
                      flag = true;
                      break;
                    }

                  }
                  if(!flag){
                    UtilityHlepar().getToast("Please select any cancer type.");
                  }
                  else{
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Patient_Setup_Profile3()));
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
      CancelModelClass("Adrenal Cancer", true),
      CancelModelClass("Bone Cancer", false),
      CancelModelClass("Breast Cancer", false),
      CancelModelClass("Colon Cancer", false),
      CancelModelClass("Leukimia", false),
      CancelModelClass("Lung Cancer", false),
      CancelModelClass("Pancreatic Cancer", false),

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
        // padding: EdgeInsets.fromLTRB(12, 5, 12,5),
        child: Row(
          children: [
            /*Container(
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
                value:widget.ischeck,

                onChanged: (bool? value) {
                  setState(() {
                    widget.ischeck = value!;
                  });
                },
              ),
            ),*/
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

