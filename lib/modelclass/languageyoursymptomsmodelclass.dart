import 'package:vitally/modelclass/response/ViewPatientSymptomsListResponse.dart';

import 'newcurrentmoodmodelclass.dart';

class LanguageYourSymptomsModelClass{
  late String title;
  late Symptom Symptomdata;
 late List<NewCurrentMoodModelClass> languagelistsub;


  LanguageYourSymptomsModelClass( this.title,this.Symptomdata,this.languagelistsub);

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setNewCurrentMoodModelClass(List<NewCurrentMoodModelClass> getNewCurrentMoodModelClass){
    languagelistsub = getNewCurrentMoodModelClass;
  }

  void setSymptom(Symptom getSymptom){
    Symptomdata = getSymptom;
  }

  Symptom getSymptom(){
    return Symptomdata;
  }

  List<NewCurrentMoodModelClass> getNewCurrentMoodModelClass(){
    return languagelistsub;
  }

  String getTitle(){
    return title;
  }

}