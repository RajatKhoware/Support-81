import 'package:flutter/cupertino.dart';
import 'package:support__81/models/user_model.dart';

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


