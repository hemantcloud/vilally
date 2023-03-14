import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitally/activities/patient_screens/patient_view_dr_details_scan_screen.dart';
import 'package:vitally/colortheme/colortheme.dart';


class Patient_AddDr extends StatefulWidget {
  const Patient_AddDr({Key? key}) : super(key: key);

  @override
  _Patient_AddDrState createState() => _Patient_AddDrState();
}

class _Patient_AddDrState extends State<Patient_AddDr> {
  String _scanBarcode = 'Unknown';

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
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: myColors.screen_bg,
            leading: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: SvgPicture.asset(
                    "assets/images/ic_back_blue.svg",
                    width: 24,
                    height: 24,
                  ),
                )),
            title: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Add Doctors",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: myColors.lightblue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            actions: [],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Center(
                    child: Image.asset(
                      "assets/images/img_barcode_demo_bg.png",
                      width: 151,
                      height: 151,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Steps",
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            color: myColors.lightblue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "1. ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: myColors.lightblue,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Scan Doctor's QR code",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: myColors.lightblue,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "2. ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: myColors.lightblue,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Ensure Doctor approves your request",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: myColors.lightblue,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 40, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        scanBarcodeNormal();
                      },
                      child: Container(
                        height: Mysize.height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            /* color: myColors.mythmes,*/
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/img_btn_bg.png"),
                                fit: BoxFit.cover)),
                        child: Center(
                          child: Text(
                            "Scan Now",
                            style: TextStyle(
                                color: myColors.mywhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
        ));
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);
      if (!mounted) return;

      setState(() {
        _scanBarcode = barcodeScanRes;
        print("_scanBarcode >>>>>>>>"+_scanBarcode);
        if (_scanBarcode != "unknown") {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Patient_view_dr_details_scan(scanBarcode:_scanBarcode)));

        }
      });
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }
}
