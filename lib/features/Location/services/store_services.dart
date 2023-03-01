import 'dart:convert';
import 'package:support__81/models/store_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/snakebar.dart';
import '../../../constant/colors.dart';

class FetchStoreServices {
  Future<StoreModel> fetchStores({
    required BuildContext context,
    required String lat,
    required String long,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Checking if token is null we store the empty value to it !!
      String authToken = prefs.getString('x-auth-token') ?? '';
      // Passing the token
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken'
      };

      http.Response res = await http.post(
        Uri.parse('$url/getNearestShops'),
        body: jsonEncode(
          {
            "lat": lat,
            "long": long,
          },
        ),
        headers: headers,
      );
      // httpErrorHandle(
      //     response: res,
      //     context: context,
      //     onSuccess: () {
      //       return StoreModel.fromJson(jsonDecode(res.body));
      //     });
      print(res.body);
      if (res.statusCode == 200) {
        return StoreModel.fromJson(jsonDecode(res.body));
      } else {
        throw Exception("Failed to Load data !");
      }
    } catch (e) {
      showSnakeBar(context, e.toString());
      print(e.toString());
      throw (e);
    }
  }
}

// Future<T> httpErrorHandle<T>({
//   required http.Response response,
//   required BuildContext context,
//   required T Function() onSuccess,
// }) {
//   if (response.statusCode >= 200 && response.statusCode < 300) {
//     return Future.value(onSuccess());
//   } else {
//     throw Exception('Error: ${response.reasonPhrase}');
//   }
// }
