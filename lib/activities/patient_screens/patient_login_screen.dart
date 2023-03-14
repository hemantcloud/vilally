import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitally/activities/patient_screens/patient_verify_otp_screen.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../utils/UtilityHlepar.dart';

class Patient_login extends StatefulWidget {
  const Patient_login({Key? key}) : super(key: key);

  @override
  _Patient_loginState createState() => _Patient_loginState();
}

class _Patient_loginState extends State<Patient_login>{
  var otpController = new TextEditingController();
  String countrycode="+91";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {

    });
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
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 00, 0, 0),
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/img_splash_logo.png",width: 85,height: 104,)
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                    child: Container(
                      alignment: Alignment.center,

                      child: const Text(
                        "Enter your phone Number",
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
                    child: Card(
                      color: myColors.mywhite,
                      margin: const EdgeInsets.fromLTRB(36, 40, 36, 20),
                      elevation: 2,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          CountryCodePicker(
                            onChanged: (e){
                              countrycode = e.dialCode.toString();
                              print("country code >>>"+countrycode);
                            },
                            initialSelection: 'IN',
                            favorite: ['+91','IN'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,

                          ),
                          Container(
                            height:50,
                            width: 0.5,
                            color: myColors.lightgrey2,
                          ),
                          const VerticalDivider(
                            color: Color(0xffC4C4C4),
                            thickness: 1.3,
                          ),
                          Expanded(
                            child: TextField (
                              controller: otpController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(

                                fontSize:15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Color(0xff868889),),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter phone number',
                                hintStyle:TextStyle(fontSize: 15, color: Color(0xff868889)), isDense: true,
                                counter: Offstage(),
                                contentPadding: EdgeInsets.symmetric(horizontal:20),

                              ),
                              maxLines: 1,
                              maxLength:10,
                              cursorColor:const Color(0xffEF7922) ,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                    child: InkWell(
                      onTap: () {
                        String mobile = otpController.text.toString();
                        if(mobile.isEmpty){
                          UtilityHlepar().getToast("Please enter mobile number.");
                        }
                        else if(mobile.length<4){
                          UtilityHlepar().getToast("Please enter valid mobile number.");
                        }
                        else{
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Patient_Verify_otp(number:mobile,countrycode:countrycode,)));
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
                            "Next",
                            style: TextStyle(
                                color: myColors.mywhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

          ),
        )
    );
  }
}