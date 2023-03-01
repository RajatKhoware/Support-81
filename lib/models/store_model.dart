class StoreModel {
  String? responseMessage;
  int? responseCode;
  List<StoreData>? data;

  StoreModel({this.responseMessage, this.responseCode, this.data});

  StoreModel.fromJson(Map<String, dynamic> json) {
    responseMessage = json['response_message'];
    responseCode = json['response_code'];
    if (json['data'] != null) {
      data = <StoreData>[];
      json['data'].forEach((v) {
        data!.add(new StoreData.fromJson(v));
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

class StoreData {
  String? id;
  String? shopName;
  String? latitude;
  String? longitude;
  String? distance;

  StoreData({this.id, this.shopName, this.latitude, this.longitude, this.distance});

  StoreData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopName = json['shopName'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shopName'] = this.shopName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['distance'] = this.distance;
    return data;
  }
}