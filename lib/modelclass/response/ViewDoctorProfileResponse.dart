class ViewDoctorProfileResponse {
  bool? status;
  Data? data;
  String? message;

  ViewDoctorProfileResponse({this.status, this.data, this.message});

  ViewDoctorProfileResponse.fromJson(Map<String, dynamic> json) {
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

  Data({this.doctor});

  Data.fromJson(Map<String, dynamic> json) {
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    return data;
  }
}

class Doctor {
  int? id;
  String? image;
  String? firstname;
  String? lastname;
  String? email;
  Null? emailVerifiedAt;
  String? countryCode;
  String? phone;
  String? regNumber;
  String? affiliation;
  Null? dob;
  String? gender;
  String? country;
  String? state;
  String? city;
  String? eName;
  String? eRelToPatient;
  String? ePhone;
  String? role;
  String? device;
  String? deviceId;
  String? fcmToken;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? doctor_profile;
  String? doctor_speciality;
  Null? deletedAt;

  Doctor(
      {this.id,
        this.image,
        this.firstname,
        this.lastname,
        this.email,
        this.emailVerifiedAt,
        this.countryCode,
        this.phone,
        this.regNumber,
        this.affiliation,
        this.dob,
        this.gender,
        this.country,
        this.state,
        this.city,
        this.eName,
        this.eRelToPatient,
        this.ePhone,
        this.role,
        this.device,
        this.deviceId,
        this.fcmToken,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.doctor_profile,
        this.doctor_speciality,
        this.deletedAt});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    countryCode = json['country_code'];
    phone = json['phone'];
    regNumber = json['reg_number'];
    affiliation = json['affiliation'];
    dob = json['dob'];
    gender = json['gender'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    eName = json['e_name'];
    eRelToPatient = json['e_rel_to_patient'];
    ePhone = json['e_phone'];
    role = json['role'];
    device = json['device'];
    deviceId = json['device_id'];
    fcmToken = json['fcm_token'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    doctor_profile = json['doctor_profile'];
    deletedAt = json['deleted_at'];
    doctor_speciality = json['doctor_speciality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['reg_number'] = this.regNumber;
    data['affiliation'] = this.affiliation;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['e_name'] = this.eName;
    data['e_rel_to_patient'] = this.eRelToPatient;
    data['e_phone'] = this.ePhone;
    data['role'] = this.role;
    data['device'] = this.device;
    data['device_id'] = this.deviceId;
    data['fcm_token'] = this.fcmToken;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['doctor_profile'] = this.doctor_profile;
    data['deleted_at'] = this.deletedAt;
    data['doctor_speciality'] = this.doctor_speciality;
    return data;
  }
}
