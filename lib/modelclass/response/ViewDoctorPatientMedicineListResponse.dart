class ViewDoctorPatientMedicineListResponse {
  bool? status;
  Data? data;
  String? message;

  ViewDoctorPatientMedicineListResponse({this.status, this.data, this.message});

  ViewDoctorPatientMedicineListResponse.fromJson(Map<String, dynamic> json) {
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
  int? total;
  List<Items>? items;

  Data({this.total, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
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

  Items(
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

  Items.fromJson(Map<String, dynamic> json) {
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
