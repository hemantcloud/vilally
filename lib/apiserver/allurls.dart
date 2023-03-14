class APIservices {
  //Base
  static const baseurl = "https://mobidudes.com/SAK/vitally/api/";
  static const imagebaseurl = "https://mobidudes.com/SAK/vitally/";
  // static const x_client_token = "e0271afd8a3b8257af70deacee4";

  //All Api
  static const checkaccounturl = baseurl + "check-account";
  static const patientaddsetup1url = baseurl + "register";
  static const getcancerurl = baseurl + "get-cancers";
  static const patientaddsetup2url = baseurl + "user/add-details";
  static const patientaccountlogouturl = baseurl + "user/logout";
  static const termsandconditionurl = baseurl + "tnc";
  static const privacypolicyurl = baseurl + "privacy-policy";
  static const patientviewprofileurl = baseurl + "user/get-profile";
  static const patientupdateprofileurl = baseurl + "user/update-profile";
  static const patientaddmedicationurl = baseurl + "user/add-medication";
  static const patientupdatemedicationurl = baseurl + "user/update-medication";
  static const patientdeletemedicationurl = baseurl + "user/delete-medication";
  static const patientviewmedicationurl = baseurl + "user/get-daily-medication";
  static const patientviewhomeurl = baseurl + "user/home";
  static const patientaddfeelingurl = baseurl + "user/mood";
  static const patientaddsymptomsurl = baseurl + "user/add-symptoms";
  static const patientviewactivitylisturl = baseurl + "user/getactive";
  static const patientaddlogvitalsignsurl = baseurl + "user/update-daily-log-vital-sign";
  static const patientviewsymptomslisturl = baseurl + "user/get-symptoms";
  static const patientdeletesymptomsurl = baseurl + "user/delete-symptoms";
  static const patientupdatesymptomsurl = baseurl + "user/update-symptoms";
  static const patientupdatesymptomsfeelingurl = baseurl + "user/update-daily-symptoms";
  static const patientupdatemedicinefeelingurl = baseurl + "user/update-daily-medication";
  static const patientviewcancerprofileurl = baseurl + "user/cancer-profile";
  static const patientupdatecancerprofileurl = baseurl + "user/update-cancer-profile";
  static const patientaddappointmenturl = baseurl + "user/add-appointment";
  static const patientviewappointmenturl = baseurl + "user/get-appointment";
  static const patientviewdoctorurl = baseurl + "user/getdoctor";
  static const patientadddoctorurl = baseurl + "user/send-request";

  //doctor apis
  static const doctorcheckaccounturl = baseurl + "doctor/check-account";
  static const doctorsetupprofileurl = baseurl + "doctor/register";
  static const doctoraccountlogouturl = baseurl + "user/logout";
  static const doctorviewprofileurl = baseurl + "doctor/get-profile";
  static const doctorupdateprofileurl = baseurl + "doctor/update-profile";
  static const doctorviewqrcodeurl = baseurl + "doctor/get-QR";
  static const doctorviewpatientrequestlisturl = baseurl + "doctor/get-request";
  static const doctoraddpatientrequestactionurl = baseurl + "doctor/action-request";
  static const doctorhomeurl = baseurl + "doctor/my-patients";
  static const doctorviewpatientmedicinelisturl = baseurl + "doctor/get-medication";
  static const doctoraddpatientmedicineurl = baseurl + "doctor/add-medication";
  static const doctordeletepatientmedicineurl = baseurl + "doctor/delete-medication";
  static const doctorviewpatientdailyurl = baseurl + "doctor/todaydetails";
  static const doctorviewpatientsymptomsurl = baseurl + "doctor/get-patient-symptoms";
  static const doctoraddpatientsymptomsurl = baseurl + "doctor/add-patient-symptoms";
  static const doctordeletepatientsymptomsurl = baseurl + "doctor/delete-patient-symptoms";
  static const doctorviewpatientprofileurl = baseurl + "doctor/patient-profile-details";
  static const doctorupdatepatientsymptomsurl = baseurl + "doctor/update-patient-symptoms";
  static const doctorviewpatientlogvitalsignssurl = baseurl + "doctor/get-recommended-vitallogs";
  static const doctorupdatepatientlogvitalsignssurl = baseurl + "doctor/update-recommended-vitallogs";

}