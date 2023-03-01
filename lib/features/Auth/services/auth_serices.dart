import 'dart:convert';
import 'package:support__81/constant/colors.dart';
import 'package:support__81/constant/error_handling.dart';
import 'package:support__81/features/Splash/screen/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/snakebar.dart';
import '../../../models/user.dart';
import '../../../provider/user_provider.dart';
import '../../Home/screens/homescreen.dart';

class AuthServices {
  //! SignUpUser
  signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String mobileNumber,
  }) async {
    String _responseMessage = '';
    try {
      http.Response res = await http.post(
        Uri.parse('$url/signup'),
        body: {
          "email": email,
          "password": password,
          "mobile": mobileNumber,
          "name": name
        },
      );
      print(res.body);
      // if(res.statusCode == 200 && )
      final responseData = json.decode(res.body);
      if (res.statusCode == 200 && responseData['response_code'] == 200) {
        // If user is successfully created

        return _responseMessage =
            "${responseData['response_message']} Login With Same credentials"; // Set the response message

      } else {
        // If user already exists
        final responseData = json.decode(res.body);

        return _responseMessage =
            responseData['response_message']; // Set the response message

      }
    } catch (e) {
      return _responseMessage =
          'An error occurred while signing up. Please try again later.';
      // showSnakeBar(context, e.toString());
      // print(e.toString());
    }
  }

  //! SignIn
  Future<void> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      
      http.Response response = await http.post(
        Uri.parse("$url/login"),
        body: {
          'email': email,
          'password': password,
        },
      );
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          // JsonDecoding
          final responseData = json.decode(response.body);
          // Using User Model to store the data
          final user = User.fromJson(responseData['data']);
          // Using sharedprefs to store the token locally
          SharedPreferences prefs = await SharedPreferences.getInstance();
          // Storing the user information in provider
          Provider.of<UserProvider>(context, listen: false).setUser(user);
          await prefs.setString('x-auth-token', responseData['token']);
          print(prefs.getString('x-auth-token'));
          // After all this we can move to home page
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnakeBar(context, e.toString());
      print(e.toString());
    }
  }

  //! State persistence
  Future<void> verifyUser(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Checking if token is null we store the empty value to it !!
      String authToken = prefs.getString('x-auth-token') ?? '';

      // Passing the token
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken'
      };

      http.Response response = await http.get(
        Uri.parse("$url/authenticate"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final String responseMessage = data['response_message'];
        final int responseCode = data['response_code'];
        if (responseMessage == 'Ok' && responseCode == 200) {
          print("Token Verified!");
          print(authToken);
          // If token verifed we can move to home dirctly
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
          );
        }
      } else {
        // Handle error response
        final Map<String, dynamic> data = jsonDecode(response.body);
        final String responseMessage = data['response_message'];
        showSnakeBar(context, responseMessage);
      }
    } catch (e) {
      showSnakeBar(context, e.toString());
      print(e.toString());
    }
  }

  void logOut(BuildContext context) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        SplashScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnakeBar(context, e.toString());
    }
  }
}
