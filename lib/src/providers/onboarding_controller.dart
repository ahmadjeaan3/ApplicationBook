import 'package:flutter/material.dart';

class OnBoardingController with ChangeNotifier {
  final PageController _pageController = PageController();
  late BuildContext _context;
  int _currentPage = 0;

  PageController get pageController => _pageController;
  int get currentPage => _currentPage;

  set context(BuildContext context) {
    _context = context;
  }

  void onPageChanged(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(_context, "/loginScreen");
    }
  }
}
