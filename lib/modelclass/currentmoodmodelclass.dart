class CurrentMoodModelClass{
  late String title;
  late String image;
  late bool ischeck;

  CurrentMoodModelClass(this.title,this.image, this.ischeck);

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

  void setimage(String ischeck1){
    image = ischeck1;
  }
  String getimage(){
    return image;
  }
}