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
      final response = await http.post(
        Uri.parse('$url/signup'),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'mobile': mobileNumber,
        },
      );
      final responseData = json.decode(response.body);
      final responseMessage = responseData['response_message'] as String;
      final responseCode = responseData['response_code'] as int;
      final token = responseData['token'] as String?;
      final userData = responseData['data'] as Map<String, dynamic>?;
      if (responseCode == 200) {
        if (userData != null) {
          // Extract user data from the response
          final userId = userData['id'] as int;
          final userName = userData['name'] as String;
          final userEmail = userData['email'] as String;
          final userMobile = userData['mobile'] as String;

          // Store user data in your application state
          // ...

          // Set the response message
          _responseMessage = '$responseMessage Login With Same credentials';
        } else {
          _responseMessage = 'An error occurred while adding user.';
        }
      } else {
        _responseMessage = responseMessage;
      }
    } catch (e) {
      _responseMessage =
          'An error occurred while adding user. Please try again later.';
      // showSnackBar(context, e.toString());
      // print(e.toString());
    }
    return _responseMessage;
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
