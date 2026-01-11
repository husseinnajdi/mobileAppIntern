import 'package:flutter/material.dart';
import 'package:mobileappintern/provider/categoriesprovider.dart';
import 'package:mobileappintern/provider/productprovider.dart';
import 'package:mobileappintern/provider/swipperprovider.dart';
import 'package:mobileappintern/services/prefesHelper.dart';
import 'package:provider/provider.dart';
import 'package:mobileappintern/root_screen.dart';
import 'package:mobileappintern/screen/auth/loginpage.dart';
import 'package:mobileappintern/screen/auth/signuppage.dart';
import 'package:mobileappintern/screen/homepage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobileappintern/screen/onboardingscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  await Future.delayed(const Duration(seconds: 2));
  final prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;


  FlutterNativeSplash.remove();

  runApp( MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => Categoriesprovider()),
        ChangeNotifierProvider(create: (_) => Swipperprovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: isLoggedIn ? const RootScreen() : const Signuppage(),
        routes: {
          RootScreen.routName: (context) => const RootScreen(),
          Onboardingscreen.routeName: (context) => const Onboardingscreen(),
          Homepage.routeName: (context) => const Homepage(),
          Loginpage.routeName: (context) => const Loginpage(),
          Signuppage.routeName: (context) => const Signuppage(),
        },
      ),
    );
  }
}
