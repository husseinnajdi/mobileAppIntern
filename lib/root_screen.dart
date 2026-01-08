import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mobileappintern/screen/cart.dart';
import 'package:mobileappintern/screen/favorite.dart';
import 'package:mobileappintern/screen/homepage.dart';
import 'package:mobileappintern/screen/settings.dart';

class RootScreen extends StatefulWidget {
  static const routName = "/Rootpage";
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController controller;
  int curentscreen = 0;
  List<Widget> screens = [
    const Homepage(),
    const Favorite(),
    const Cart(),
    const Settings(),
  ];
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: curentscreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: curentscreen,
        onDestinationSelected: (index) {
          setState(() {
            curentscreen = index;
          });
          controller.jumpToPage(curentscreen);
        },
        destinations: [
          const NavigationDestination(
              selectedIcon: Icon(IconlyBold.home),
              icon: Icon(IconlyLight.home),
              label: "home"),
          const NavigationDestination(
              selectedIcon: Icon(IconlyBold.heart),
              icon: Icon(IconlyLight.heart),
              label: "favorite"),
          NavigationDestination(
              selectedIcon: const Icon(IconlyBold.bag_2),
              icon: const Icon(IconlyLight.bag_2),
              label: "cart"), 
          const NavigationDestination(
              selectedIcon: Icon(IconlyBold.setting),
              icon: Icon(IconlyLight.setting),
              label: "setting"),
        ],
      ),
    );
  }
}
