import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_page/Login_Signup_Screen/CustomSnackbar.dart';
import 'package:language_page/Login_Signup_Screen/signup_DeliveryPersonModal.dart';

class SignupDeliveryPerson extends StatefulWidget {
  SignupDeliveryPerson({super.key});

  List<DeliveryPersonModal> signup_deliveryperson = [];

  @override
  State<SignupDeliveryPerson> createState() => _SignupDeliveryPersonState();
}

class _SignupDeliveryPersonState extends State<SignupDeliveryPerson> {
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth signup_DeliveryPersion_FirebaseAuth =
      FirebaseAuth.instance;

  // Personal Information Controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? selectedGender = 'Male';

  // Vehicle Information Controllers
  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController licensePlateController = TextEditingController();
  final TextEditingController drivingLicenseController =
      TextEditingController();
  final TextEditingController vehicleModelController = TextEditingController();
  DateTime? licenseExpiryDate;

  // Bank Information Controllers
  final TextEditingController bankAccountController = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();
  final TextEditingController upiIdController = TextEditingController();

  // Emergency Information Controllers
  final TextEditingController emergencyContactNameController =
      TextEditingController();
  final TextEditingController emergencyContactRelationController =
      TextEditingController();
  final TextEditingController emergencyContactNumberController =
      TextEditingController();

  bool isPasswordVisible = false;

  get signup_deliveryperson => null;
  // Future<void> fetchDeliveryPersonData() async {
  //   if (emailController.text.trim().isEmpty) {
  //     print("Email is empty. Cannot fetch data.");
  //     return;
  //   }

  //   try {
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('Users')
  //         .doc(emailController.text.trim())
  //         .collection('DeliveryPerson')
  //         .get();

  //     // Clear existing list
  //     widget.signup_deliveryperson.clear();

  //     for (var doc in querySnapshot.docs) {
  //       DeliveryPersonModal person = DeliveryPersonModal(
  //         Name: doc['Full Name'],
  //         Email: doc['Email'],
  //         MobileNo: doc['Mobile No'],
  //         Password: doc['Password'],
  //         VehicleType: doc['Vehicle Type'],
  //         Licence: doc['Driving License No'],
  //         PlateNo: doc['License Plate No'],
  //         VehicleModel: doc['Vehicle Model'],
  //         BankAccountNumber: doc['Bank Account Number'],
  //         IFSC: doc['IFSC Code'],
  //         UPI: doc['UPI ID'],
  //         EmergencyContactName: doc['Emergency Contact Name'],
  //         Relationship: doc['Relationship'],
  //         EmergencyContactNo: doc['Emergency Contact Number'],
  //       );
  //       signup_deliveryperson.add(DeliveryPersonModal(Name: querySnapshot.doc['Full Name'], Email: Email, MobileNo: MobileNo, Password: Password, VehicleType: VehicleType, Licence: Licence, PlateNo: PlateNo, VehicleModel: VehicleModel, BankAccountNumber: BankAccountNumber, IFSC: IFSC, UPI: UPI, EmergencyContactName: EmergencyContactName));
  //     }

  //     print("Fetched Delivery Person Data: ${widget.signup_deliveryperson}");
  //   } catch (e) {
  //     debugPrint("Error fetching delivery person data: $e");
  //   }
  // }

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

