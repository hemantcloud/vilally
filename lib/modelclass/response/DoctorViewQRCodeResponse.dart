class DoctorViewQRCodeResponse {
  bool? status;
  Data? data;
  String? message;

  DoctorViewQRCodeResponse({this.status, this.data, this.message});

  DoctorViewQRCodeResponse.fromJson(Map<String, dynamic> json) {
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
  String? qrcode;

  Data({this.qrcode});

  Data.fromJson(Map<String, dynamic> json) {
    qrcode = json['qrcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qrcode'] = this.qrcode;
    return data;
  }
}
