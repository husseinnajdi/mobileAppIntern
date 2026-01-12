import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobileappintern/services/prefesHelper.dart';

class Splashscreen extends StatefulWidget {
  static const String routeName = '/splashscreen';
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () async =>await Prefeshelper.getlogin() ?Navigator.pushReplacementNamed(context, "/Rootpage"):
      Navigator.pushReplacementNamed(context, "/onboardingscreen"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: SizedBox.expand(
    child: Image.asset(
      'assets/splashscreen1.png',
      fit: BoxFit.cover,
    ),
  ),
);
  }
}
