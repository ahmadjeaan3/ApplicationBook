// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  String _name = 'ahmad mazen jeaan';
  String _email = 'ahmadjeaan@example.com';

  String get name => _name;
  String get email => _email;

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }
}