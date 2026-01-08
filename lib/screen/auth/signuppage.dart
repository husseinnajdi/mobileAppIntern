import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobileappintern/services/prefesHelper.dart';

class Signuppage extends StatefulWidget {
  static const String routeName = '/signuppage';
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  late TextEditingController phonenumbertextcontroller;
  late TextEditingController namecontroller;
  late TextEditingController emailtextcontroller;
  late TextEditingController passwordtextcontroller;
  late TextEditingController confirmpasswordtextcontroller;
  late FocusNode namefocusnode;
  late FocusNode phonenumberfocusnode;
  late FocusNode emailfocusnode;
  late FocusNode passwordfocusnode;
  late FocusNode confirmpasswordfocusnode;
  late final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    phonenumbertextcontroller = TextEditingController();
    namecontroller = TextEditingController();
    confirmpasswordtextcontroller = TextEditingController();
    confirmpasswordfocusnode = FocusNode();
    namefocusnode = FocusNode();
    emailtextcontroller = TextEditingController();
    passwordtextcontroller = TextEditingController();
    phonenumberfocusnode = FocusNode();
    emailfocusnode = FocusNode();
    passwordfocusnode = FocusNode();
  }


void signupfct()async{
  String email=emailtextcontroller.text.trim();
  String password=passwordtextcontroller.text.trim();
  String name=namecontroller.text.trim();
  int phonenumber=int.parse(phonenumbertextcontroller.text.trim());
  if(email.isNotEmpty && password.isNotEmpty && name.isNotEmpty && phonenumbertextcontroller.text.isNotEmpty){
    if(password!=confirmpasswordtextcontroller.text.trim()){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password do not match"))
      );
      return;
    }
    await Prefeshelper.signup(email, password, phonenumber, name);
    Navigator.pushReplacementNamed(context, '/Rootpage');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 178, 230),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Text(
                            'Sign Up ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("Create You Account Now!"),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: phonenumbertextcontroller,
          
                            focusNode: phonenumberfocusnode,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
          
                            decoration: const InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              fillColor: Colors.white,
                              hintText: "Phone Number",
                              prefixIcon: Icon(Icons.phone_enabled_outlined),
                            ),
          
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(namefocusnode);
                            },
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: namecontroller,
          
                            focusNode: namefocusnode,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
          
                            decoration: const InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              fillColor: Colors.white,
                              hintText: "Name",
                              prefixIcon: Icon(Icons.person_outline),
                            ),
          
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(emailfocusnode);
                            },
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: emailtextcontroller,
          
                            focusNode: emailfocusnode,
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
                              ).requestFocus(passwordfocusnode);
                            },
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: passwordtextcontroller,
          
                            focusNode: passwordfocusnode,
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
                              ).requestFocus(confirmpasswordfocusnode);
                            },
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: confirmpasswordtextcontroller,
          
                            focusNode: confirmpasswordfocusnode,
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
                              hintText: "confirm Password",
                              prefixIcon: Icon(Icons.remove_red_eye_outlined),
                            ),
          
                            onFieldSubmitted: (value) {
                              FocusScope.of(
                                context,
                              ).requestFocus(passwordfocusnode);
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              signupfct();
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: Colors.red,
                            ),
                            child: Text(
                              "Sign Up",
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
                              Text("Already have an account?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, "/loginpage");
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
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
                          ),
                          SizedBox(height: 12),
                          ElevatedButton.icon(
                            onPressed: () {},
                            label: Text(
                              "Sign Up with Google",
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
    );
  }
}
