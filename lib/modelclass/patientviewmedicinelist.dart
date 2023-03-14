import 'package:vitally/modelclass/response/ViewPatientMedicineListResponse.dart';

class PatientViewMedicineList{
  late String title;
  late List<PatientMedicationDose> productslist;
  late PatientMedication parameter;


  PatientViewMedicineList(this.title,this.productslist,this.parameter);

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setPatientMedication(PatientMedication getPatientMedication){
    parameter = getPatientMedication;
  }

  void setProductList(List<PatientMedicationDose> getTitle){
    productslist = getTitle;
  }


  String getTitle(){
    return title;
  }

  PatientMedication getPatientMedication(){
    return parameter;
  }

  List<PatientMedicationDose> getProductList(){
    return productslist;
  }

}