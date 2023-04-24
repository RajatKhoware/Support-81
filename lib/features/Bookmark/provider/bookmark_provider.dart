import 'package:support__81/models/get_bookmarked_product_model.dart';
import 'package:flutter/cupertino.dart';

class BookmarkedProvider extends ChangeNotifier {
  List<Data> _addedProducts = [];
  bool _isProductBookmarked = false;

  List<Data> get products => _addedProducts;
  bool get isProductBookmarked => _isProductBookmarked;

  void setProducts(List<Data> product) {
    _addedProducts = product;
    notifyListeners();
  }

  void setBookmarked() {
    _isProductBookmarked = true;
    notifyListeners();
  }
}
