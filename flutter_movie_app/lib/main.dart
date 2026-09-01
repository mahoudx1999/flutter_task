import 'package:flutter/material.dart';
import 'Movie_home_page.dart';

void main() {
  runApp(const Movieapp());
}

class Movieapp extends StatelessWidget {
  const Movieapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie app',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0C0F14),
      ),
      home: const MovieHomePage(),
    );
  }
}
