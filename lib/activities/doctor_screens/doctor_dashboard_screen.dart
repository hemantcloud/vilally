import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../modelclass/doctor_modelclass/doctor_list_modelclass.dart';
import 'Doctor_Tab1.dart';
import 'Doctor_Tab2.dart';
import 'Doctor_Tab3.dart';


class Doctor_Dashboard extends StatefulWidget {
  const Doctor_Dashboard({Key? key}) : super(key: key);

  @override
  _Doctor_DashboardState createState() => _Doctor_DashboardState();
}

class _Doctor_DashboardState extends State<Doctor_Dashboard> {
  var _currentIndex = 0;
  List<DoctorListModelClass> languagelist = <DoctorListModelClass>[];
  @override
  void initState() {
    super.initState();
    languagelist = getCancelDataList();
  }
  Oncallback(){
    print("hello >>>>>");
    _currentIndex = 0;
    getPage(_currentIndex);
  }
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    var Mysize = MediaQuery.of(context).size;
    return MediaQuery(
        data: mediaQueryData.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: myColors.screen_bg,
          body: getPage(_currentIndex),
          bottomNavigationBar: Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            color: myColors.mywhite,
            child: SalomonBottomBar(
              currentIndex: _currentIndex,
              onTap: (i) => setState(
                      () => _currentIndex = i
              ),
              items: [
                SalomonBottomBarItem(
                    icon: SvgPicture.asset("assets/images/ic_tab1_bg.svg"),
                    title: Text("Home"),
                    selectedColor: Color(0xff0281C6),
                    unselectedColor: Color(0xff406075),
                    activeIcon: SvgPicture.asset("assets/images/ic_tab1_bg.svg")
                ),

                SalomonBottomBarItem(
                    icon: SvgPicture.asset("assets/images/ic_dr_tab2_bg.svg"),
                    title: Text("Request"),
                    selectedColor: Color(0xff0281C6),
                    unselectedColor: Color(0xff406075),
                    activeIcon: SvgPicture.asset("assets/images/ic_dr_tab2_bg.svg")
                ),

                SalomonBottomBarItem(
                    icon: SvgPicture.asset("assets/images/ic_tab4_bg.svg"),
                    title: Text("Profile"),
                    selectedColor: Color(0xff0281C6),
                    unselectedColor: Color(0xff406075),
                    activeIcon: SvgPicture.asset("assets/images/ic_tab4_bg.svg")
                ),
              ],
            ),
          ),
        )
    );
  }
  Widget getPage(int index) {
    switch (index) {
      case 0:
        return Doctor_Tab1();
        break;
      case 1:
        return Doctor_Tab2(Oncallback : Oncallback);
        break;
      case 2:
        return Doctor_Tab3();
        break;
      default:
        return Doctor_Tab1();
        break;
    }
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
}
class ProductListItem extends StatefulWidget {
  String name;
  String address;
  String score;


  ProductListItem({required this.name, required this.address,required this.score});

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Container(
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
                   widget.name[0],
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
                        widget.name,
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
                        widget.address,
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
                        widget.score,
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
      ),
    );
  }
}
