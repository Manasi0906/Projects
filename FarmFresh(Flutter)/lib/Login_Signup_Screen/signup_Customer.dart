import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:language_page/Customer_Login_Screens/YourProfile.dart';
import 'package:language_page/Login_Signup_Screen/CustomSnackbar.dart';
import 'package:language_page/Login_Signup_Screen/Customersignupmodal.dart';
import 'package:language_page/Login_Signup_Screen/Login_page.dart';

List signupCustomer = [];

Future<void> getSignupCustomerData(String CustomerMail) async {
  try {
    log("-----------------------------------------GET DATA========================================");

    // Fetch data from Firebase Firestore
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection("Users")
        .doc(CustomerMail)
        .collection("Customer")
        .get();

    log("Mail:$CustomerMail");
    log("got data: ${response.docs.length}");

    // Loop through the documents and add data to signupCustomer
    for (int i = 0; i < response.docs.length; i++) {
      signupCustomer.add(Customersignupmodal(
        Name: response.docs[i]['Full Name'],
        UserName: response.docs[i]['Username'],
        Email: response.docs[i]['Email'],
        MobileNo: response.docs[i]['Mobile No'],
        Address: response.docs[i]['Address'],
        Password: response.docs[i]['Password'],
        ConfirmPassword: response.docs[i]['Confirm Password'],
      ));
      log("In for Loop");
    }

    // Access data from signupCustomer correctly
    if (signupCustomer.isNotEmpty) {
      log(signupCustomer[0]
          .Name); // Correct way to access the property of the object
    } else {
      log("No data found for the customer.");
    }
  } catch (e) {
    // Catch any error that occurs during the Firebase call or data processing
    log("Error fetching customer data: $e");
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SignupCustomer(),
      ),
    );
  }
}

class SignupCustomer extends StatefulWidget {
  SignupCustomer({super.key});

  final List<Map> myproducts = [];

  @override
  State<SignupCustomer> createState() => _SignupCustomerState();
}

class _SignupCustomerState extends State<SignupCustomer> {
  final _formKey = GlobalKey<FormState>();

  // Personal Information Controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth_Signup_Customer = FirebaseAuth.instance;

  // Address Information Controllers
  final TextEditingController addressController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Let's get started. Are you ready to be part of something new? Then move forward with us!",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              buildSectionHeader("Personal Information"),
              buildTextField("Full Name", fullNameController),
              buildTextField("Username", usernameController),
              buildTextField("Email", emailController,
                  inputType: TextInputType.emailAddress),
              buildMobileField("Mobile No", mobileController),
              buildClickableField("Address", addressController, () async {
                final newAddress = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressPage(),
                  ),
                );
                if (newAddress != null) {
                  setState(() {
                    addressController.text = newAddress;
                  });
                }
              }),
              buildPasswordField("Password", passwordController),
              buildPasswordField("Confirm Password", confirmPasswordController,
                  isConfirm: true),
              Center(
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.green)),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        Map<String, dynamic> data = {
                          "Full Name": fullNameController.text.trim(),
                          "Username": usernameController.text.trim(),
                          "Email": emailController.text.trim(),
                          "Mobile No": mobileController.text.trim(),
                          "Address": addressController.text.trim(),
                          "Password": passwordController.text.trim(),
                          "Confirm Password":
                              confirmPasswordController.text.trim(),
                        };

                        FirebaseFirestore.instance
                            .collection("Users")
                            .doc(emailController.text.trim())
                            .collection("Customer")
                            .add(data);
                        if (fullNameController.text.trim().isNotEmpty &&
                            usernameController.text.trim().isNotEmpty &&
                            emailController.text.trim().isNotEmpty &&
                            addressController.text.trim().isNotEmpty &&
                            mobileController.text.trim().isNotEmpty &&
                            passwordController.text.trim().isNotEmpty) {
                          try {
                            UserCredential userCredential_Signup_Customer =
                                await _firebaseAuth_Signup_Customer
                                    .createUserWithEmailAndPassword(
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim());
                            log("USER CREDENTIALS :$userCredential_Signup_Customer");

                            Customsnackbar.showCustomSnackbar(
                                message: "User Register Successfully",
                                context: context);
                            Navigator.of(context).pop();
                          } on FirebaseAuthException catch (error) {
                            Customsnackbar.showCustomSnackbar(
                                message: error.message!, context: context);
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Welcome to FarmFresh",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget buildClickableField(
      String label, TextEditingController controller, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: AbsorbPointer(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: const Icon(Icons.arrow_forward_ios),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $label';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

  Widget buildMobileField(String label, TextEditingController controller) {
    return buildTextField(label, controller, inputType: TextInputType.phone);
  }

  Widget buildPasswordField(String label, TextEditingController controller,
      {bool isConfirm = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: !isPasswordVisible,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
            return 'Please enter $label';
          }
          if (isConfirm && value != passwordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
      ),
    );
  }

  Widget buildNumericField(String label, TextEditingController controller) {
    return buildTextField(label, controller, inputType: TextInputType.number);
  }

  void clearFields() {
    fullNameController.clear();
    usernameController.clear();
    emailController.clear();
    mobileController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    addressController.clear();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
