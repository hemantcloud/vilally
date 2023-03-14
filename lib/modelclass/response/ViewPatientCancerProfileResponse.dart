class ViewPatientCancerProfileResponse {
  bool? status;
  Data? data;
  String? message;

  ViewPatientCancerProfileResponse({this.status, this.data, this.message});

  ViewPatientCancerProfileResponse.fromJson(Map<String, dynamic> json) {
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
  Getpatientdetails? getpatientdetails;

  Data({this.getpatientdetails});

  Data.fromJson(Map<String, dynamic> json) {
    getpatientdetails = json['getpatientdetails'] != null
        ? new Getpatientdetails.fromJson(json['getpatientdetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getpatientdetails != null) {
      data['getpatientdetails'] = this.getpatientdetails!.toJson();
    }
    return data;
  }
}

class Getpatientdetails {
  int? id;
  String? cancer_id;
  String? firstDiagnosisYear;
  String? firstDiagnosisMonth;
  String? cancerType;
  String? stage;

  Getpatientdetails(
      {this.id,
        this.cancer_id,
        this.firstDiagnosisYear,
        this.firstDiagnosisMonth,
        this.cancerType,
        this.stage});

  Getpatientdetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cancer_id = json['cancer_id'];
    firstDiagnosisYear = json['first_diagnosis_year'];
    firstDiagnosisMonth = json['first_diagnosis_month'];
    cancerType = json['cancer_type'];
    stage = json['stage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cancer_id'] = this.cancer_id;
    data['first_diagnosis_year'] = this.firstDiagnosisYear;
    data['first_diagnosis_month'] = this.firstDiagnosisMonth;
    data['cancer_type'] = this.cancerType;
    data['stage'] = this.stage;
    return data;
  }
}
