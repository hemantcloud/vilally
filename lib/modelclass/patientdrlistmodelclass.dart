class PatientDrListModelClass{
  late String title;
  late String status;
  late String number;


  PatientDrListModelClass(this.title, this.status, this.number);

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setstatus(String ischeck1){
    status = ischeck1;
  }
  void setnumber(String ischeck1){
    number = ischeck1;
  }
  String getTitle(){
    return title;
  }

  String getstatus(){
    return status;
  }
  String getnumber(){
    return number;
  }
}