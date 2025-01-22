import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/Product_individual.dart';
import 'package:language_page/FarmerLogin_Screens/NotificationFarmer.dart';
import 'package:language_page/FarmerLogin_Screens/NotificationModel.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify OTP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Enter the OTP sent to your registered number:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            TextField(
              cursorColor: Colors.green,
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6, // Assuming OTP is 6 digits
              decoration: InputDecoration(
                hintText: "Enter OTP",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                counterText: "",
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                // Handle OTP verification
                if (_otpController.text == "123456") {
                  Map<String, dynamic> notifyfarmerbydeliveryperson = {
                    'title': "Order Delivery Successfully",
                    "Message":
                        "Your order for OrderNo:$orderNo delivered Successfully"
                  };
                  await FirebaseFirestore.instance
                      .collection("NotificationFarmer")
                      .doc("s@gmail.com")
                      .collection("FN")
                      .add(notifyfarmerbydeliveryperson);

                  Future<void> getFarmerNotifications2() async {
                    farmerNotifications.clear();
                    try {
                      QuerySnapshot response = await FirebaseFirestore.instance
                          .collection("NotificationFarmer")
                          .doc("s@gmail.com")
                          .collection("FN")
                          .get();
                      log("in notify");
                      for (int i = 0; i < response.docs.length; i++) {
                        farmerNotifications.add(
                          NotificationModelFarmer(
                              title: response.docs[i]['title'],
                              message: response.docs[i]['Message'],
                              isSeen: false),
                        );
                        log("Got the Notification for farmer");
                      }
                    } catch (e) {
                      log("Error in FarmerNotification:$e");
                    }
                  }

                  getFarmerNotifications2();

                  // farmerorder.homePage(2);
                  print("past");
                  setState(() {});
                  _otpController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Order Delivered Successfully!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Invalid OTP! Please try again."),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Order Delivered",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
