import 'dart:async';

import 'package:flutter/material.dart';
import 'package:main/contact_list_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    Timer(Duration(seconds: 3),() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContactListView()),
      );
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/2023_Facebook_icon.svg/2048px-2023_Facebook_icon.svg.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        )
      ),

    );
  }
}