              // Personal Information
              buildSectionHeader("Personal Information"),
              buildTextField("Full Name", fullNameController),
              buildTextField("Username", usernameController),
              buildEmailField("Email", emailController),
              buildMobileField("Mobile No", mobileController),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: DropdownButtonFormField<String>(
                  value: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  items: const [
                    DropdownMenuItem(value: 'Male', child: Text('Male')),
                    DropdownMenuItem(value: 'Female', child: Text('Female')),
                    DropdownMenuItem(value: 'Other', child: Text('Other')),
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select Gender',
                  ),
                  validator: (value) =>
                      value == null ? 'Please select gender' : null,
                ),
              ),

              buildPasswordField("Password", passwordController),
              buildPasswordField("Confirm Password", confirmPasswordController,
                  isConfirm: true),

              // Vehicle Information
              const SizedBox(height: 20),
              buildSectionHeader("Vehicle Information"),
              buildTextField("Vehicle Type", vehicleTypeController),
              buildTextField("License Plate No", licensePlateController,
                  inputType: TextInputType.number),
              buildTextField("Driving License No", drivingLicenseController,
                  inputType: TextInputType.number),
              buildTextField("Vehicle Model", vehicleModelController),

              // License Expiry Date
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        licenseExpiryDate = selectedDate;
                      });
                    }
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: TextEditingController(
                        text: licenseExpiryDate == null
                            ? 'Select Expiry Date'
                            : '${licenseExpiryDate!.toLocal()}'.split(' ')[0],
                      ),
                      decoration: const InputDecoration(
                        labelText: 'License Expiry Date',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),

              // Bank Information
              const SizedBox(height: 20),
              buildSectionHeader("Bank Information"),
              buildTextField("Bank Account Number", bankAccountController,
                  inputType: TextInputType.number),
              buildTextField("IFSC Code", ifscCodeController),
              buildTextField("UPI ID", upiIdController),

              // Emergency Information
              const SizedBox(height: 20),
              buildSectionHeader("Emergency Information"),
              buildTextField(
                  "Emergency Contact Name", emergencyContactNameController),
              buildTextField(
                  "Relationship", emergencyContactRelationController),
              buildMobileField(
                  "Emergency Contact Number", emergencyContactNumberController),

              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Process data
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Form Submitted Successfully!')),
                      );
                      Map<String, dynamic> data = {
                        "Full Name": fullNameController.text.trim(),
                        "Username": usernameController.text.trim(),
                        "Email": emailController.text.trim(),
                        "Mobile No": mobileController.text.trim(),
                        "Password": passwordController.text.trim(),
                        "Confirm Password":
                            confirmPasswordController.text.trim(),
                        "Vehicle Type": vehicleTypeController.text.trim(),
                        "Driving License No":
                            drivingLicenseController.text.trim(),
                        "License Plate No": licensePlateController.text.trim(),
                        "Vehicle Model": vehicleModelController.text.trim(),
                        "Bank Account Number":
                            bankAccountController.text.trim(),
                        "IFSC Code": ifscCodeController.text.trim(),
                        "UPI ID": upiIdController.text.trim(),
                        "Emergency Contact Name":
                            emergencyContactNameController.text.trim(),
                        "Relationship":
                            emergencyContactRelationController.text.trim(),
                        "Emergency Contact Number":
                            emergencyContactNumberController.text.trim(),
                      };

                      await FirebaseFirestore.instance
                          .collection("Users")
                          .doc(emailController.text.trim())
                          .collection("DeliveryPerson")
                          .add(data);

                      if (usernameController.text.trim().isNotEmpty &&
                          passwordController.text.trim().isNotEmpty) {
                        try {
                          UserCredential signup_DeliveryPersonCredentails =
                              await signup_DeliveryPersion_FirebaseAuth
                                  .createUserWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim());
                          log("USER CREDENTIALS : $signup_DeliveryPersonCredentails");

                          Customsnackbar.showCustomSnackbar(
                            message: "User Registered Successfully",
                            context: context,
                          );

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

                      // Clear all fields after submission
                      setState(() {
                        fullNameController.clear();
                        usernameController.clear();
                        emailController.clear();
                        mobileController.clear();
                        passwordController.clear();
                        confirmPasswordController.clear();
                        selectedGender = 'Male';
                        vehicleTypeController.clear();
                        licensePlateController.clear();
                        drivingLicenseController.clear();
                        vehicleModelController.clear();
                        licenseExpiryDate = null;
                        bankAccountController.clear();
                        ifscCodeController.clear();
                        upiIdController.clear();
                        emergencyContactNameController.clear();
                        emergencyContactRelationController.clear();
                        emergencyContactNumberController.clear();
                      });
                    }
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, top: 20),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding buildTextField(String label, TextEditingController controller,
      {TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Material(
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
              return 'Please Enter $label';
            }
            return null;
          },
        ),
      ),
    );
  }

  Padding buildEmailField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Material(
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter $label';
            }
            if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                .hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
      ),
    );
  }

  Padding buildMobileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Material(
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter $label';
            }
            if (value.length != 10) {
              return 'Mobile number must be 10 digits';
            }
            return null;
          },
        ),
      ),
    );
  }

  Padding buildPasswordField(String label, TextEditingController controller,
      {bool isConfirm = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Material(
        child: TextFormField(
          controller: controller,
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.green,
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
              return 'Please Enter $label';
            }
            if (isConfirm && value != passwordController.text) {
              return 'Passwords do not match';
            }
            if (!isConfirm && value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ),
    );
  }
}


