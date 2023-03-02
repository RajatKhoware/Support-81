import 'dart:convert';

import 'package:support__81/common/snakebar.dart';
import 'package:support__81/models/cart_model.dart';
import 'package:support__81/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constant/colors.dart';

class CartServices {
  Future<void> addToCartWithQunatity({
    required BuildContext context,
    required double quantity,
    required double productId,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('x-auth-token') ?? '';
      final response = await http.post(
        Uri.parse('$url/addProductToCart'),
        body: jsonEncode({
          "productId": productId,
          "quantity": quantity,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken'
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        showSnakeBar(context, data['response_message']);
      } else {
        showSnakeBar(context, data['response_message']);
      }
    } catch (e) {
      showSnakeBar(context, e.toString());
    }
  }

  Future<void> addToCart({
    required BuildContext context,
    required String cartId,
  }) async {
    final cart = Provider.of<CartProvider>(context, listen: false);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('x-auth-token') ?? '';
      final response = await http.post(
        Uri.parse('$url/increaseCartProductCount'),
        body: {"cartId": cartId},
        headers: {'Authorization': 'Bearer $authToken'},
      );
      var data = jsonDecode(response.body);
      final cartWithModel = CartModel.fromJson(data);
      if (response.statusCode == 200 && data['response_code'] == 200) {
        cart.setCart(cartWithModel);
        showSnakeBar(context, "Product added to cart");
      } else {
        showSnakeBar(context, data['response_message']);
      }
    } catch (e) {
      showSnakeBar(context, e.toString());
    }
  }

  Future<void> getCart(BuildContext context) async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('x-auth-token') ?? '';
      final response = await http.get(
        Uri.parse('$url/getCart'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken'
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['response_code'] == 200) {
        cartProvider.setCart(CartModel.fromJson(data));
      } else if (response.statusCode == 404 && data['response_code'] == 404) {
        cartProvider.setCart(CartModel());
      } else {
        showSnakeBar(context, data['response_message']);
      }
    } catch (e) {
      showSnakeBar(context, e.toString());
      print(e.toString());
    }
  }

  Future<void> removeFromCart({
    required BuildContext context,
    required String cartId,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('x-auth-token') ?? '';
      final response = await http.delete(
        Uri.parse('$url/removeProductFromCart/$cartId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken'
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['response_code'] == 200) {
        showSnakeBar(context, data['response_message']);
      } else {
        showSnakeBar(context, data['response_message']);
      }
    } catch (e) {
      showSnakeBar(context, e.toString());
      print(e.toString());
    }
  }
}
