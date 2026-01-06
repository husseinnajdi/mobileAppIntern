import 'package:flutter/material.dart';
import 'package:mobileappintern/screen/auth/loginpage.dart';
import 'package:mobileappintern/screen/auth/signuppage.dart';
import 'package:mobileappintern/screen/homepage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobileappintern/screen/onboardingscreen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  await Future.delayed(const Duration(seconds: 2));

  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Onboardingscreen(),
      routes: {
        Onboardingscreen.routeName: (context) => const Onboardingscreen(),
        Homepage.routeName: (context) => const Homepage(),
        Loginpage.routeName: (context) => const Loginpage(),
        Signuppage.routeName: (context) => const Signuppage(),
      },
    );
  }
}
