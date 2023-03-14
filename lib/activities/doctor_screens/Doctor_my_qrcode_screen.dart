import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/response/DoctorViewQRCodeResponse.dart';
import '../../utils/Utility.dart';
import 'dart:convert' as convert;

import '../../utils/UtilityHlepar.dart';


class Doctor_My_Qrcode extends StatefulWidget {
  const Doctor_My_Qrcode({Key? key}) : super(key: key);

  @override
  _Doctor_My_QrcodeState createState() => _Doctor_My_QrcodeState();
}

class _Doctor_My_QrcodeState extends State<Doctor_My_Qrcode> {
  String qrcodeimage = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewDoctorQRCodeApi(context);
    setState(() {});
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
                "My QR",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: myColors.lightblue,
                  fontWeight: FontWeight.w700,

                ),
              ),
            ),
            actions: [
            ],
          ),
          body: SafeArea(
            child: Center(
              child: SvgPicture.network(qrcodeimage),
            ),
          ),

        ));
  }
  Future<void> ViewDoctorQRCodeApi(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.doctorviewqrcodeurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
          "Authorization": "Bearer "+prefs.getString("token").toString()
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    DoctorViewQRCodeResponse responsemain = await DoctorViewQRCodeResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      qrcodeimage = APIservices.imagebaseurl+responsemain.data!.qrcode.toString();
      print("qrcodeimage >>>>>"+qrcodeimage);
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
