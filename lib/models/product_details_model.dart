class ProductDetailsModel {
  String? responseMessage;
  int? responseCode;
  Data? data;

  ProductDetailsModel({this.responseMessage, this.responseCode, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    responseMessage = json['response_message'];
    responseCode = json['response_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_message'] = this.responseMessage;
    data['response_code'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? rcId;
  String? categoryId;
  String? productName;
  String? price;
  String? description;
  String? availableQuantity;
  String? discount;
  String? createdAt;
  String? updatedAt;
  int? avgRating;
  List<String>? image;
  List<Reviews>? reviews;

  Data(
      {this.id,
      this.rcId,
      this.categoryId,
      this.productName,
      this.price,
      this.description,
      this.availableQuantity,
      this.discount,
      this.createdAt,
      this.updatedAt,
      this.avgRating,
      this.image,
      this.reviews});

  Data.fromJson(Map<String, dynamic> json) {
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
    avgRating = json['avgRating'];
    image = json['image'].cast<String>();
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
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
    data['avgRating'] = this.avgRating;
    data['image'] = this.image;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
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







// class ProductDetailsModel {
//   String? responseMessage;
//   int? responseCode;
//   List<AvailableColors>? availableColors;
//   AvailableColors? currentColor;
//   Product? product;

//   ProductDetailsModel(
//       {this.responseMessage,
//       this.responseCode,
//       this.availableColors,
//       this.currentColor,
//       this.product});

//   ProductDetailsModel.fromJson(Map<String, dynamic> json) {
//     responseMessage = json['response_message'];
//     responseCode = json['response_code'];
//     if (json['available_colors'] != null) {
//       availableColors = <AvailableColors>[];
//       json['available_colors'].forEach((v) {
//         availableColors!.add(new AvailableColors.fromJson(v));
//       });
//     }
//     currentColor = json['current_color'] != null
//         ? new AvailableColors.fromJson(json['current_color'])
//         : null;
//     product =
//         json['product'] != null ? new Product.fromJson(json['product']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['response_message'] = this.responseMessage;
//     data['response_code'] = this.responseCode;
//     if (this.availableColors != null) {
//       data['available_colors'] =
//           this.availableColors!.map((v) => v.toJson()).toList();
//     }
//     if (this.currentColor != null) {
//       data['current_color'] = this.currentColor!.toJson();
//     }
//     if (this.product != null) {
//       data['product'] = this.product!.toJson();
//     }
//     return data;
//   }
// }

// class AvailableColors {
//   String? color;
//   String? hex;

//   AvailableColors({this.color, this.hex});

//   AvailableColors.fromJson(Map<String, dynamic> json) {
//     color = json['color'];
//     hex = json['hex'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['color'] = this.color;
//     data['hex'] = this.hex;
//     return data;
//   }
// }

// class Product {
//   int? id;
//   String? rcId;
//   String? categoryId;
//   String? productName;
//   String? price;
//   String? description;
//   String? availableQuantity;
//   Null? discount;
//   String? createdAt;
//   String? updatedAt;
//   int? avgRating;
//   List<String>? image;
//   List<Reviews>? reviews;
//   List<Sizes>? sizes;

//   Product(
//       {this.id,
//       this.rcId,
//       this.categoryId,
//       this.productName,
//       this.price,
//       this.description,
//       this.availableQuantity,
//       this.discount,
//       this.createdAt,
//       this.updatedAt,
//       this.avgRating,
//       this.image,
//       this.reviews,
//       this.sizes});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     rcId = json['rc_id'];
//     categoryId = json['categoryId'];
//     productName = json['productName'];
//     price = json['price'];
//     description = json['description'];
//     availableQuantity = json['available_quantity'];
//     discount = json['discount'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     avgRating = json['avgRating'];
//     image = json['image'].cast<String>();
//     if (json['reviews'] != null) {
//       reviews = <Reviews>[];
//       json['reviews'].forEach((v) {
//         reviews!.add(new Reviews.fromJson(v));
//       });
//     }
//     if (json['sizes'] != null) {
//       sizes = <Sizes>[];
//       json['sizes'].forEach((v) {
//         sizes!.add(new Sizes.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['rc_id'] = this.rcId;
//     data['categoryId'] = this.categoryId;
//     data['productName'] = this.productName;
//     data['price'] = this.price;
//     data['description'] = this.description;
//     data['available_quantity'] = this.availableQuantity;
//     data['discount'] = this.discount;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['avgRating'] = this.avgRating;
//     data['image'] = this.image;
//     if (this.reviews != null) {
//       data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
//     }
//     if (this.sizes != null) {
//       data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Reviews {
//   String? id;
//   String? userId;
//   String? productId;
//   String? rating;
//   String? description;
//   String? userName;
//   Null? userImage;

//   Reviews(
//       {this.id,
//       this.userId,
//       this.productId,
//       this.rating,
//       this.description,
//       this.userName,
//       this.userImage});

//   Reviews.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['userId'];
//     productId = json['productId'];
//     rating = json['rating'];
//     description = json['description'];
//     userName = json['userName'];
//     userImage = json['userImage'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['userId'] = this.userId;
//     data['productId'] = this.productId;
//     data['rating'] = this.rating;
//     data['description'] = this.description;
//     data['userName'] = this.userName;
//     data['userImage'] = this.userImage;
//     return data;
//   }
// }

// class Sizes {
//   String? size;
//   String? initial;
//   String? quantity;

//   Sizes({this.size, this.initial, this.quantity});

//   Sizes.fromJson(Map<String, dynamic> json) {
//     size = json['size'];
//     initial = json['initial'];
//     quantity = json['quantity'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['size'] = this.size;
//     data['initial'] = this.initial;
//     data['quantity'] = this.quantity;
//     return data;
//   }
// }
