import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:vitally/colortheme/colortheme.dart';
import 'package:vitally/modelclass/response/TermsAndConditionResponse.dart';

import '../apiserver/allurls.dart';
import '../utils/Utility.dart';
import 'dart:convert' as convert;

import '../utils/UtilityHlepar.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  _TermsAndConditionState createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition>{
  String termsdata = "";
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      this.TermsAndConditionApi(context);
    });
    // Could do this in one line: Future.delayed(Duration.zero, this._getCategories);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
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
                "Terms and Condition",
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

            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20,20),
                alignment: Alignment.centerLeft,
                child: Html(data:termsdata,)
                /*Text(
                  termsdata,
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    color: myColors.lightblue,
                    fontWeight: FontWeight.w300,

                  ),
                )*/,
              ),
            ),
          ),
        )
    );
  }
  Future<void> TermsAndConditionApi(BuildContext context) async {

    Utility.ProgressloadingDialog(context, true);
    var request = {};


    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.termsandconditionurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    TermsAndConditionResponse responsemain = await TermsAndConditionResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      termsdata = responsemain.data!.tnc.toString();
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