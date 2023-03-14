import 'package:vitally/modelclass/response/ViewDoctorPatientMedicineListResponse.dart';
import 'package:vitally/modelclass/response/ViewPatientMedicineListResponse.dart';

class PatientViewMedicineList1{
  late String title;
  late String productslist;
  late Items parameter;


  PatientViewMedicineList1(this.title,this.productslist,this.parameter);

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setPatientMedication(Items getPatientMedication){
    parameter = getPatientMedication;
  }

  void setProductList(String getTitle){
    productslist = getTitle;
  }


  String getTitle(){
    return title;
  }

  Items getPatientMedication(){
    return parameter;
  }

  String getProductList(){
    return productslist;
  }

}