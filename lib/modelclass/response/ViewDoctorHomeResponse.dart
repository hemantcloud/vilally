class ViewDoctorHomeResponse {
  bool? status;
  Data? data;
  String? message;

  ViewDoctorHomeResponse({this.status, this.data, this.message});

  ViewDoctorHomeResponse.fromJson(Map<String, dynamic> json) {
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
  Doctor? doctor;
  int? total;
  List<Items>? items;

  Data({this.doctor, this.total, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
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
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    data['total'] = this.total;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctor {
  int? id;
  String? doctorId;
  String? image;
  String? firstname;
  String? lastname;
  String? email;
  Null? emailVerifiedAt;
  String? countryCode;
  String? phone;
  String? regNumber;
  String? affiliation;
  String? doctorProfile;
  Null? dob;
  String? gender;
  String? country;
  String? state;
  String? city;
  String? eName;
  String? eRelToPatient;
  String? ePhone;
  String? doctorSpeciality;
  String? role;
  String? qrcode;
  String? device;
  String? deviceId;
  String? fcmToken;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Doctor(
      {this.id,
        this.doctorId,
        this.image,
        this.firstname,
        this.lastname,
        this.email,
        this.emailVerifiedAt,
        this.countryCode,
        this.phone,
        this.regNumber,
        this.affiliation,
        this.doctorProfile,
        this.dob,
        this.gender,
        this.country,
        this.state,
        this.city,
        this.eName,
        this.eRelToPatient,
        this.ePhone,
        this.doctorSpeciality,
        this.role,
        this.qrcode,
        this.device,
        this.deviceId,
        this.fcmToken,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    image = json['image'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    countryCode = json['country_code'];
    phone = json['phone'];
    regNumber = json['reg_number'];
    affiliation = json['affiliation'];
    doctorProfile = json['doctor_profile'];
    dob = json['dob'];
    gender = json['gender'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    eName = json['e_name'];
    eRelToPatient = json['e_rel_to_patient'];
    ePhone = json['e_phone'];
    doctorSpeciality = json['doctor_speciality'];
    role = json['role'];
    qrcode = json['qrcode'];
    device = json['device'];
    deviceId = json['device_id'];
    fcmToken = json['fcm_token'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['image'] = this.image;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['reg_number'] = this.regNumber;
    data['affiliation'] = this.affiliation;
    data['doctor_profile'] = this.doctorProfile;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['e_name'] = this.eName;
    data['e_rel_to_patient'] = this.eRelToPatient;
    data['e_phone'] = this.ePhone;
    data['doctor_speciality'] = this.doctorSpeciality;
    data['role'] = this.role;
    data['qrcode'] = this.qrcode;
    data['device'] = this.device;
    data['device_id'] = this.deviceId;
    data['fcm_token'] = this.fcmToken;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Items {
  int? id;
  String? patientId;
  String? patientName;
  String? gender;
  String? cancer_name;
  int? dob;
  int? criticalityCount;

  Items(
      {this.id,
        this.patientId,
        this.patientName,
        this.gender,
        this.cancer_name,
        this.dob,
        this.criticalityCount});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    gender = json['gender'];
    cancer_name = json['cancer_name'];
    dob = json['dob'];
    criticalityCount = json['criticality_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['patient_name'] = this.patientName;
    data['gender'] = this.gender;
    data['cancer_name'] = this.cancer_name;
    data['dob'] = this.dob;
    data['criticality_count'] = this.criticalityCount;
    return data;
  }
}
