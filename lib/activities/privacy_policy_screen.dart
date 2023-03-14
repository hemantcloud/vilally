import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../apiserver/allurls.dart';
import '../modelclass/response/PrivacyPolicyResponse.dart';
import '../utils/Utility.dart';
import 'dart:convert' as convert;

import '../utils/UtilityHlepar.dart';

class Privacy_Policy extends StatefulWidget {
  const Privacy_Policy({Key? key}) : super(key: key);

  @override
  _Privacy_PolicyState createState() => _Privacy_PolicyState();
}

class _Privacy_PolicyState extends State<Privacy_Policy>{
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
                "Privacy Policy",
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
                child:Html(data:termsdata
                )
                /*Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
                   maxLines: 2,
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

    var response = await http.post(Uri.parse(APIservices.privacypolicyurl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    PrivacyPolicyResponse responsemain = await PrivacyPolicyResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);
      termsdata = responsemain.data!.data.toString();
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