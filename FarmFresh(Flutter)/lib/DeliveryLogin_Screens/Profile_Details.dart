import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_page/Login_Signup_Screen/LoginPageDeliveryPerson.dart';
import 'package:language_page/Login_Signup_Screen/signup_DeliveryPersonModal.dart';
import 'package:language_page/Login_Signup_Screen/signup_deliveryperson.dart';

List signup_deliveryperson = [];

Future<void> check(String mail) async {
  signup_deliveryperson.clear();
  log("-----------------------------------------GET DATA========================================");

  log("Mail:   $mail");
  QuerySnapshot response = await FirebaseFirestore.instance
      .collection("Users")
      .doc(mail)
      .collection("DeliveryPerson")
      .get();
  log("Mail:$mail");
  log("got data: ${response.docs.length}");
  for (int i = 0; i < response.docs.length; i++) {
    signup_deliveryperson.add(DeliveryPersonModal(
      Name: response.docs[i]['Full Name'],
      UserName: response.docs[i]['Username'],
      Email: response.docs[i]['Email'],
      MobileNo: response.docs[i]['Mobile No'],
      Password: response.docs[i]['Password'],
      VehicleType: response.docs[i]['Vehicle Type'],
      Licence: response.docs[i]['Driving License No'],
      PlateNo: response.docs[i]['License Plate No'],
      VehicleModel: response.docs[i]['Vehicle Model'],
      BankAccountNumber: response.docs[i]['Bank Account Number'],
      IFSC: response.docs[i]['IFSC Code'],
      UPI: response.docs[i]['UPI ID'],
      EmergencyContactName: response.docs[i]['Emergency Contact Name'],
    ));
    log("In for Loop");
  }

  log("${signup_deliveryperson[0].Name}");
}

// ignore: must_be_immutable
class DeliveryPersonProfile1 extends StatefulWidget {
  const DeliveryPersonProfile1({super.key});

  @override
  State<DeliveryPersonProfile1> createState() => _DeliveryPersonProfile1State();
}

class _DeliveryPersonProfile1State extends State<DeliveryPersonProfile1> {
  // Create TextEditingController for each field to capture inputs
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();
  final TextEditingController licenceNumberController = TextEditingController();
  final TextEditingController yearOfExperienceController =
      TextEditingController();
  final TextEditingController averageRatingController = TextEditingController();

  void profile_BottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: 500,
          child: Padding(
            padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 26, 77, 28),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Name Field
                  const Text(
                    "Name:",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  TextField(
                    controller: nameController,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        hintText: "Enter your Name"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Mobile Number Field
                  const Text(
                    "Mobile No. :",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  TextField(
                    controller: mobileController,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        hintText: "Enter your Mobile Number"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Email Field
                  const Text(
                    "Email:",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  TextField(
                    controller: emailController,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        hintText: "Enter your Email"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Address Field
                  const Text(
                    "Address:",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  TextField(
                    controller: addressController,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        hintText: "Enter your Address"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Address Field
                  const Text(
                    "Vehicle Type:",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  TextField(
                    controller: vehicleTypeController,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        hintText: "Enter your Vehicle Type"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Address Field
                  const Text(
                    "Vehicle No.:",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  TextField(
                    controller: vehicleNumberController,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        hintText: "Enter your Vehicle No."),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Address Field
                  const Text(
                    "Licence No.:",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  TextField(
                    controller: licenceNumberController,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        hintText: "Enter your Licence No."),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Address Field
                  const Text(
                    "Year of Experience:",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  TextField(
                    controller: yearOfExperienceController,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        hintText: "Enter your Year of Experience"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {}); // To update UI after profile update
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // var signup_deliveryperson = [];

  // void check() async {
  //   log("-----------------------------------------GET DATA========================================");
  //   QuerySnapshot response = await FirebaseFirestore.instance
  //       .collection("Users")
  //       .doc("sangu@gmail.com")
  //       .collection("DeliveryPerson")
  //       .get();
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

  //   log("$signup_deliveryperson");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Color.fromARGB(255, 232, 236, 233),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        title: Text(
          "Profile",
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 26, 77, 28),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/MyValidPhoto.jpg"),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${signup_deliveryperson[0].Name}",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const Text(
                          "Delivery Specialist",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Profile Details in Tabular Format

                  ProfileTable(
                    data: {
                      "Contact Number": mobileController.text.isEmpty
                          ? signup_deliveryperson[0].MobileNo
                          : mobileController.text,
                      "Email": emailController.text.isEmpty
                          ? signup_deliveryperson[0].Email
                          : emailController.text,
                      "Address": addressController.text.isEmpty
                          ? "1234 narhe, pune, Maharastra"
                          : addressController.text,
                      "Vehicle Type": vehicleTypeController.text.isEmpty
                          ? "Bike"
                          : vehicleTypeController.text,
                      "Vehicle Number": vehicleNumberController.text.isEmpty
                          ? "MH11 4550"
                          : vehicleNumberController.text,
                      "License Number": licenceNumberController.text.isEmpty
                          ? "DL123456789"
                          : licenceNumberController.text,
                      "Years of Experience":
                          yearOfExperienceController.text.isEmpty
                              ? "3 years"
                              : yearOfExperienceController.text,
                      "Average Rating": "4.0 / 5.0",
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "About",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Dedicated and reliable delivery professional with over 3 years of experience in providing excellent customer service and timely deliveries.",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          profile_BottomSheet();
                        },
                        child: const Text(
                          "Update Profile",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTable extends StatelessWidget {
  final Map<String, String> data;

  const ProfileTable({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(0.7),
        1: FlexColumnWidth(0.7),
      },
      children: data.entries
          .map(
            (entry) => TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    entry.value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
