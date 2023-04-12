import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/common/snakebar.dart';
import 'package:http/http.dart' as http;
import 'package:support__81/constant/colors.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Address/model/addressmodel.dart';

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
      print("error from addAdddress ${e.toString()}");
    }
  }

  // Get Address
  Future<AddressModel> getAddress({
    required BuildContext context,
  }) async {
    final Uri uri = Uri.parse("$url/getAddress");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('x-auth-token') ?? '';
      http.Response response = await http.get(
        uri,
        headers: {'Authorization': 'Bearer $authToken'},
      );
      var data = jsonDecode(response.body);
      var modelData = AddressModel.fromJson(data);
      if (response.statusCode == 200) {
        return modelData;
      } else {
        print(data['response_message'].toString());
        return modelData;
      }
    } catch (e) {
      print("error from getAddress ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  // Update Address
  Future<void> updateAddress({
    required BuildContext context,
    required String id,
    required String firstName,
    required String lastName,
    required int mobileNumber,
    required String fullAddress1,
    required String country,
  }) async {
    final Uri uri = Uri.parse(
        "$url/updateAddress?id=$id&first_name=$firstName&last_name=$lastName&mobile=$mobileNumber&address_line_1=$fullAddress1&country=$country");
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
        print(data['response_message'].toString());
      }
    } catch (e) {
      print("error from updateAddress ${e.toString()}");
    }
  }
}
