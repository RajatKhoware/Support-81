import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:support__81/common/snakebar.dart';
import 'package:support__81/constant/colors.dart';

import '../../../models/user_model.dart';
import '../../../provider/user_provider.dart';

class ProfileService {
  // Update Profile
  Future<void> updateUserInfo({
    required BuildContext context,
    required String name,
    required String email,
    required String mobile,
  }) async {
    final Uri uri =
        Uri.parse("$url/updateProfile?name=$name&email=$email&mobile=$mobile");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('x-auth-token') ?? '';
    Map<String, String> headers = {
      'Authorization': 'Bearer $authToken',
    };
    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        showSnakeBar(context, data['response_message']);
      } else {
        showSnakeBar(context, "Error in update profile");
      }
    } catch (e) {
      print("Error in update profile ${e.toString()}");
      showSnakeBar(context, e.toString());
    }
  }

  Future<void> getUser(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('x-auth-token') ?? '';
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken'
      };
      http.Response response = await http.get(
        Uri.parse("$url/authenticate"),
        headers: headers,
      );
      final Map<String, dynamic> data = jsonDecode(response.body);
      final user = User.fromJson(data['data']);
      final String responseMessage = data['response_message'];
      final int responseCode = data['response_code'];
      if (responseMessage == 'Ok' && responseCode == 200) {
        Provider.of<UserProvider>(context, listen: false).setUser(user);
      } else {
        showSnakeBar(context, responseMessage);
      }
    } catch (e) {
      showSnakeBar(context, e.toString());
      print(e.toString());
    }
  }
}

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   ProfileService services = ProfileService();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await services.updateUserInfo(context: context, name: "Rajat Titu");
//             services.getUser(context);
//           },
//           child: Text("Jalwa"),
//         ),
//       ),
//     );
//   }
// }
