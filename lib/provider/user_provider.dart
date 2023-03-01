import 'package:support__81/models/get_bookmarked_product_model.dart';
import 'package:support__81/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: 0,
    name: '',
    email: '',
    mobile: '',
    password: '',
    dob: '',
    status: '',
    updatedAt: '',
    createdAt: '',
  );

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}


