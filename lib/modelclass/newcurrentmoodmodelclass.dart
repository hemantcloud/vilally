class NewCurrentMoodModelClass{
  late String title;
  late String unselectedimage;
  late String selectedimage;
  late bool ischeck;

  NewCurrentMoodModelClass(this.title,this.unselectedimage,this.selectedimage, this.ischeck);

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

  void setunselectedimage(String ischeck1){
    unselectedimage = ischeck1;
  }
  String getunselectedimage(){
    return unselectedimage;
  }

  void setselectedimage(String ischeck1){
    selectedimage = ischeck1;
  }
  String getselectedimage(){
    return selectedimage;
  }
}