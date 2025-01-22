import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_page/Customer_Login_Screens/YourProfile.dart';
import 'package:language_page/Login_Signup_Screen/CustomSnackbar.dart';

class SignupFarmer extends StatefulWidget {
  const SignupFarmer({super.key});

  @override
  State<SignupFarmer> createState() => _SignupFarmerState();
}

class _SignupFarmerState extends State<SignupFarmer> {
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _firebaseAuth_signupFarmer = FirebaseAuth.instance;

  // Personal Information Controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Farm Information Controllers
  final TextEditingController farmNameController = TextEditingController();
  final TextEditingController farmLocationController = TextEditingController();
  final TextEditingController farmSizeController = TextEditingController();
  final TextEditingController farmTypeController = TextEditingController();

  // Payment Information Controllers
  final TextEditingController bankAccountController = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();
  final TextEditingController upiIdController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
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
              buildTextField("FullName", fullNameController),
              buildTextField("Username", usernameController),
              buildTextField("Email", emailController,
                  inputType: TextInputType.emailAddress),
              buildMobileField("MobileNo", mobileController),
              buildPasswordField("Password", passwordController),
              buildPasswordField("ConfirmPassword", confirmPasswordController,
                  isConfirm: true),

              // Farm Information
              const SizedBox(height: 20),
              buildSectionHeader("FarmInformation"),
              buildTextField("FarmName", farmNameController),
              buildClickableField("Address", addressController, () async {
                final newAddressfor_farmers = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressPage(),
                  ),
                );
                if (newAddressfor_farmers != null) {
                  setState(() {
                    addressController.text = newAddressfor_farmers;
                  });
                }
              }),
              buildNumericField("FarmSize(acres)", farmSizeController),
              buildTextField("TypeofFarming", farmTypeController),

              // Payment Information
              const SizedBox(height: 20),
              buildSectionHeader("PaymentInformation"),
              buildNumericField("BankAccountNumber", bankAccountController),
              buildTextField("IFSCCode", ifscCodeController),
              buildTextField("UPIID", upiIdController),

              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> data = {
                      "FullName": fullNameController.text.trim(),
                      "Username": usernameController.text.trim(),
                      "Email": emailController.text.trim(),
                      "MobileNo": mobileController.text.trim(),
                      "Password": passwordController.text.trim(),
                      "ConfirmPassword": confirmPasswordController.text.trim(),
                      "FarmName": farmNameController.text.trim(),
                      "Address": addressController.text.trim(),
                      "FarmSize(in acres)": farmSizeController.text.trim(),
                      "TypeofFarming": farmTypeController.text.trim(),
                      "BankAccountNumber": bankAccountController.text.trim(),
                      "IFSCCode": ifscCodeController.text.trim(),
                      "UPIID": upiIdController.text.trim(),
                    };
                    if (_formKey.currentState!.validate()) {
                      // Clear all fields after submission

                      FirebaseFirestore.instance
                          .collection("Users")
                          .doc(emailController.text.trim())
                          .collection("Farmer")
                          .add(data);
                      if (usernameController.text.trim().isNotEmpty &&
                          passwordController.text.trim().isNotEmpty) {
                        try {
                          UserCredential signup_farmer_credentials =
                              await _firebaseAuth_signupFarmer
                                  .createUserWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim());
                          log("User Credentials farmer: $signup_farmer_credentials");
                          Customsnackbar.showCustomSnackbar(
                              message: "User Registered Successfully",
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

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Form submitted successfully!'),
                        ),
                      );
                    }

                    clearFields();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(100, 50),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding buildTextField(String label, TextEditingController controller,
      {TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextFormField(
        controller: controller,
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
        keyboardType: inputType,
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

  Padding buildMobileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          } else if (value.length != 10) {
            return 'Please enter a valid 10-digit mobile number';
          }
          return null;
        },
      ),
    );
  }

  Padding buildPasswordField(String label, TextEditingController controller,
      {bool isConfirm = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: !isPasswordVisible,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
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

  Padding buildNumericField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  void clearFields() {
    fullNameController.clear();
    usernameController.clear();
    emailController.clear();
    mobileController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    farmNameController.clear();
    farmLocationController.clear();
    farmSizeController.clear();
    farmTypeController.clear();
    bankAccountController.clear();
    ifscCodeController.clear();
    upiIdController.clear();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    farmNameController.dispose();
    farmLocationController.dispose();
    farmSizeController.dispose();
    farmTypeController.dispose();
    bankAccountController.dispose();
    ifscCodeController.dispose();
    upiIdController.dispose();
    super.dispose();
  }
}
