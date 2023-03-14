class Language2{
  late String imageAssetPath;
  late String title;
  late bool ischeck;
 late List<bool> productslist;

  Language2(this.imageAssetPath, this.title, this.ischeck);

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setProductList(List<bool> getTitle){
    productslist = getTitle;
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

  List<bool> getProductList(){
    return productslist;
  }

  bool getIsCheck(){
    return ischeck;
  }
}