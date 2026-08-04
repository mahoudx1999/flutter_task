import 'package:flutter/material.dart';
import 'Drink_home_page.dart';

void main() {
  runApp(CoffeeApp());
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
        scaffoldBackgroundColor: Color(0xFF0C0F14),
        primaryColor: Color(0xFFD17842),
      ),
      home: CoffeeHomePage(),
    );
  }
}
