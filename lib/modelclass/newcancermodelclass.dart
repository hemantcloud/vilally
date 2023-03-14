import 'dart:ffi';

class NewCancelModelClass{
  late bool ischeck;
  int? id;
  String? name;
  String? status;


  NewCancelModelClass( this.ischeck,this.id,this.name,this.status);


  void setId(int getid){
    id = getid;
  }

  void setName(String getname){
    name = getname;
  }
  void setStatus(String getstatus){
    status = getstatus;
  }

  void setIscheck(bool ischeck1){
    ischeck = ischeck1;
  }

  bool getIsCheck(){
    return ischeck;
  }

  int? getId(){
    return id;
  }
  String? getName(){
    return name;
  }
  String? getStatus(){
    return status;
  }

}