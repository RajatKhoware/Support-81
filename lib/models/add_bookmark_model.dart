class AddBookmarkModel {
  String? responseMessage;
  int? responseCode;

  AddBookmarkModel({this.responseMessage, this.responseCode});

  AddBookmarkModel.fromJson(Map<String, dynamic> json) {
    responseMessage = json['response_message'];
    responseCode = json['response_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_message'] = this.responseMessage;
    data['response_code'] = this.responseCode;
    return data;
  }
}
