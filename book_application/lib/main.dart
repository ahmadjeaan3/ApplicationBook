import 'package:book_application/src/providers/ProfileProvider.dart';
import 'package:book_application/src/providers/onboarding_controller.dart';
import 'package:book_application/src/providers/onboarding_controller2.dart';
import 'package:book_application/src/screens/splach_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_application/src/providers/auth_provider.dart';
import 'package:book_application/src/providers/page_provider.dart';
import 'app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PageProvider()),
        ChangeNotifierProvider(create: (_) => OnBoardingController()),
        ChangeNotifierProvider(create: (_) => OnBoardingController2()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashPageState(),
        routes: routes,
      ),
    );
  }
}
