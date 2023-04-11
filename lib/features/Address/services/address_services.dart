import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:support__81/common/snakebar.dart';
import 'package:http/http.dart' as http;
import 'package:support__81/constant/colors.dart';

class AddressServices {
  //AddAddress
  Future<void> addAddress({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required int mobileNumber,
    required String fullAddress1,
    required String country,
  }) async {
    final Uri uri = Uri.parse(
        "$url/addAddress?first_name=$firstName&last_name=$lastName&mobile=$mobileNumber&address_line_1=$fullAddress1&country=$country");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('x-auth-token') ?? '';
      http.Response response = await http.post(
        uri,
        headers: {'Authorization': 'Bearer $authToken'},
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        showSnakeBar(context, data['response_message']);
      } else {
        print(data['response_message']);
      }
    } catch (e) {
      print(e.toString());
      showSnakeBar(context, e.toString());
    }
  }

  //Get Address
  Future getAddress({required BuildContext context}) async {
    final Uri uri = Uri.parse("$url/getAddress");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('x-auth-token') ?? '';
      http.Response response = await http.post(
        uri,
        headers: {'Authorization': 'Bearer $authToken'},
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        showSnakeBar(context, data['response_message']);
      } else {
        print(data['response_message']);
      }
    } catch (e) {
      print(e.toString());
      showSnakeBar(context, e.toString());
    }
  }
}
