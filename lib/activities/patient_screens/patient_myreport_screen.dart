import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitally/activities/patient_screens/patient_upload_report_screen.dart';
import 'package:vitally/colortheme/colortheme.dart';

import '../../modelclass/currentmoodmodelclass.dart';

class Patient_MyReport extends StatefulWidget {
  const Patient_MyReport({Key? key}) : super(key: key);

  @override
  _Patient_MyReportState createState() => _Patient_MyReportState();
}

class _Patient_MyReportState extends State<Patient_MyReport>{
  List<CurrentMoodModelClass> productlist = <CurrentMoodModelClass>[];
  @override
  void initState() {
    super.initState();
    productlist = getProductList();
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
                "My Reports",
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
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Patient_UploadReport()));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Image.asset("assets/images/img_add_blue_bg.png" ,width: 24, height: 24,),
                ),
              )
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: GridView.builder(
                  shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 1.2/ 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: productlist.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        alignment: Alignment.center,
                        child: ProductListItem(
                                  imagePath: productlist[index].getimage(),

                                  title: productlist[index].getTitle(),
                                ),
                      );
                    }),
              ),
            ),
          ),
        )
    );
  }
  List<CurrentMoodModelClass> getProductList() {
    List<CurrentMoodModelClass> productbook = <CurrentMoodModelClass>[];
    CurrentMoodModelClass sliderModelbook1 = new CurrentMoodModelClass("Blood Test","assets/images/img_myreport_demo.png",false);
    CurrentMoodModelClass sliderModelbook2 = new CurrentMoodModelClass("Covid Test","assets/images/img_myreport_demo.png",false);
    CurrentMoodModelClass sliderModelbook3 = new CurrentMoodModelClass("Blood Test","assets/images/img_myreport_demo.png",false);
    CurrentMoodModelClass sliderModelbook4 = new CurrentMoodModelClass("Covid Test","assets/images/img_myreport_demo.png",false);

    productbook.add(sliderModelbook1);
    productbook.add(sliderModelbook2);
    productbook.add(sliderModelbook3);
    productbook.add(sliderModelbook4);

    return productbook;
  }
}
class ProductListItem extends StatelessWidget {
  String imagePath;
  String title;

  ProductListItem({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          Container(
              color: myColors.lightgrey6,
            height: 220,
            //  margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Center(
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 220,
                ),
              )
          ),
          Container(
            alignment: Alignment.center,
              width: 200,
              child: Text(title,
                style: TextStyle(
                  color: myColors.myblack,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                // Only numbers can be entered
              )),
          Container(
              alignment: Alignment.center,
              width: 200,
              child: Text("Delete",
                style: TextStyle(
                  color: myColors.myred,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                // Only numbers can be entered
              )),
        ],
      ),
    );
  }
}
