import 'package:flutter/material.dart';
import 'package:greenovate/on_boarding/boarding1_page.dart';
import 'package:greenovate/on_boarding/boarding2_page.dart';
import 'package:greenovate/on_boarding/boarding3_page.dart';
import 'package:greenovate/screens/home/marketplace/marketplace_page.dart';
import 'package:greenovate/screens/mainpage.dart';
import 'splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/privacy_policy_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const MainPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => RegisterPage(),
        '/boarding1': (context) => Boarding1page(),
        '/boarding2': (context) => Boarding2page(),
        '/boarding3': (context) => Boarding3page(),
        '/privacy': (context) => const PrivacyPolicyPage(),
        '/marketplace': (context) => const MarketplacePage(),
        // Hapus rute '/productDetail' karena akan dinavigasi menggunakan MaterialPageRoute
      },
    );
  }
}