// Future<void> fetchSpecificField(
                      //     String email, String fieldName) async {
                      //   try {
                      //     // Fetch data from the DeliveryPerson subcollection of a user
                      //     QuerySnapshot deliveryPersonData = await FirebaseFirestore
                      //         .instance
                      //         .collection('Users')
                      //         .doc(
                      //             email) // Use the email as the user document ID
                      //         .collection('DeliveryPerson')
                      //         .get();

                      //   if (deliveryPersonData.docs.isNotEmpty) {
                      //     // Assuming you're fetching the first document
                      //     var doc = deliveryPersonData.docs.first;

                      //     // Safely getting fields (handling nulls with default values if necessary)
                      //     String? DeliveryPersonName = doc.get("Name") ?? "";
                      //     String? DeliveryPersonEmail =
                      //         doc.get("Email") ?? "";
                      //     String? DeliveryPersonMobileNo =
                      //         doc.get("Mobile No") ?? "";
                      //     String? DeliveryPersonPassword =
                      //         doc.get("Password") ?? "";
                      //     String? DeliveryPersonVehicleType =
                      //         doc.get("Vehicle Type") ?? "";
                      //     String? DeliveryPersonLicence =
                      //         doc.get("Driving License No") ?? "";
                      //     String? DeliveryPersonPlateNo =
                      //         doc.get("License Plate No") ?? "";
                      //     String? DeliveryPersonVehicleModal =
                      //         doc.get("Vehicle Model") ?? "";
                      //     String? DeliveryPersonVehicleBAN =
                      //         doc.get("Bank Account Number") ?? "";
                      //     String? DeliveryPersonVehicleIFSC =
                      //         doc.get("IFSC Code") ?? "";
                      //     String? DeliveryPersonVehicleUPI =
                      //         doc.get("UPI ID") ?? "";
                      //     String? DeliveryPersonVehicleECN =
                      //         doc.get("Emergency Contact Name") ?? "";
                      //     String? DeliveryPersonVehicleRelation =
                      //         doc.get("Relationship") ?? "";
                      //     String? DeliveryPersonVehicleECNo =
                      //         doc.get("Emergency Contact Number") ?? "";

                      //     print('$fieldName: $DeliveryPersonName');
                      //     print('$fieldName: $DeliveryPersonEmail');
                      //     print('$fieldName: $DeliveryPersonMobileNo');
                      //     print('$fieldName: $DeliveryPersonPassword');
                      //     print('$fieldName: $DeliveryPersonVehicleType');
                      //     print('$fieldName: $DeliveryPersonLicence');
                      //     print('$fieldName: $DeliveryPersonPlateNo');
                      //     print('$fieldName: $DeliveryPersonVehicleModal');
                      //     print('$fieldName: $DeliveryPersonVehicleBAN');
                      //     print('$fieldName: $DeliveryPersonVehicleIFSC');
                      //     print('$fieldName: $DeliveryPersonVehicleUPI');
                      //     print('$fieldName: $DeliveryPersonVehicleECN');

                      //     // Add the data to your list (ensure all fields are passed correctly)
                      //     SignupDeliveryPerson()
                      //         .signup_deliveryperson
                      //         .add(DeliveryPersonModal(
                      //           Name: DeliveryPersonName,
                      //           Email: DeliveryPersonEmail,
                      //           MobileNo: DeliveryPersonMobileNo,
                      //           Password: DeliveryPersonPassword,
                      //           VehicleType: DeliveryPersonVehicleType,
                      //           Licence: DeliveryPersonLicence,
                      //           PlateNo: DeliveryPersonPlateNo,
                      //           VehicleModel: DeliveryPersonVehicleModal,
                      //           VehicleBAN: DeliveryPersonVehicleBAN,
                      //           VehicleIFSC: DeliveryPersonVehicleIFSC,
                      //           VehicleUPI: DeliveryPersonVehicleUPI,
                      //           VehicleECN: DeliveryPersonVehicleECN,
                      //           Relationship: DeliveryPersonVehicleRelation,
                      //           EmergencyContactNo: DeliveryPersonVehicleECNo,
                      //         ));
                      //   } else {
                      //     print('No data found for this delivery person.');
                      //   }
                      // } catch (e) {
                      //   print('Error fetching specific field: $e');
                      // }
                      //}