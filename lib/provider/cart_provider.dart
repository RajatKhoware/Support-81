import 'package:support__81/models/cart_model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  CartModel _cart = CartModel();
  CartModel get cart => _cart;
  void setCart(CartModel cart) {
    _cart = cart;
    notifyListeners();
  }
}
