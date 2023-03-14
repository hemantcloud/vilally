class ViewPatientHomeResponse {
  bool? status;
  Data? data;
  String? message;

  ViewPatientHomeResponse({this.status, this.data, this.message});

  ViewPatientHomeResponse.fromJson(Map<String, dynamic> json) {
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
  String? firstname;
  String? lastname;
  String? name;
  int? remaining;
  int? feeling;
  int? trackSymptoms;
  int? logVitalSign;
  int? takeMedicine;

  Data(
      {this.firstname,
        this.lastname,
        this.name,
        this.remaining,
        this.feeling,
        this.trackSymptoms,
        this.logVitalSign,
        this.takeMedicine});

  Data.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    name = json['name'];
    remaining = json['remaining'];
    feeling = json['feeling'];
    trackSymptoms = json['track_symptoms'];
    logVitalSign = json['log_vital_sign'];
    takeMedicine = json['take_medicine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['name'] = this.name;
    data['remaining'] = this.remaining;
    data['feeling'] = this.feeling;
    data['track_symptoms'] = this.trackSymptoms;
    data['log_vital_sign'] = this.logVitalSign;
    data['take_medicine'] = this.takeMedicine;
    return data;
  }
}
