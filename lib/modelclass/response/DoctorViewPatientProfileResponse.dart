class DoctorViewPatientProfileResponse {
  bool? status;
  Data? data;
  String? message;

  DoctorViewPatientProfileResponse({this.status, this.data, this.message});

  DoctorViewPatientProfileResponse.fromJson(Map<String, dynamic> json) {
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
  Result? result;

  Data({this.result});

  Data.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  PatientInformation? patientInformation;
  EmergencyContact? emergencyContact;
  CancerProfile? cancerProfile;
  MedicalHistory? medicalHistory;

  Result(
      {this.patientInformation,
        this.emergencyContact,
        this.cancerProfile,
        this.medicalHistory});

  Result.fromJson(Map<String, dynamic> json) {
    patientInformation = json['patient_information'] != null
        ? new PatientInformation.fromJson(json['patient_information'])
        : null;
    emergencyContact = json['emergency_contact'] != null
        ? new EmergencyContact.fromJson(json['emergency_contact'])
        : null;
    cancerProfile = json['cancer_profile'] != null
        ? new CancerProfile.fromJson(json['cancer_profile'])
        : null;
    medicalHistory = json['medical_history'] != null
        ? new MedicalHistory.fromJson(json['medical_history'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.patientInformation != null) {
      data['patient_information'] = this.patientInformation!.toJson();
    }
    if (this.emergencyContact != null) {
      data['emergency_contact'] = this.emergencyContact!.toJson();
    }
    if (this.cancerProfile != null) {
      data['cancer_profile'] = this.cancerProfile!.toJson();
    }
    if (this.medicalHistory != null) {
      data['medical_history'] = this.medicalHistory!.toJson();
    }
    return data;
  }
}

class PatientInformation {
  String? name;
  int? age;
  String? gender;
  String? phone;
  String? email;

  PatientInformation(
      {this.name, this.age, this.gender, this.phone, this.email});

  PatientInformation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}

class EmergencyContact {
  String? name;
  String? relation;
  String? phone;

  EmergencyContact({this.name, this.relation, this.phone});

  EmergencyContact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    relation = json['relation'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['relation'] = this.relation;
    data['phone'] = this.phone;
    return data;
  }
}

class CancerProfile {
  String? type;
  String? state;
  String? newOrRecurrent;
  String? firstDiagnosisOn;

  CancerProfile(
      {this.type, this.state, this.newOrRecurrent, this.firstDiagnosisOn});

  CancerProfile.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    state = json['state'];
    newOrRecurrent = json['new_or_recurrent'];
    firstDiagnosisOn = json['first_diagnosis_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['state'] = this.state;
    data['new_or_recurrent'] = this.newOrRecurrent;
    data['first_diagnosis_on'] = this.firstDiagnosisOn;
    return data;
  }
}

class MedicalHistory {
  String? priorHistory;
  List<Medications>? medications;

  MedicalHistory({this.priorHistory, this.medications});

  MedicalHistory.fromJson(Map<String, dynamic> json) {
    priorHistory = json['prior_history'];
    if (json['medications'] != null) {
      medications = <Medications>[];
      json['medications'].forEach((v) {
        medications!.add(new Medications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prior_history'] = this.priorHistory;
    if (this.medications != null) {
      data['medications'] = this.medications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medications {
  int? id;
  String? patientId;
  String? medicineName;
  String? dosage;
  String? duration;
  String? times;
  String? addedBy;
  String? lastTaken;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Medications(
      {this.id,
        this.patientId,
        this.medicineName,
        this.dosage,
        this.duration,
        this.times,
        this.addedBy,
        this.lastTaken,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Medications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    medicineName = json['medicine_name'];
    dosage = json['dosage'];
    duration = json['duration'];
    times = json['times'];
    addedBy = json['added_by'];
    lastTaken = json['last_taken'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['medicine_name'] = this.medicineName;
    data['dosage'] = this.dosage;
    data['duration'] = this.duration;
    data['times'] = this.times;
    data['added_by'] = this.addedBy;
    data['last_taken'] = this.lastTaken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
