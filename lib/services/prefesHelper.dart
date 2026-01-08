import 'package:shared_preferences/shared_preferences.dart';

class Prefeshelper {

static Future<void> signup(String email, String password,int phonenumber,String name,) async {
    final prefs = await SharedPreferences.getInstance();
    if (email.isNotEmpty) {
      await prefs.setString('email', email);
    }
    if (password.isNotEmpty) {
      await prefs.setString('password', password);
    }
    if (name.isNotEmpty) {
      await prefs.setString('name', name);
    }
    await setlogin(true);
  }
static Future<void> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('email');
    final storedPassword = prefs.getString('password');

    if (email == storedEmail && password == storedPassword) {
      await setlogin(true);
    } else {
      throw Exception('Invalid email or password');
    }
  }
  static Future<bool> getlogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<void> setlogin(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
  }
}