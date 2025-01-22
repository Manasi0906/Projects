import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:language_page/FarmerLogin_Screens/FAQs.dart';
import 'package:language_page/FarmerLogin_Screens/ProfileDetail.dart';
import 'package:language_page/FarmerLogin_Screens/TermandCondition.dart';
import 'package:language_page/Login_Signup_Screen/Login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyProfilePage(),
    );
  }
}

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final ImagePicker imagePicker = ImagePicker();
  XFile? photo;

  Future<void> pickImage() async {
    photo = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: 900,
        width: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 0,
            ),
            Container(
              height: 200,
              width: 300,
              decoration: const BoxDecoration(color: Colors.grey),
              child: const Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/MyPhotoValid.jpg"),
                    radius: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sumit Katkar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.green))),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DeliveryPersonProfile()));
                },
                child: const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.person_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Profile Details",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.green))),
              child: const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.inventory),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Your Products",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.green))),
              child: const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.account_balance),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Bank Details",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.green))),
              child: const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.settings),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FAQPage()));
              },
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2, color: Colors.green))),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.help_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "FAQs",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsandconditionsPage()));
              },
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2, color: Colors.green))),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.assignment),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Terms & Conditions",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green)),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false);
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 50,
            ),
            Text("Your Profile",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            SizedBox(
              width: 80,
            ),
            Icon(Icons.notifications_active)
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
          ),
          Positioned(
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: pickImage,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey[50],
                      radius: 50,
                      backgroundImage:
                          photo != null ? FileImage(File(photo!.path)) : null,
                      child: photo == null
                          ? const Icon(
                              Icons.camera_alt,
                              color: Colors.grey,
                              size: 30,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Sumit Katkar",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Column(
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "Your Orders",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            Text(
                              "+10 since last week",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 20),
                            CustomProgressIndicator(
                              pending: 10, // Pending orders
                              inProgress: 5, // In-progress orders
                              dispatched: 50, // Dispatched orders
                              delivered: 10, // Delivered orders
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Colors.red,
                                      ),
                                      SizedBox(width: 5),
                                      Text("Pending")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Colors.green,
                                      ),
                                      SizedBox(width: 5),
                                      Text("InProgress")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(
                                  child: Row(
                                    children: [
                                      SizedBox(width: 38),
                                      CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Colors.blue,
                                      ),
                                      SizedBox(width: 5),
                                      Text("Dispatched")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      SizedBox(width: 58),
                                      CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Colors.yellow,
                                      ),
                                      SizedBox(width: 5),
                                      Text("Delivered")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomProgressIndicator extends StatelessWidget {
  final int pending;
  final int inProgress;
  final int dispatched;
  final int delivered;

  const CustomProgressIndicator({
    super.key,
    required this.pending,
    required this.inProgress,
    required this.dispatched,
    required this.delivered,
  });

  @override
  Widget build(BuildContext context) {
    final total = pending + inProgress + dispatched + delivered;

    final pendingPercent = (pending / total) * 100;
    final inProgressPercent = (inProgress / total) * 100;
    final dispatchedPercent = (dispatched / total) * 100;
    final deliveredPercent = (delivered / total) * 100;

    return SizedBox(
      height: 20,
      width: 200,
      child: Stack(
        children: [
          Container(
            width: 200,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Row(
            children: [
              Container(
                height: 20,
                width: pendingPercent,
                color: Colors.red,
              ),
              Container(
                height: 20,
                width: inProgressPercent,
                color: Colors.green,
              ),
              Container(
                height: 20,
                width: dispatchedPercent,
                color: Colors.blue,
              ),
              Container(
                height: 20,
                width: deliveredPercent,
                color: Colors.yellow,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
