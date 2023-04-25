import 'package:support__81/models/cart_model.dart';
import 'package:flutter/cupertino.dart';

import '../features/Cart/services/cart_services.dart';

class CartProvider extends ChangeNotifier {
  CartServices _cartServices = CartServices();

// Setting cart from api data
  CartModel _cart = CartModel();
  CartModel get cart => _cart;
  void setCart(CartModel cart) {
    _cart = cart;
    notifyListeners();
  }

// RemoveProduct in my cart
  void removeProduct(int index) {
    _cart.data!.removeAt(index);
    notifyListeners();
  }

// Setting the product size acc to user
  int _productSize = 0;
  int get productSize => _productSize;
  void setProductSize(int index) {
    _productSize = index;
    notifyListeners();
  }

// Setting the product quantity acc to user
  int _initalQuantity = 1;
  int get initalQuantity => _initalQuantity;
  void setInitalQuantity() {
    _initalQuantity = 1;
    notifyListeners();
  }

  void increaseInitalQuantity(int avaQuantity) {
    if (_initalQuantity < avaQuantity) {
      _initalQuantity = ++_initalQuantity;
    }
    notifyListeners();
  }

  void decreaseInitalQuantity() {
    if (_initalQuantity > 1) {
      _initalQuantity = --_initalQuantity;
    }
    notifyListeners();
  }

  //Update cart length
  

  bool _isProductPresentInCart = false;
  bool get isProductPresentInCart => _isProductPresentInCart;
  void setisProductPresentInCart() {
    _isProductPresentInCart = true;
    notifyListeners();
  }

  void addToCart({
    required BuildContext context,
    required double productId,
    required double currentColorId,
  }) async {
    await _cartServices.addToCartWithQunatity(
      context: context,
      quantity: initalQuantity.toDouble(),
      productId: productId,
      colorId: currentColorId,
      size: (1 + productSize).toDouble(),
    );
    print(initalQuantity);
    print(productSize);
    setisProductPresentInCart();
  }
}
