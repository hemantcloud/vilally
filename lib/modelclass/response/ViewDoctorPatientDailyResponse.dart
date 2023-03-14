class ViewDoctorPatientDailyResponse {
  bool? status;
  Data? data;
  String? message;

  ViewDoctorPatientDailyResponse({this.status, this.data, this.message});

  ViewDoctorPatientDailyResponse.fromJson(Map<String, dynamic> json) {
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
  Patientdetails? patientdetails;
  TodayFeeling? todayFeeling;
  VitalReports? vitalReports;
  List<SymptomsReport>? symptomsReport;

  Data(
      {this.patientdetails,
        this.todayFeeling,
        this.vitalReports,
        this.symptomsReport});

  Data.fromJson(Map<String, dynamic> json) {
    patientdetails = json['patientdetails'] != null
        ? new Patientdetails.fromJson(json['patientdetails'])
        : null;
    todayFeeling = json['today_feeling'] != null
        ? new TodayFeeling.fromJson(json['today_feeling'])
        : null;
    vitalReports = json['vital_reports'] != null
        ? new VitalReports.fromJson(json['vital_reports'])
        : null;
    if (json['symptoms_report'] != null) {
      symptomsReport = <SymptomsReport>[];
      json['symptoms_report'].forEach((v) {
        symptomsReport!.add(new SymptomsReport.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.patientdetails != null) {
      data['patientdetails'] = this.patientdetails!.toJson();
    }
    if (this.todayFeeling != null) {
      data['today_feeling'] = this.todayFeeling!.toJson();
    }
    if (this.vitalReports != null) {
      data['vital_reports'] = this.vitalReports!.toJson();
    }
    if (this.symptomsReport != null) {
      data['symptoms_report'] =
          this.symptomsReport!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Patientdetails {
  int? id;
  String? image;
  String? firstname;
  String? lastname;
  int? criticalityCount;

  Patientdetails(
      {this.id,
        this.image,
        this.firstname,
        this.lastname,
        this.criticalityCount});

  Patientdetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    criticalityCount = json['criticality_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['criticality_count'] = this.criticalityCount;
    return data;
  }
}

class TodayFeeling {
  String? name;
  String? date;

  TodayFeeling({this.name, this.date});

  TodayFeeling.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['date'] = this.date;
    return data;
  }
}

class VitalReports {
  int? id;
  String? date;
  String? patientId;
  String? bodyTemperature;
  String? pulse;
  String? systolic;
  String? diastolic;
  String? oxygenSaturation;
  String? sleep;
  String? waterIntake;
  String? activity;
  String? activityTime;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  VitalReports(
      {this.id,
        this.date,
        this.patientId,
        this.bodyTemperature,
        this.pulse,
        this.systolic,
        this.diastolic,
        this.oxygenSaturation,
        this.sleep,
        this.waterIntake,
        this.activity,
        this.activityTime,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  VitalReports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    patientId = json['patient_id'];
    bodyTemperature = json['body_temperature'];
    pulse = json['pulse'];
    systolic = json['systolic'];
    diastolic = json['diastolic'];
    oxygenSaturation = json['oxygen_saturation'];
    sleep = json['sleep'];
    waterIntake = json['water_intake'];
    activity = json['activity'];
    activityTime = json['activity_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['patient_id'] = this.patientId;
    data['body_temperature'] = this.bodyTemperature;
    data['pulse'] = this.pulse;
    data['systolic'] = this.systolic;
    data['diastolic'] = this.diastolic;
    data['oxygen_saturation'] = this.oxygenSaturation;
    data['sleep'] = this.sleep;
    data['water_intake'] = this.waterIntake;
    data['activity'] = this.activity;
    data['activity_time'] = this.activityTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class SymptomsReport {
  int? id;
  String? patientId;
  String? date;
  String? symptomId;
  String? name;
  String? condition;
  String? updateDate;

  SymptomsReport(
      {this.id,
        this.patientId,
        this.date,
        this.symptomId,
        this.name,
        this.condition,
        this.updateDate});

  SymptomsReport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    date = json['date'];
    symptomId = json['symptom_id'];
    name = json['name'];
    condition = json['condition'];
    updateDate = json['update_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['date'] = this.date;
    data['symptom_id'] = this.symptomId;
    data['name'] = this.name;
    data['condition'] = this.condition;
    data['update_date'] = this.updateDate;
    return data;
  }
}
