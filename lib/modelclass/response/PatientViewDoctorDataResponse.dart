class PatientViewDoctorDataResponse {
  bool? status;
  Data? data;
  String? message;

  PatientViewDoctorDataResponse({this.status, this.data, this.message});

  PatientViewDoctorDataResponse.fromJson(Map<String, dynamic> json) {
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
  Getdoctor? getdoctor;

  Data({this.getdoctor});

  Data.fromJson(Map<String, dynamic> json) {
    getdoctor = json['getdoctor'] != null
        ? new Getdoctor.fromJson(json['getdoctor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getdoctor != null) {
      data['getdoctor'] = this.getdoctor!.toJson();
    }
    return data;
  }
}

class Getdoctor {
  int? id;
  String? doctorId;
  String? image;
  String? firstname;
  String? lastname;
  String? email;

  Getdoctor(
      {this.id,
        this.doctorId,
        this.image,
        this.firstname,
        this.lastname,
        this.email});

  Getdoctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    image = json['image'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['image'] = this.image;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    return data;
  }
}
