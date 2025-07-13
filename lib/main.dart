import 'package:flutter/material.dart';
import 'package:main/contact_list_view.dart';
import 'package:main/login_view.dart';
import 'package:main/post_view.dart';
import 'package:main/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}