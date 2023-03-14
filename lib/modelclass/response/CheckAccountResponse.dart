class CheckAccountResponse {
  bool? status;
  Data? data;
  String? message;

  CheckAccountResponse({this.status, this.data, this.message});

  CheckAccountResponse.fromJson(Map<String, dynamic> json) {
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
  String? role;
  String? type;
  String? patientDetails;
  String? token;

  Data({this.role, this.type, this.patientDetails, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    type = json['type'];
    patientDetails = json['patient_details'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['type'] = this.type;
    data['patient_details'] = this.patientDetails;
    data['token'] = this.token;
    return data;
  }
}
