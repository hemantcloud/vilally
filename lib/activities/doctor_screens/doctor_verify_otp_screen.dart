import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../apiserver/allurls.dart';
import '../../modelclass/response/CheckAccountResponse.dart';
import '../../utils/Utility.dart';
import '../../utils/UtilityHlepar.dart';
import 'doctor_dashboard_screen.dart';
import 'doctor_setup_profile1.dart';
import 'dart:convert' as convert;

class doctor_Verify_otp extends StatefulWidget {
  String number;
  String countrycode;
   doctor_Verify_otp({Key? key,required this.number,required this.countrycode}) : super(key: key);

  @override
  _doctor_Verify_otpState createState() => _doctor_Verify_otpState();
}

class _doctor_Verify_otpState extends State<doctor_Verify_otp>{
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  bool isotp = false;
  String otp = "";
  bool isresend = false;
  bool load = false;
  bool otpload = false;
  late String verificationcode;
  SharedPreferences? pre;
  String? profile;
  bool check = false;
  late Timer timer;
  Color textcolor = Colors.black38;
  TextEditingController otpController = TextEditingController();
  FocusNode numberfocusnode = FocusNode();
  late String _verificationId;
  bool autovalidate = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String deviceid="";
  String devicetype="";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    _verifyPhoneNumber();
    otpController.text = otp;
    _getId();
    setState(() {

    });
    print("phone${widget.number}");
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
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
                  margin:const EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0)  ,
                  child: SvgPicture.asset(
                    "assets/images/ic_back_blue.svg",
                    width: 24,
                    height: 24,
                  ),
                )),
            title: Container(

              child: const Text(
                "",
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    color: myColors.myblack,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/img_splash_logo.png",width: 85,height: 104,)
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                    child: Container(
                      alignment: Alignment.center,

                      child: const Text(
                        "Verify your phone Number",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: myColors.lightblue,
                            fontWeight: FontWeight.w600,
                            fontSize: 22),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: myColors.lightgrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Form(
                      key: formKey,
                      child: Padding(
                          padding:  const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 6,
                            obscureText: false,
                            obscuringCharacter: '*',
                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            validator: (v) {

                            },
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 60,
                                fieldWidth: 50,
                                activeFillColor: Colors.white,
                                inactiveColor: Colors.white,
                                inactiveFillColor: Colors.white
                            ),
                            cursorColor: Colors.black,
                            animationDuration: const Duration(milliseconds: 300),
                            enableActiveFill: true,
                            errorAnimationController: errorController,
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            boxShadows: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (v) {
                              debugPrint("Completed");
                            },
                            onChanged: (value) {
                              debugPrint(value);
                              setState(() {
                                currentText = value;
                              });
                            },
                            beforeTextPaste: (text) {
                              debugPrint("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          )),
                    ),
                  ),
                  Padding(
                    padding:  const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                    child: InkWell(
                      onTap: () {
                        String otp = textEditingController.text;
                        if(otp.isEmpty){
                          UtilityHlepar().getToast("Please enter otp.");
                        }
                        else if(otp.length<6){
                          UtilityHlepar().getToast("Please enter valid otp.");
                        }
                        else{
                          verifyOtp(otp);
                        }
                      },
                      child: Container(
                        height: Mysize.height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            /* color: myColors.mythmes,*/
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/images/img_btn_bg.png"
                                ),
                                fit: BoxFit.cover
                            )),
                        child: const Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: myColors.mywhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 00, 20, 0),
                    child: Container(
                      alignment: Alignment.center,

                      child: const Text(
                        "Didn't receive the code?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: myColors.myblack,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      _verifyPhoneNumber();
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                      alignment: Alignment.center,

                      child:RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Resend ', style: TextStyle(
                                color: myColors.lightblue,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),),
                            TextSpan(text: ' a New Code',style: TextStyle(
                                color: myColors.lightblue,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ),
          ),
        )
    );
  }
  void _verifyPhoneNumber() async {
    setState(() {
      load = true;
    });
    if (mounted)
      setState(() {
        load = true;
      });

    final PhoneVerificationFailed verificationFailed = (FirebaseAuthException authException) {
      setState(() {
        load = false;
      });
      Fluttertoast.showToast(msg: "Invalid otp");
      print(authException.code);
      print(authException.message);
    };

    final PhoneCodeSent codeSent = (String verificationId, int forceResendingToken) async {
      print("codeSent");
      print(verificationId);
      setState(() {
        load = false;
      });
      Fluttertoast.showToast(msg: "Please check your phone for the verification code.");
      _verificationId = verificationId;
    } as PhoneCodeSent;

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {

      _verificationId = verificationId;
    };

    PhoneVerificationCompleted verificationCompleted = (PhoneAuthCredential phoneAuthCredential) async {
      print("verificationCompleted");
      setState(() {
        load = false;
      });

    };

    await _auth
        .verifyPhoneNumber(
        phoneNumber: widget.countrycode + widget.number,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
        .then((value) {
    }).catchError((onError) {
      print(onError);
    });

    if (mounted)
      setState(() {
        load = false;
      });
  }
  verifyOtp(String otpText) async {
    _signInWithPhoneNumber(otpText);
  }

  void _signInWithPhoneNumber(String otp) async {


    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );
      final User? user = (await _auth.signInWithCredential(credential)).user;
      final User? currentUser = _auth.currentUser;
      assert(user!.uid == currentUser!.uid);

      if (user != null) {
        checkaccount(context);
      } else {
        UtilityHlepar().getToast("Sign in failed.");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Invalid otp");
    }
  }
  Future<void> checkaccount(BuildContext context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.ProgressloadingDialog(context, true);
    var request = {};
    request['country_code'] = widget.countrycode.replaceAll("+", "");
    request['phone'] = widget.number;
    request['device'] = devicetype;
    request['device_id'] = deviceid;
    request['fcm_token'] = prefs.getString("fcmtoken");

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(Uri.parse(APIservices.doctorcheckaccounturl),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Accept-Language": prefs.getString("language").toString(),
        });
    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    CheckAccountResponse responsemain = await CheckAccountResponse.fromJson(jsonResponse);
    if (jsonResponse['status'] == true) {
      Utility.ProgressloadingDialog(context, false);

      if(responsemain.data!.type=="existing_user"){
        // UtilityHlepar().getToast(responsemain.message.toString());
        prefs.setString("token",responsemain.data!.token.toString());
        prefs.setBool("is_user_login",true);
        prefs.setBool("is_patient",false);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            const Doctor_Dashboard()), (Route<dynamic> route) => false);
      }
      else{
        // UtilityHlepar().getToast(responsemain.message.toString());
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            doctor_Setup_Profile1(countrycode:widget.countrycode.replaceAll("+", ""),mobilenumber:widget.number)), (Route<dynamic> route) => false);
      }
      setState(() {

      });
    } else {
      Utility.ProgressloadingDialog(context, false);
      UtilityHlepar().getToast(responsemain.message.toString());
      setState(() {

      });
    }

    return;
  }
  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceid=iosDeviceInfo.identifierForVendor!;
      devicetype="ios";
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceid=androidDeviceInfo.androidId!;
      devicetype="android";
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }
}