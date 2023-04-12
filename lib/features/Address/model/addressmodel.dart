class AddressModel {
  String? responseMessage;
  int? responseCode;
  List<Data>? data;

  AddressModel({this.responseMessage, this.responseCode, this.data});

  AddressModel.fromJson(Map<String, dynamic> json) {
    responseMessage = json['response_message'];
    responseCode = json['response_code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_message'] = this.responseMessage;
    data['response_code'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? mobile;
  String? addressLine1;
  String? addressLine2;
  String? country;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.mobile,
      this.addressLine1,
      this.addressLine2,
      this.country,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['country'] = this.country;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
