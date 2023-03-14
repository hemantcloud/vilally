class ViewPatientMedicineListResponse {
  bool? status;
  Data? data;
  String? message;

  ViewPatientMedicineListResponse({this.status, this.data, this.message});

  ViewPatientMedicineListResponse.fromJson(Map<String, dynamic> json) {
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
  List<PatientMedication>? patientMedication;

  Data({this.patientMedication});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['patient_medication'] != null) {
      patientMedication = <PatientMedication>[];
      json['patient_medication'].forEach((v) {
        patientMedication!.add(new PatientMedication.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.patientMedication != null) {
      data['patient_medication'] =
          this.patientMedication!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PatientMedication {
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
  List<PatientMedicationDose>? patientMedicationDose;

  PatientMedication(
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
        this.deletedAt,
        this.patientMedicationDose});

  PatientMedication.fromJson(Map<String, dynamic> json) {
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
    if (json['patient_medication_dose'] != null) {
      patientMedicationDose = <PatientMedicationDose>[];
      json['patient_medication_dose'].forEach((v) {
        patientMedicationDose!.add(new PatientMedicationDose.fromJson(v));
      });
    }
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
    if (this.patientMedicationDose != null) {
      data['patient_medication_dose'] =
          this.patientMedicationDose!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PatientMedicationDose {
  int? id;
  String? userId;
  String? patientMedicationId;
  int? status;

  PatientMedicationDose(
      {this.id, this.userId, this.patientMedicationId, this.status});

  PatientMedicationDose.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    patientMedicationId = json['patient_medication_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['patient_medication_id'] = this.patientMedicationId;
    data['status'] = this.status;
    return data;
  }
}
