import 'package:flutter/material.dart';
import 'coffee_home_page.dart';

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee UI Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0C0F14),
        primaryColor: const Color(0xFFD17842),
      ),
      home: const CoffeeHomePage(),
    );
  }
}
