import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plant_application/otp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const login());
}

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

TextEditingController mobilenoController = TextEditingController();

class _loginState extends State<login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = "";
  bool otpSent = false;

  void sendOTP() async {
    String phoneNumber = "+91${mobilenoController.text.trim()}"; // Add country code
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        print("Phone verified and user signed in");
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification failed: ${e.message}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.message}")),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          this.verificationId = verificationId;
          otpSent = true;
        });
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
           otpPage(
            verificationId: verificationId,
          ),
          // otpPage()
        ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Image.asset("assets/plant2.jpg"),
            ),
            const SizedBox(height: 50),
            const Center(
                child: Text(
              "Log in",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
            )),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: TextField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: mobilenoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.green, width: 0.5),
                    ),
                    hintText: "Enter Mobile Number",
                    hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: () {
                  if (mobilenoController.text.isNotEmpty) {
                    sendOTP(); 
                    log("mobile no: ${mobilenoController.text}");
                    ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text("OTP has been sent to your mobile number.")),
                    );// Trigger OTP
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text("Please enter a valid mobile number")),
                    );
                  }
                },
                child: Container(
                  height: 50,
                  width: 340,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(62, 102, 24, 1),
                      Color.fromRGBO(124, 180, 70, 1)
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 12, bottom: 10, left: 52, right: 53),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                height: 359,
                width: 359,
                child: Image.asset("assets/plant1.jpg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

