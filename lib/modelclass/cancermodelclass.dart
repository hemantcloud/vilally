class CancelModelClass{
  late String title;
  late bool ischeck;


  CancelModelClass(this.title, this.ischeck);

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setIscheck(bool ischeck1){
    ischeck = ischeck1;
  }
  String getTitle(){
    return title;
  }

  bool getIsCheck(){
    return ischeck;
  }
}