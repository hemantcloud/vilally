class ViewPatientSymptomsListResponse {
  bool? status;
  Data? data;
  String? message;

  ViewPatientSymptomsListResponse({this.status, this.data, this.message});

  ViewPatientSymptomsListResponse.fromJson(Map<String, dynamic> json) {
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
  List<Symptom>? symptom;

  Data({this.symptom});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['symptom'] != null) {
      symptom = <Symptom>[];
      json['symptom'].forEach((v) {
        symptom!.add(new Symptom.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.symptom != null) {
      data['symptom'] = this.symptom!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Symptom {
  int? id;
  String? userId;
  String? name;
  String? addedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? done;
  String? selected;
  String? description;

  Symptom(
      {this.id,
        this.userId,
        this.name,
        this.addedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.done,
      this.selected,
      this.description});

  Symptom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    addedBy = json['added_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    done = json['done'];
    selected = json['selected'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['added_by'] = this.addedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['done'] = this.done;
    data['selected'] = this.selected;
    data['description'] = this.description;
    return data;
  }
}
