class ViewPatientAppointmentResponse {
  bool? status;
  Data? data;
  String? message;

  ViewPatientAppointmentResponse({this.status, this.data, this.message});

  ViewPatientAppointmentResponse.fromJson(Map<String, dynamic> json) {
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
  List<Appointment>? appointment;

  Data({this.appointment});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['appointment'] != null) {
      appointment = <Appointment>[];
      json['appointment'].forEach((v) {
        appointment!.add(new Appointment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointment != null) {
      data['appointment'] = this.appointment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Appointment {
  int? id;
  String? patientId;
  String? title;
  String? doctorName;
  String? note;
  String? time;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Appointment({this.id,
        this.patientId,
        this.title,
        this.doctorName,
        this.note,
        this.time,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    title = json['title'];
    doctorName = json['doctor_name'];
    note = json['note'];
    time = json['time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['title'] = this.title;
    data['doctor_name'] = this.doctorName;
    data['note'] = this.note;
    data['time'] = this.time;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
