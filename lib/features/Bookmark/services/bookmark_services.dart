import 'dart:convert';
import 'package:support__81/models/add_bookmark_model.dart';
import 'package:support__81/models/get_bookmarked_product_model.dart';
import 'package:support__81/provider/bookmark_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../common/snakebar.dart';
import '../../../constant/colors.dart';

class BookmarkServices {
  //
  // Add Product to Bookmark
  Future<AddBookmarkModel> addBookmarks({
    required String productId,
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('x-auth-token') ?? '';
      http.Response response = await http.post(
        Uri.parse("$url/bookmarkProduct"),
        body: {
          "productId": productId,
        },
        headers: {'Authorization': 'Bearer $authToken'},
      );
      final data = jsonDecode(response.body);
      //print(data);
      if (response.statusCode == 200) {
        return AddBookmarkModel.fromJson(data);
      } else {
        return AddBookmarkModel.fromJson(data);
      }
    } catch (e) {
      showSnakeBar(context, e.toString());
      throw Exception('Failed to load product details');
    }
  }

  // Get Bookmarked Products
  Future<GetBookmarkProductModel> getBookmarkedProducts({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('x-auth-token') ?? '';
      http.Response response = await http.get(
        Uri.parse("$url/getBookmarks"),
        headers: {'Authorization': 'Bearer $authToken'},
      );
      final data = jsonDecode(response.body);
      //print(data);
      if (response.statusCode == 200) {
        // Storing the user information in provider
        List<Data> dataList = [];
        for (var item in data['data']) {
          final product = AddedProduct.fromJson(item['addedProduct']);
          dataList.add(
            Data(
              bookmarkId: item['bookmarkId'],
              addedProduct: product,
            ),
          );
        }
        Provider.of<BookmarkedProvider>(context, listen: false)
            .setProducts(dataList);
        return GetBookmarkProductModel.fromJson(data);
      } else {
        return GetBookmarkProductModel.fromJson(data);
      }
    } catch (e) {
      showSnakeBar(context, e.toString());
      print(e.toString());
      throw Exception('Failed to load product details');
    }
  }
}
