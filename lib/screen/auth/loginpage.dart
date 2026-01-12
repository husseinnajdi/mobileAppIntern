import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobileappintern/services/prefesHelper.dart';

class Loginpage extends StatefulWidget {
  static const String routeName = '/loginpage';
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  late final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  void loginfct()async{
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    try {
      await Prefeshelper.login(email, password);
      Navigator.pushReplacementNamed(context, '/Rootpage');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 178, 230),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Form(
                        child: Column(
                          children: [
                            Text(
                              "Let`s Sign You In",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("Welcome Back, You've been missed!"),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _emailController,
            
                              focusNode: _emailFocusNode,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
            
                              decoration: const InputDecoration(
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                fillColor: Colors.white,
                                hintText: "Email Address",
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
            
                              onFieldSubmitted: (value) {
                                FocusScope.of(
                                  context,
                                ).requestFocus(_passwordFocusNode);
                              },
                            ),
                            SizedBox(height: 12),
                            TextFormField(
                              controller: _passwordController,
            
                              focusNode: _passwordFocusNode,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
            
                              decoration: const InputDecoration(
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                fillColor: Colors.white,
                                hintText: "Password",
                                prefixIcon: Icon(Icons.remove_red_eye_outlined),
                              ),
                              onFieldSubmitted: (value) {
                                FocusScope.of(
                                  context,
                                ).requestFocus(_emailFocusNode);
                              },
                            ),
                            SizedBox(height: 20),
                              ElevatedButton(
                              onPressed: () {
                                loginfct();
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: Colors.red,
                              ),
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Dont have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(context, "/signuppage");
                                  },
                                  child: Text(
                                    "signup",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                    endIndent: 10,
                                  ),
                                ),
                                Text(
                                  " Or ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                    indent: 10,
                                  ),
                                ),
                              ],
                            ),SizedBox(height: 12),
                            ElevatedButton.icon(
                              onPressed: () {},
                              label: Text(
                                "Log In with Google",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              icon: Icon(Ionicons.logo_google),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/Rootpage');
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                "Enter As Guest",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
