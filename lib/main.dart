import 'package:flutter/material.dart';
import 'package:mobileappintern/provider/categoriesprovider.dart';
import 'package:mobileappintern/provider/productprovider.dart';
import 'package:mobileappintern/provider/swipperprovider.dart';
import 'package:mobileappintern/screen/splashonboarding/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:mobileappintern/root_screen.dart';
import 'package:mobileappintern/screen/auth/loginpage.dart';
import 'package:mobileappintern/screen/auth/signuppage.dart';
import 'package:mobileappintern/screen/rootscreens/homepage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobileappintern/screen/splashonboarding/onboardingscreen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  await Future.delayed(const Duration(seconds: 2));


  FlutterNativeSplash.remove();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home:  Splashscreen() ,
        routes: {
          RootScreen.routName: (context) => const RootScreen(),
          Onboardingscreen.routeName: (context) => const Onboardingscreen(),
          Homepage.routeName: (context) => const Homepage(),
          Loginpage.routeName: (context) => const Loginpage(),
          Signuppage.routeName: (context) => const Signuppage(),
          Splashscreen.routeName: (context) => const Splashscreen(),
        },
      ),
    );
  }
}
