import 'package:support__81/models/get_bookmarked_product_model.dart';
import 'package:flutter/cupertino.dart';

class BookmarkedProvider extends ChangeNotifier {
  // Data _addedProduct = Data();

  // Data get product => _addedProduct;

  List<Data> _addedProducts = [];

  List<Data> get products => _addedProducts;

  void setProducts(List<Data> product) {
    _addedProducts = product;
    notifyListeners();
  }
}
