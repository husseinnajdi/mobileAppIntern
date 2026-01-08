import 'package:flutter/material.dart';
import 'package:mobileappintern/services/prefesHelper.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void logoutfct() {
    Prefeshelper.setlogin(false);
    Navigator.pushReplacementNamed(context, '/loginpage');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          logoutfct();
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: Text("Logout",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
