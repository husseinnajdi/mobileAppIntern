import 'package:flutter/material.dart';
import 'package:mobileappintern/screen/splashonboarding/onboardingcontent.dart';

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
      Navigator.pushReplacementNamed(context, '/signuppage');
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
    Navigator.pushReplacementNamed(context, '/Rootpage');
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
            title: "Welcome to Our Store",
            description:
                "Shop your favorite products easily and securely in one place.",
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
            title: "Best Deals & Offers",
            description:
                "Discover exclusive discounts and special offers every day.",
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
            title: "Fast & Easy Shopping",
            description:
                "Add to cart, checkout quickly, and enjoy fast delivery.",
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
