import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/activities/patient_screens/Patient_Setup_profile3.dart';
import 'package:vitally/activities/patient_screens/patient_dashboard.dart';
import 'package:vitally/colortheme/colortheme.dart';
import 'choose_language_screen.dart';
import 'choose_profile_screen.dart';
import 'doctor_screens/doctor_dashboard_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String fcmtoken="";
  late FirebaseMessaging messaging;

  SharedPreferences? prefs;
  void main() async {
    await Firebase.initializeApp();

    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value){
      print("fcm token>>>>"+value.toString());
      fcmtoken = value.toString();
      prefs?.setString("fcmtoken",fcmtoken);
    });
  }
  getSharedPreferences () async
  {
    prefs = await SharedPreferences.getInstance();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();


    bool? is_language_page = sharedPreferences.getBool("is_language_page");
    if(is_language_page==true){
      bool? is_user_login = sharedPreferences.getBool("is_user_login");
      print("is_user_login >>>>>"+is_user_login.toString());
      if(is_user_login==true){
        bool? user_type = sharedPreferences.getBool("is_patient");
        if(user_type==true){
          bool? patient_setup1 = sharedPreferences.getBool("patient_setup1");
          print("patient_setup1 >>>>>"+patient_setup1.toString());
          if(patient_setup1==true){
            Timer(
                Duration(seconds: 5),
                    () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Patient_Setup_Profile3())));
          }
          else{
            Timer(
                Duration(seconds: 5),
                    () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Patient_Dashboard())));
          }
        }
        else{
          Timer(
              Duration(seconds: 5),
                  () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Doctor_Dashboard())));
        }

      }
      else{
        Timer(
            Duration(seconds: 5),
                () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Choose_profile())));
      }
    }
    else{
      Timer(
          Duration(seconds: 5),
              () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Choose_language())));
    }



   /* bool? is_language_page = sharedPreferences.getBool("is_language_page");
    if(is_language_page==true){
      bool? is_user_login = sharedPreferences.getBool("is_user_login");
      if(is_user_login==true){
        bool? user_type = sharedPreferences.getBool("is_patient");
        if(user_type==true){
          Timer(
              Duration(seconds: 5),
                  () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Patient_Dashboard())));
        }
        else{
          Timer(
              Duration(seconds: 5),
                  () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Doctor_Dashboard())));
        }

      }
      else{
        Timer(
            Duration(seconds: 5),
                () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Choose_profile())));
      }
    }
    else{
      Timer(
          Duration(seconds: 5),
              () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Choose_language())));
    }*/
  }
  void initState() {
    super.initState();
    getSharedPreferences();
    main();
  }

  @override
  Widget build(BuildContext context) {

    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
          backgroundColor: myColors.screen_bg,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("assets/images/img_splash_logo.png",width:180,height: 230,),
              ),
            ],
          )),
    );
  }
}
