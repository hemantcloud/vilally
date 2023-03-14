class PatientViewAppointmentmodelclass{
  late String title;
  late String subtitle;
  late String date;


  PatientViewAppointmentmodelclass(this.title, this.subtitle,this.date);

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setSubtitle(String ischeck1){
    subtitle = ischeck1;
  }
  void setDate(String ischeck1){
    date = ischeck1;
  }

  String getTitle(){
    return title;
  }

  String getSubtitle(){
    return subtitle;
  }
  String getDate(){
    return date;
  }
}