import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vitally/activities/patient_screens/patient_tab1_screen.dart';
import 'package:vitally/activities/patient_screens/patient_tab2_screen.dart';
import 'package:vitally/activities/patient_screens/patient_tab3_screen.dart';
import 'package:vitally/activities/patient_screens/patient_tab4_screen.dart';
import 'package:vitally/colortheme/colortheme.dart';


class Patient_Dashboard extends StatefulWidget {
  Patient_Dashboard({Key? key}) : super(key: key);

  @override
  _Patient_DashboardState createState() => _Patient_DashboardState();
}

class _Patient_DashboardState extends State<Patient_Dashboard> {
  var _currentIndex = 0;
  @override
  void initState() {
    super.initState();
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
                /// Home
                SalomonBottomBarItem(
                  icon: SvgPicture.asset("assets/images/ic_tab1_bg.svg"),
                  title: Text("Home"),
                  selectedColor: Color(0xff0281C6),
                    unselectedColor: Color(0xff406075),
                    activeIcon: SvgPicture.asset("assets/images/ic_tab1_bg.svg")
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: SvgPicture.asset("assets/images/ic_tab2_bg.svg"),
                  title: Text("Chart"),
                  selectedColor: Color(0xff0281C6),
                    unselectedColor: Color(0xff406075),
                  activeIcon: SvgPicture.asset("assets/images/ic_tab2_bg.svg")
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: SvgPicture.asset("assets/images/ic_tab3_bg.svg"),
                  title: Text("Reminder"),
                  selectedColor: Color(0xff0281C6),
                    unselectedColor: Color(0xff406075),
                    activeIcon: SvgPicture.asset("assets/images/ic_tab3_bg.svg")
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: SvgPicture.asset("assets/images/ic_tab4_bg.svg"),
                  title: Text("Profile"),
                  selectedColor: Color(0xff0281C6),
                  unselectedColor: Color(0xff406075),
                    activeIcon: SvgPicture.asset("assets/images/ic_tab4_bg.svg"),

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
        return Patient_Tab1();
        break;
      case 1:
        return Patient_Tab2();
        break;
      case 2:
        return Patient_Tab3();
        break;
      default:
        return Patient_Tab4();
        break;
    }
  }
}
