import 'package:flutter/material.dart';

class AuthProvider2 with ChangeNotifier {
  bool _isLoggedIn = true;

  bool get isLoggedIn => _isLoggedIn;

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}