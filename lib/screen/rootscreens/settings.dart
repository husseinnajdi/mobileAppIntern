import 'package:flutter/material.dart';
import 'package:mobileappintern/screen/auth/loginpage.dart';
import 'package:mobileappintern/services/prefesHelper.dart';

class Settings extends StatefulWidget {
  static const String routeName = '/settings';
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Map<String, String?>? userData;
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final data = await Prefeshelper.getUserData();
    final login = await Prefeshelper.getlogin();
    setState(() {
      userData = data;
      isLoggedIn = login;
    });
    


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Visibility(
              visible: false,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("please login to have full access"),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.surfaceBright,
                        width: 3,
                      ),
                      image: DecorationImage(
                        image: Image.asset('assets/default.jpg').image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userData?['name'] ?? "Guest User",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(userData?["email"]??"Guest User"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "general",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    leading: Image.asset(
                      'assets/profile/order_svg.png',
                      height: 32,
                      width: 32,
                    ),
                    title: const Text(
                      "all orders",
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    leading: Image.asset(
                      'assets/profile/editprofile.png',
                      height: 32,
                      width: 32,
                    ),
                    title: const Text(
                      "edit profile",
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    leading: Image.asset(
                      'assets/profile/allproduct.png',
                      height: 32,
                      width: 32,
                    ),
                    title: const Text(
                      "All Products",
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    leading: Image.asset(
                      'assets/profile/payment.png',
                      height: 32,
                      width: 32,
                    ),
                    title: const Text(
                      "payment methods",
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height: 10),

                  const Divider(),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        Prefeshelper.logout();
                        await Navigator.pushReplacementNamed(
                          context,
                          Loginpage.routeName,
                        );
                      },
                      icon: const Icon(Icons.logout,color: Colors.white,),
                      label:  Text(isLoggedIn ? "Logout" : "Login",style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
