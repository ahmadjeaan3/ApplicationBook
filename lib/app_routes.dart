import 'package:book_application/src/screens/home_screen.dart';
import 'package:book_application/src/screens/login_screen.dart';
import 'package:book_application/src/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/onboardingScreen": (context) => const OnBoardingPage(),
  "/loginScreen": (context) => const LoginScreen(),
  "/booksPage": (context) => const HomePage(),
};
