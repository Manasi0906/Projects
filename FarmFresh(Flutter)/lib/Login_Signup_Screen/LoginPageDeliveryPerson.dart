import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:language_page/DeliveryLogin_Screens/Navigation_bar.dart';
import 'package:language_page/DeliveryLogin_Screens/Profile_Details.dart';
import 'package:language_page/FarmerLogin_Screens/uploadPage.dart';
import 'package:language_page/Login_Signup_Screen/CustomSnackbar.dart';
import 'package:language_page/Login_Signup_Screen/ForgetPassWord1.dart';
import 'package:language_page/Login_Signup_Screen/signup_Customer.dart';
import 'package:language_page/Login_Signup_Screen/signup_DeliveryPersonModal.dart';
import 'package:language_page/Login_Signup_Screen/signup_deliveryperson.dart';

// var signup_deliveryperson = [];
String mail = "";

// void check(String mail) async {
//   log("-----------------------------------------GET DATA========================================");
//   QuerySnapshot response = await FirebaseFirestore.instance
//       .collection("Users")
//       .doc(mail)
//       .collection("DeliveryPerson")
//       .get();
//   log("Mail:$mail");
//   log("got data: ${response.docs.length}");
//   for (int i = 0; i < response.docs.length; i++) {
//     signup_deliveryperson.add(DeliveryPersonModal(
//       Name: response.docs[i]['Full Name'],
//       UserName: response.docs[i]['Username'],
//       Email: response.docs[i]['Email'],
//       MobileNo: response.docs[i]['Mobile No'],
//       Password: response.docs[i]['Password'],
//       VehicleType: response.docs[i]['Vehicle Type'],
//       Licence: response.docs[i]['Driving License No'],
//       PlateNo: response.docs[i]['License Plate No'],
//       VehicleModel: response.docs[i]['Vehicle Model'],
//       BankAccountNumber: response.docs[i]['Bank Account Number'],
//       IFSC: response.docs[i]['IFSC Code'],
//       UPI: response.docs[i]['UPI ID'],
//       EmergencyContactName: response.docs[i]['Emergency Contact Name'],
//     ));
//     log("In for Loop");
//   }

//   log("${signup_deliveryperson[0].Name}");
// }

class LoginPageDeliveryPerson extends StatefulWidget {
  const LoginPageDeliveryPerson({super.key});

  @override
  State<LoginPageDeliveryPerson> createState() =>
      _LoginPageDeliveryPersonState();
}

class _LoginPageDeliveryPersonState extends State<LoginPageDeliveryPerson> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController username_Login_DeliveryPerson =
      TextEditingController();
  final TextEditingController password_Login_DeliveryPerson =
      TextEditingController();
  bool isPasswordVisible = false;

  final FirebaseAuth _firebaseAuthDeliveryperson_Login = FirebaseAuth.instance;

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
                  "Username",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  cursorColor: Colors.green,
                  controller: username_Login_DeliveryPerson,
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
                    hintText: "Enter username",
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
                  controller: password_Login_DeliveryPerson,
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
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Spacer(),
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
                  SizedBox(width: 20),
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
                      if (username_Login_DeliveryPerson.text
                              .trim()
                              .isNotEmpty &&
                          password_Login_DeliveryPerson.text
                              .trim()
                              .isNotEmpty) {
                        try {
                          UserCredential login_DeliveryPersonCredentials =
                              await _firebaseAuthDeliveryperson_Login
                                  .signInWithEmailAndPassword(
                                      email: username_Login_DeliveryPerson.text
                                          .trim(),
                                      password: password_Login_DeliveryPerson
                                          .text
                                          .trim());
                          mail = username_Login_DeliveryPerson.text.trim();
                          // log(mail);
                          // check(mail);

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomePageDeliveryPerson()),
                              (route) => false);
                          username_Login_DeliveryPerson.clear();
                          password_Login_DeliveryPerson.clear();
                          log("hii");
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
                              message: error.message!, context: context);
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
                      builder: (context) => SignupDeliveryPerson(),
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
