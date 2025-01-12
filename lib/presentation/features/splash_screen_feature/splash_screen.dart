import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:currency_converter/core/config/routes/page_route_names.dart';
import 'package:currency_converter/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => navigatorKey.currentState!
          .pushReplacementNamed(PageRouteNames.homeScreen),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeInRight(
          child: Image.asset(
            "assets/images/currency_converter_app_icon.png",
          ),
        ),
      ),
    );
  }
}
