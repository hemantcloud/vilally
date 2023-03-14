import 'package:vitally/modelclass/response/ViewDoctorPatientDailyResponse.dart';

class ViewDoctorPatientDailySymptoms{
  late String images;
  late SymptomsReport data;


  ViewDoctorPatientDailySymptoms(this.images,this.data);

  void setimage(String getimage){
    images = getimage;
  }

  void setdata(SymptomsReport ischeck1){
    data = ischeck1;
  }
  String getimages(){
    return images;
  }

  SymptomsReport getdata(){
    return data;
  }
}