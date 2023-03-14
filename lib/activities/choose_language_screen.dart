import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../modelclass/languagemodelclass.dart';
import '../utils/UtilityHlepar.dart';
import 'choose_profile_screen.dart';

class Choose_language extends StatefulWidget {
  const Choose_language({Key? key}) : super(key: key);

  @override
  _Choose_languageState createState() => _Choose_languageState();
}

class _Choose_languageState extends State<Choose_language> {
  List<Language> languagelist = <Language>[];
  getSharedPreferences () async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("is_language_page", true);
    sharedPreferences.setString("language", "en");
    print("language >>>>"+sharedPreferences.get("language").toString());
  }
  @override
  void initState() {
    super.initState();
    getSharedPreferences();
    languagelist = getLanguageList();

    setState(() {

    });
  }
  List<Language> products = <Language>[
  Language('assets/images/img_en_bg.png', "English", true),
  Language('assets/images/img_hi_bg.png', "हिन्दी", false)];

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    var Mysize = MediaQuery.of(context).size;
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: myColors.screen_bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Container(
                  child: Text(
                    "Select Your preferred Language",
                    style: TextStyle(
                        color: myColors.lightblue,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 60, 20, 10),
                child: ListView.builder(
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
                            );
                          });
                        },
                        child: ProductListItem(
                          imagePath: products[index].imageAssetPath,
                          title: products[index].title,
                          ischeck: products[index].ischeck,

                        ),
                      );
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: new BouncingScrollPhysics()),
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
                bool check = false;
                int pos =-1;
                for(int i=0;i<products.length;i++){
                  if(products[i].ischeck){
                    pos = i;
                    check = true;
                    break;
                  }
                }
                if(!check){
                  UtilityHlepar().getToast("Please select any language");
                }
                else{
                 LanguageSet(pos);
                }
              },
              child: Container(
                height: Mysize.height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    /* color: myColors.mythmes,*/
                    image: DecorationImage(
                        image: AssetImage("assets/images/img_btn_bg.png"),
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
  List<Language> getLanguageList() {
    final products = <Language>[
      Language('assets/images/img_en_bg.png', "English", true),
      Language('assets/images/img_hi_bg.png', "हिन्दी", false),

    ];

    return products;
  }

  void LanguageSet(int pos) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(pos==0){
      sharedPreferences.setString("language", "en");
    }
    else{
      sharedPreferences.setString("language", "hi");
    }
    print("language >>>>"+sharedPreferences.get("language").toString());
     Navigator.of(context).push(MaterialPageRoute(
         builder: (BuildContext context) => Choose_profile()));
  }

}

class ProductListItem extends StatelessWidget {
  String imagePath;
  String title;
  bool ischeck;

  ProductListItem({required this.imagePath, required this.title, required this.ischeck});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
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
          padding: EdgeInsets.fromLTRB(12, 15, 12,15),
          child: Row(
            children: [
              Container(
                child: Image.asset(imagePath,width: 32,height: 32,),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child:  Text(
                  title,
                  style: TextStyle(
                      color: myColors.lightblue,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                )
                ,
              ),
              Spacer(),
              ischeck==true?Container(
                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Image.asset("assets/images/img_right_arrow_blue.png",width: 20,height: 20,),
              ):Container()
              ,
            ],
          ),
        ),
      ),
    );
  }
}

