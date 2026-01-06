import 'package:flutter/material.dart';
import 'package:mobileappintern/screen/onboardingcontent.dart';

class Onboardingscreen extends StatefulWidget {
  static const String routeName = '/onboardingscreen';
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  void nextpage() {
    if (currentPage < 2) {
      currentPage++;
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushNamed(context, '/signuppage');
    }
  }

  void previouspage() {
    if (currentPage > 0) {
      currentPage--;
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void skip() {
    finishonboarding();
  }

  void finishonboarding() {
    Navigator.pushNamed(context, '/homepage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        children: [
          OnboardingPage(
            title: "Welcome to Our App",
            description: "Discover new features and functionalities.",
            image: "assets/onboarding/onboarding1.png",
            onNext: () {
              nextpage();
            },
            onSkip: () {
              skip();
            },
            isLast: false,
          ),
          OnboardingPage(
            title: "Stay Connected",
            description: "Connect with people around the world.",
            image: "assets/onboarding/onboarding2.png",
            onNext: () {
              nextpage();
            },
            onSkip: () {
              skip();
            },
            isLast: false,
          ),
          OnboardingPage(
            title: "Get Started",
            description: "Let's get you set up and ready to go!",
            image: "assets/onboarding/onboarding3.png",
            onNext: () {
              nextpage();
            },
            onSkip: () {
              skip();
            },
            isLast: true,
          ),
        ],
      ),
    );
  }
}
