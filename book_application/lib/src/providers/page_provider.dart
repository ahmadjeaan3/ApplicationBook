// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;

  void nextPage() {
    currentIndex++;
    pageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    notifyListeners();
  }

  void setPage(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
