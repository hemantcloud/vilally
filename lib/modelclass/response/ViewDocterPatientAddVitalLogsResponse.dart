class ViewDocterPatientAddVitalLogsResponse {
  bool? status;
  Data? data;
  String? message;

  ViewDocterPatientAddVitalLogsResponse({this.status, this.data, this.message});

  ViewDocterPatientAddVitalLogsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  RecomVitals? recomVitals;

  Data({this.recomVitals});

  Data.fromJson(Map<String, dynamic> json) {
    recomVitals = json['recom_vitals'] != null
        ? new RecomVitals.fromJson(json['recom_vitals'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recomVitals != null) {
      data['recom_vitals'] = this.recomVitals!.toJson();
    }
    return data;
  }
}

class RecomVitals {
  int? id;
  String? patientId;
  String? doctorId;
  String? bodyTemprature;
  String? bloodPressure;
  String? pulse;
  String? waterIntake;
  String? sleep;
  String? activity;

  RecomVitals(
      {this.id,
        this.patientId,
        this.doctorId,
        this.bodyTemprature,
        this.bloodPressure,
        this.pulse,
        this.waterIntake,
        this.sleep,
        this.activity});

  RecomVitals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    doctorId = json['doctor_id'];
    bodyTemprature = json['body_temprature'];
    bloodPressure = json['blood_pressure'];
    pulse = json['pulse'];
    waterIntake = json['water_intake'];
    sleep = json['sleep'];
    activity = json['activity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['doctor_id'] = this.doctorId;
    data['body_temprature'] = this.bodyTemprature;
    data['blood_pressure'] = this.bloodPressure;
    data['pulse'] = this.pulse;
    data['water_intake'] = this.waterIntake;
    data['sleep'] = this.sleep;
    data['activity'] = this.activity;
    return data;
  }
}
