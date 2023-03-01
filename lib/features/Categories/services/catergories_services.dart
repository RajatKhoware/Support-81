import 'dart:convert';

import 'package:support__81/models/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/colors.dart';

class CategoryServies {
  Future<CategoriesModel> getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('x-auth-token') ?? '';
    final response = await http.get(
      Uri.parse('$url/getCategories'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken'
      },
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CategoriesModel.fromJson(data);
    } else {
      print("error in category services");
      return CategoriesModel.fromJson(data);
    }
  }
}
