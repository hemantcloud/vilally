class Language{
  late String imageAssetPath;
  late String title;
  late bool ischeck;


  Language(this.imageAssetPath, this.title, this.ischeck);

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setIscheck(bool ischeck1){
    ischeck = ischeck1;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  bool getIsCheck(){
    return ischeck;
  }
}