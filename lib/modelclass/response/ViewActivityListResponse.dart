class ViewActivityListResponse {
  bool? status;
  Data? data;
  String? message;

  ViewActivityListResponse({this.status, this.data, this.message});

  ViewActivityListResponse.fromJson(Map<String, dynamic> json) {
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
  List<Getactiviy>? getactiviy;

  Data({this.getactiviy});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['getactiviy'] != null) {
      getactiviy = <Getactiviy>[];
      json['getactiviy'].forEach((v) {
        getactiviy!.add(new Getactiviy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getactiviy != null) {
      data['getactiviy'] = this.getactiviy!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Getactiviy {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Getactiviy(
      {this.id, this.name, this.createdAt, this.updatedAt, this.deletedAt});

  Getactiviy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
