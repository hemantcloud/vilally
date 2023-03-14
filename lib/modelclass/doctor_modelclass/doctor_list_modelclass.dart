class DoctorListModelClass {
  late String name;
  late String address;
  late String Score;


  DoctorListModelClass(this.name, this.address, this.Score);

  void setTitle(String getname){
    name = getname;
  }
  String getname(){
    return name;
  }

  void setaddress(String getaddress){
    address = getaddress;
  }
  String getaddress(){
    return address;
  }

  void setScore(String getScore){
    Score = getScore;
  }
  String getScore(){
    return Score;
  }

}