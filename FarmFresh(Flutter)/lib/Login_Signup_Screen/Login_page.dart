import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/navbar.dart';
import 'package:language_page/FarmerLogin_Screens/demo.dart';
import 'package:language_page/FarmerLogin_Screens/uploadPage.dart';
import 'package:language_page/Login_Signup_Screen/CustomSnackbar.dart';
import 'package:language_page/Login_Signup_Screen/ForgetPassWord1.dart';
import 'package:language_page/Login_Signup_Screen/signup_Customer.dart';
import 'package:language_page/Start_Screens/Sessiondata.dart';
import 'package:language_page/chatApplication/chatpage1.dart';

String? CustomerMail;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController txtEmailLogin_Page = TextEditingController();
  final TextEditingController txtPasswordLogin_Page = TextEditingController();
  final FirebaseAuth _firebaseAuthLoginPage = FirebaseAuth.instance;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              const Center(
                child: Text(
                  "Welcome to",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.asset("assets/farmfresh_logo.jpg"),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  cursorColor: Colors.green,
                  controller: txtEmailLogin_Page,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.green),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.red),
                    ),
                    hintText: "Enter Email",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your username";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Text(
                  "Password",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  cursorColor: Colors.green,
                  obscureText: !isPasswordVisible,
                  controller: txtPasswordLogin_Page,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.green),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.red),
                    ),
                    hintText: "Enter Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return "Password must be of 6 letters";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgetPassOne()));
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              Center(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                  ),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      if (txtEmailLogin_Page.text.trim().isNotEmpty &&
                          txtPasswordLogin_Page.text.trim().isNotEmpty) {
                        CustomerMail = txtEmailLogin_Page.text.trim();
                        try {
                          UserCredential userCredentialLogin_Page =
                              await _firebaseAuthLoginPage
                                  .signInWithEmailAndPassword(
                                      email: txtEmailLogin_Page.text,
                                      password: txtPasswordLogin_Page.text);
                          await Sessiondata.storeSessionData(
                              loginData: true,
                              emailId: userCredentialLogin_Page.user!.email!);

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavBarPage()),
                              (route) => false);

                          txtEmailLogin_Page.clear();
                          txtPasswordLogin_Page.clear();
                          isCustomer = true;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Login Successful",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.white,
                            ),
                          );
                        } on FirebaseAuthException catch (error) {
                          Customsnackbar.showCustomSnackbar(
                              message: error.code, context: context);
                        }
                      }
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Don't have an account?",
                  style: TextStyle(),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupCustomer(),
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 10,
                            backgroundImage:
                                AssetImage("assets/google logo.webp"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Continue with Google",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 10,
                            backgroundImage: AssetImage("assets/fb logo.png"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Continue with Facebook",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 10,
                            backgroundImage: AssetImage("assets/applelogo.png"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Continue with Apple",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
