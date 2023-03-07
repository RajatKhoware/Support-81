class CartModel {
  String? responseMessage;
  int? responseCode;
  int? cartProductCount;
  List<Data>? data;

  CartModel(
      {this.responseMessage,
      this.responseCode,
      this.cartProductCount,
      this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    responseMessage = json['response_message'];
    responseCode = json['response_code'];
    cartProductCount = json['cartProductCount'];
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
    data['cartProductCount'] = this.cartProductCount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? cartId;
  String? quantity;
  List<String>? images;
  List<Reviews>? reviews;
  AddedProduct? addedProduct;

  Data(
      {this.cartId,
      this.quantity,
      this.images,
      this.reviews,
      this.addedProduct});

  Data.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    quantity = json['quantity'];
    images = json['images'].cast<String>();
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    addedProduct = json['addedProduct'] != null
        ? new AddedProduct.fromJson(json['addedProduct'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartId'] = this.cartId;
    data['quantity'] = this.quantity;
    data['images'] = this.images;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.addedProduct != null) {
      data['addedProduct'] = this.addedProduct!.toJson();
    }
    return data;
  }
}

class Reviews {
  String? id;
  String? userId;
  String? productId;
  String? rating;
  String? description;
  String? userName;
  Null? userImage;

  Reviews(
      {this.id,
      this.userId,
      this.productId,
      this.rating,
      this.description,
      this.userName,
      this.userImage});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    productId = json['productId'];
    rating = json['rating'];
    description = json['description'];
    userName = json['userName'];
    userImage = json['userImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['productId'] = this.productId;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['userName'] = this.userName;
    data['userImage'] = this.userImage;
    return data;
  }
}

class AddedProduct {
  int? id;
  String? rcId;
  String? categoryId;
  String? productName;
  String? price;
  String? description;
  String? availableQuantity;
  Null? discount;
  String? createdAt;
  String? updatedAt;

  AddedProduct(
      {this.id,
      this.rcId,
      this.categoryId,
      this.productName,
      this.price,
      this.description,
      this.availableQuantity,
      this.discount,
      this.createdAt,
      this.updatedAt});

  AddedProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rcId = json['rc_id'];
    categoryId = json['categoryId'];
    productName = json['productName'];
    price = json['price'];
    description = json['description'];
    availableQuantity = json['available_quantity'];
    discount = json['discount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rc_id'] = this.rcId;
    data['categoryId'] = this.categoryId;
    data['productName'] = this.productName;
    data['price'] = this.price;
    data['description'] = this.description;
    data['available_quantity'] = this.availableQuantity;
    data['discount'] = this.discount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}