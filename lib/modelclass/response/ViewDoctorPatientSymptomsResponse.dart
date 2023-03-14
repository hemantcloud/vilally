class ViewDoctorPatientSymptomsResponse {
  bool? status;
  Data? data;
  String? message;

  ViewDoctorPatientSymptomsResponse({this.status, this.data, this.message});

  ViewDoctorPatientSymptomsResponse.fromJson(Map<String, dynamic> json) {
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
  List<Stymptoms>? stymptoms;

  Data({this.stymptoms});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['stymptoms'] != null) {
      stymptoms = <Stymptoms>[];
      json['stymptoms'].forEach((v) {
        stymptoms!.add(new Stymptoms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stymptoms != null) {
      data['stymptoms'] = this.stymptoms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stymptoms {
  int? id;
  String? userId;
  String? name;
  String? description;
  String? addedBy;

  Stymptoms({this.id, this.userId, this.name, this.description, this.addedBy});

  Stymptoms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    addedBy = json['added_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['added_by'] = this.addedBy;
    return data;
  }
}
