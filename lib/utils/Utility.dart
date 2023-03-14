import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vitally/colortheme/colortheme.dart';


class Utility {

  static bool isEmail(String em) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  static ProgressloadingDialog(BuildContext context,bool status) {
    if(status){
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: /*CircleAvatar(
                radius: 50,
              backgroundColor: MainColor.ColorBlueapp,
              child: Image.asset("assets/images/pilot_plan_loader.gif",height: 50,width: 50,fit: BoxFit.fill,),
              )*/

              CircularProgressIndicator(color: myColors.mythmes,),
            );
          });
      // return pr.show();
    }else{
      Navigator.pop(context);
      // return pr.hide();
    }
  }

  static  hideKeyboard(){
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String DatefomatAMPM(String bigTime) {
    DateTime tempDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(bigTime);
    var dateFormat = DateFormat(
        "yyyy-MM-dd hh:mm a"); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, false).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));
    print("------------$createdDate");
    return createdDate;
  }

}