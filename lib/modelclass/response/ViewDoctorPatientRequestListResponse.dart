class ViewDoctorPatientRequestListResponse {
  bool? status;
  Data? data;
  String? message;

  ViewDoctorPatientRequestListResponse({this.status, this.data, this.message});

  ViewDoctorPatientRequestListResponse.fromJson(Map<String, dynamic> json) {
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
  List<Myrequest>? myrequest;

  Data({this.myrequest});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['myrequest'] != null) {
      myrequest = <Myrequest>[];
      json['myrequest'].forEach((v) {
        myrequest!.add(new Myrequest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myrequest != null) {
      data['myrequest'] = this.myrequest!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Myrequest {
  int? id;
  String? doctorId;
  String? patientId;
  String? status;
  String? firstname;
  String? lastname;
  int? criticality_count;

  Myrequest(
      {this.id,
        this.doctorId,
        this.patientId,
        this.status,
        this.firstname,
        this.lastname,
      this.criticality_count});

  Myrequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    status = json['status'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    criticality_count = json['criticality_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['patient_id'] = this.patientId;
    data['status'] = this.status;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['criticality_count'] = this.criticality_count;
    return data;
  }
}
