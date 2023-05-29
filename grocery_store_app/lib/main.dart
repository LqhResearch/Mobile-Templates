import 'pages/item_screen.dart';
import 'pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store_app/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cửa hàng tạp hoá',
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SplashScreen(),
        "/home-screen": (context) => const HomeScreen(),
        "/item-screen": (context) => const ItemScreen(),
      },
    );
  }
}
