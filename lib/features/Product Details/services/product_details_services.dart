import 'dart:convert';

import 'package:support__81/common/snakebar.dart';
import 'package:support__81/models/product_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../constant/colors.dart';

class ProductDetailsServices {
  Future<ProductDetailsModel> getProductDetails({
    required double productId,
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('x-auth-token') ?? '';
      final response = await http.get(
        Uri.parse('$url/getProduct?productId=$productId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken'
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var product = ProductDetailsModel.fromJson(data);
        return product;
      } else {
        return ProductDetailsModel.fromJson(data);
      }
    } catch (e) {
      print(e.toString());
      showSnakeBar(context, e.toString());
      throw Exception(e.toString());
    }
  }
}
