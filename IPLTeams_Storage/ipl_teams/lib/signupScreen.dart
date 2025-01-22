import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipl_teams/loginScreen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobnoController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  "SignUp",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 22, 110, 182),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text("Name:", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 5),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your name",
                ),
              ),
              const SizedBox(height: 20),
              const Text("Mobile No:", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 5),
              TextField(
                controller: mobnoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your Mobile no.",
                ),
              ),
              const SizedBox(height: 20),
              const Text("Email:", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 5),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your email",
                ),
              ),
              const SizedBox(height: 20),
              const Text("Password:", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 5),
              TextField(
                controller: passController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your Password",
                ),
              ),
              const SizedBox(height: 80),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    log("abc");
                    if (emailController.text.isNotEmpty &&
                        passController.text.isNotEmpty &&
                        nameController.text.isNotEmpty &&
                        mobnoController.text.isNotEmpty) {
                      try {
                        UserCredential userCredential =
                            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text,
                        );
                        log("CreateAuth: $userCredential");

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("User Registered Successfully"),
                          ),
                        );

                        emailController.clear();
                        passController.clear();
                        nameController.clear();
                        mobnoController.clear();

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Auth_Inherited(),
                        ));
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.message ?? "An error occurred")),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Fill all the fields"),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
