import 'package:vitally/modelclass/response/ViewDoctorPatientSymptomsResponse.dart';

class ViewDoctorPatientSymptomsModelClass{
  late Stymptoms title;
  late bool ischeck;


  ViewDoctorPatientSymptomsModelClass(this.title, this.ischeck);

  void setTitle(Stymptoms getTitle){
    title = getTitle;
  }

  void setIscheck(bool ischeck1){
    ischeck = ischeck1;
  }
  Stymptoms getTitle(){
    return title;
  }

  bool getIsCheck(){
    return ischeck;
  }
}