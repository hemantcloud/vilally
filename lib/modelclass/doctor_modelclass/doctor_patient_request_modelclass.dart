class doctor_patient_request_modelclass{
  late String name;
  late String count;

  doctor_patient_request_modelclass(this.name, this.count);

  void setname(String getname){
    name = getname;
  }
  String getname(){
    return name;
  }

  void setcount(String getcount){
    count = getcount;
  }
  String getcount(){
    return count;
  }

}