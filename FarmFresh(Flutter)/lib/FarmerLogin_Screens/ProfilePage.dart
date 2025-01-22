import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:language_page/Customer_Login_Screens/Basket.dart';
import 'package:language_page/FarmerLogin_Screens/BankDetails.dart';
import 'package:language_page/FarmerLogin_Screens/FAQs.dart';
import 'package:language_page/FarmerLogin_Screens/ProfileDetail.dart';
import 'package:language_page/FarmerLogin_Screens/Setting.dart';
import 'package:language_page/FarmerLogin_Screens/TermandCondition.dart';
import 'package:language_page/FarmerLogin_Screens/YourProducts.dart';
import 'package:language_page/FarmerLogin_Screens/farmer_homepage.dart';
import 'package:language_page/FarmerLogin_Screens/uploadPage.dart';
import 'package:language_page/FarmerLogin_Screens/wallet_page.dart';
import 'package:language_page/Login_Signup_Screen/LoginPageDeliveryPerson.dart';
import 'package:language_page/Login_Signup_Screen/LoginPageFarmer.dart';
import 'package:language_page/Login_Signup_Screen/Login_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:language_page/Login_Signup_Screen/signup_Farmer.dart';
import 'package:language_page/Start_Screens/Sessiondata.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';

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

  void switchBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Colors.white,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    openBottomSheetForSwitchAccount(context);
                  },
                  child: Container(
                    height: 45,
                    width: 350,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.green,
                          Color.fromARGB(255, 232, 236, 233),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      border: Border.all(
                          color: const Color.fromARGB(255, 46, 139, 49),
                          width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                      // gradient: const LinearGradient(
                      //   colors: [
                      //     Color.fromARGB(255, 26, 77, 28),
                      //     Colors.white
                      //   ],
                      //   begin: Alignment.bottomLeft,
                      //   end: Alignment.topRight,
                      // )

                      //color: Colors.amber
                    ),
                    child: Center(
                      child: FutureBuilder<String>(
                        future: context
                            .read<LanguageProvider>()
                            .translateText("Add an Account"),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ?? "Add an Account",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          );
                        },
                      ),
                      // child: Text(
                      //   "Add an Account",
                      //   style: TextStyle(
                      //       fontSize: 20,
                      //       color: Color.fromARGB(255, 34, 123, 37),
                      //       fontWeight: FontWeight.bold),
                      // ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        });
  }
}

void openBottomSheetForSwitchAccount(context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.green[50],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title with enhanced styling
            Text(
              "Login",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
                letterSpacing: 0.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Subtle Divider for better separation
            const Divider(
              height: 2,
              thickness: 2,
              color: Color.fromARGB(255, 35, 59, 36),
            ),
            const SizedBox(height: 10),

            // Improved login sections with background, padding, and shadow
            Column(
              children: [
                Container(
                  height: 110,
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<String>(
                          future: context
                              .read<LanguageProvider>()
                              .translateText("Shop Fresh Produce"),
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.data ?? "Shop Fresh Produce",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green),
                            );
                          },
                        ),
                        // const Text(
                        //   "Shop Fresh Produce",
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.w600,
                        //     color: Colors.green,
                        //   ),
                        // ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                                (route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size.fromHeight(40),
                          ),
                          child: FutureBuilder<String>(
                            future: context
                                .read<LanguageProvider>()
                                .translateText("Login as a Customer"),
                            builder: (context, snapshot) {
                              return Text(
                                snapshot.data ?? "Login as a Customer",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              );
                            },
                          ),
                          // child: const Text(
                          //   "Login as a Customer",
                          //   style: TextStyle(
                          //     fontSize: 15,
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              height: 110,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<String>(
                      future: context
                          .read<LanguageProvider>()
                          .translateText("Sell fresh Produce"),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "Sell Fresh Produce",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.green),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPageFarmer()),
                            (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size.fromHeight(40),
                      ),
                      child: FutureBuilder<String>(
                        future: context
                            .read<LanguageProvider>()
                            .translateText("Login as a Farmer"),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ?? "Login as a Farmer",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 111,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<String>(
                      future: context
                          .read<LanguageProvider>()
                          .translateText("Deliver Fresh Produce"),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "Deliver Fresh Produce",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.green),
                        );
                      },
                    ),
                    // const Text(
                    //   "Deliver Fresh Produce",
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.w600,
                    //     color: Colors.green,
                    //   ),
                    // ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LoginPageDeliveryPerson(),
                            ),
                            (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size.fromHeight(40),
                      ),
                      child: FutureBuilder<String>(
                        future: context
                            .read<LanguageProvider>()
                            .translateText("Login as a Delivery Person"),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ?? "Login as a Delivery Person",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class _MyProfilePageState extends State<MyProfilePage> {
  final ImagePicker imagePicker = ImagePicker();
  XFile? farmerphoto;

  @override
  void initState() {
    pendingOrders.length;
    dispatchedOrders.length;
    super.initState();

    Future.delayed(Duration.zero, () async {
      setState(() {});
    });
  }

  // Future<void> pickImage() async {
  //   farmerphoto = await imagePicker.pickImage(source: ImageSource.gallery);
  //   setState(() {});
  // }

  Future<void> uploadImagefarmer({required String fileName}) async {
    print("Add Image to Firebase");
    await FirebaseStorage.instance
        .ref()
        .child(fileName)
        .putFile(File(farmerphoto!.path));
  }

  Future<String> downloadImageURLfarmer({required String fileName}) async {
    print("Get URL to Firebase");
    String farmerurl =
        await FirebaseStorage.instance.ref().child(fileName).getDownloadURL();
    finalurl = farmerurl;
    return farmerurl;
  }

  // void switchBottomSheet() async{
  //   await showModalBottomSheet(
  //       context: context,
  //       isScrollControlled: true,
  //       showDragHandle: true,
  //       builder: (context) {
  //         return Padding(
  //           padding: EdgeInsets.only(
  //               top: 10,
  //               right: 10,
  //               left: 10,
  //               bottom: MediaQuery.of(context).viewInsets.bottom),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               GestureDetector(
  //                 onTap: () {
  //                   Navigator.of(context).pop();
  //                   openBottomSheetForSwitchAccount();
  //                 },
  //                 child: Container(
  //                   height: 50,
  //                   width: 350,
  //                   decoration: BoxDecoration(
  //                     border: const Border(
  //                       bottom: BorderSide(width: 1, color: Colors.green),
  //                       left: BorderSide(width: 1, color: Colors.green),
  //                       right: BorderSide(width: 1, color: Colors.green),
  //                       top: BorderSide(width: 1, color: Colors.green),
  //                     ),
  //                     borderRadius: BorderRadius.circular(10),

  //                     //color: Colors.amber
  //                   ),
  //                   child: const Center(
  //                     child: const Text(
  //                       "Add an Account",
  //                       style: TextStyle(fontSize: 20, color: Colors.black),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 30,
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }

  // void openBottomSheetForSwitchAccount() {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.green[50],
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     builder: (context) {
  //       return SingleChildScrollView(
  //         child: Padding(
  //           padding: const EdgeInsets.all(20),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.max,
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: [
  //               // Title with enhanced styling
  //               const Text(
  //                 "Login",
  //                 style: TextStyle(
  //                   fontSize: 28,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.green,
  //                   letterSpacing: 0.0,
  //                 ),
  //                 textAlign: TextAlign.center,
  //               ),
  //               const SizedBox(height: 10),
  //               // Subtle Divider for better separation
  //               Container(
  //                 height: 2,
  //                 color: const Color.fromARGB(255, 35, 59, 36),
  //                 margin: const EdgeInsets.symmetric(vertical: 10),
  //               ),
  //               const SizedBox(height: 10),

  //               // Improved login sections with background, padding, and shadow
  //               Container(
  //                 padding: const EdgeInsets.symmetric(horizontal: 20),
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(15),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.black.withOpacity(0.1),
  //                       spreadRadius: 2,
  //                       blurRadius: 8,
  //                       offset: const Offset(0, 2),
  //                     ),
  //                   ],
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(15),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       const Text(
  //                         "Shop Fresh Produce",
  //                         style: TextStyle(
  //                           fontSize: 18,
  //                           fontWeight: FontWeight.w600,
  //                           color: Colors.green,
  //                         ),
  //                       ),
  //                       const SizedBox(height: 10),
  //                       ElevatedButton(
  //                         onPressed: () {
  //                           Navigator.of(context).pop();
  //                           Navigator.pushAndRemoveUntil(
  //                               context,
  //                               MaterialPageRoute(
  //                                   builder: (context) => const LoginPage()),
  //                               (route) => false);
  //                         },
  //                         style: ElevatedButton.styleFrom(
  //                           backgroundColor: Colors.green,
  //                           padding: const EdgeInsets.symmetric(vertical: 15),
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(10),
  //                           ),
  //                           minimumSize: const Size.fromHeight(50),
  //                         ),
  //                         child: const Text(
  //                           "Login as a Customer",
  //                           style: TextStyle(
  //                             fontSize: 16,
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(height: 20),
  //               Container(
  //                 padding: const EdgeInsets.symmetric(horizontal: 20),
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(15),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.black.withOpacity(0.1),
  //                       spreadRadius: 2,
  //                       blurRadius: 8,
  //                       offset: const Offset(0, 2),
  //                     ),
  //                   ],
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(15),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       const Text(
  //                         "Sell Fresh Produce",
  //                         style: TextStyle(
  //                           fontSize: 18,
  //                           fontWeight: FontWeight.w600,
  //                           color: Colors.green,
  //                         ),
  //                       ),
  //                       const SizedBox(height: 10),
  //                       ElevatedButton(
  //                         onPressed: () {
  //                           Navigator.of(context).pop();
  //                           Navigator.pushAndRemoveUntil(
  //                               context,
  //                               MaterialPageRoute(
  //                                   builder: (context) =>
  //                                       const LoginPageFarmer()),
  //                               (route) => false);
  //                         },
  //                         style: ElevatedButton.styleFrom(
  //                           backgroundColor: Colors.green,
  //                           padding: const EdgeInsets.symmetric(vertical: 15),
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(10),
  //                           ),
  //                           minimumSize: const Size.fromHeight(50),
  //                         ),
  //                         child: const Text(
  //                           "Login as a Farmer/Seller",
  //                           style: const TextStyle(
  //                             fontSize: 16,
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(height: 20),
  //               Container(
  //                 padding: const EdgeInsets.symmetric(horizontal: 20),
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(15),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.black.withOpacity(0.1),
  //                       spreadRadius: 2,
  //                       blurRadius: 8,
  //                       offset: const Offset(0, 2),
  //                     ),
  //                   ],
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(15),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       const Text(
  //                         "Deliver Fresh Produce",
  //                         style: TextStyle(
  //                           fontSize: 18,
  //                           fontWeight: FontWeight.w600,
  //                           color: Colors.green,
  //                         ),
  //                       ),
  //                       const SizedBox(height: 10),
  //                       ElevatedButton(
  //                         onPressed: () {
  //                           Navigator.of(context).pop();
  //                           Navigator.pushAndRemoveUntil(
  //                               context,
  //                               MaterialPageRoute(
  //                                   builder: (context) =>
  //                                       const LoginPageDeliveryPerson()),
  //                               (route) => false);
  //                         },
  //                         style: ElevatedButton.styleFrom(
  //                           backgroundColor: Colors.green,
  //                           padding: const EdgeInsets.symmetric(vertical: 15),
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(10),
  //                           ),
  //                           minimumSize: const Size.fromHeight(50),
  //                         ),
  //                         child: const Text(
  //                           "Login as Delivery Person",
  //                           style: const TextStyle(
  //                             fontSize: 16,
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(height: 30),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // Example data for orders' status
    //const double pendingOrders = 40;
    const double dispatched = 30;
    const double inProgress = 15;
    const double delivered = 2;

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
              height: 170,
              width: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/MyPhotoValid.jpg"),
                    radius: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  /////////////////////////////////////////////////
                  Text(
                    "${signupFarmer[0].FullName}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ///////////////////////////////////////////////////////
                ],
              ),
            ),
            const SizedBox(
              height: 10,
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
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.person_outlined),
                    const SizedBox(
                      width: 5,
                    ),
                    FutureBuilder<String>(
                      future: context
                          .read<LanguageProvider>()
                          .translateText("Profile Details"),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "Profile Details",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Wallet_Page()));
              },
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2, color: Colors.green))),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.wallet),
                    const SizedBox(
                      width: 5,
                    ),
                    FutureBuilder<String>(
                      future: context
                          .read<LanguageProvider>()
                          .translateText("Wallet"),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "Wallet",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YourProductAmount()));
              },
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2, color: Colors.green))),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.inventory),
                    const SizedBox(
                      width: 5,
                    ),
                    FutureBuilder<String>(
                      future: context
                          .read<LanguageProvider>()
                          .translateText("Your Products"),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "Your Products",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BankDetailsScreen()));
              },
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2, color: Colors.green))),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.account_balance),
                    const SizedBox(
                      width: 5,
                    ),
                    FutureBuilder<String>(
                      future: context
                          .read<LanguageProvider>()
                          .translateText("Bank Details"),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "Bank Details",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2, color: Colors.green))),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.settings),
                    const SizedBox(
                      width: 5,
                    ),
                    FutureBuilder<String>(
                      future: context
                          .read<LanguageProvider>()
                          .translateText("Setting"),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "Setting",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.help_outlined),
                    const SizedBox(
                      width: 5,
                    ),
                    FutureBuilder<String>(
                      future: context
                          .read<LanguageProvider>()
                          .translateText("FAQs"),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "FAQs",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.assignment),
                    const SizedBox(
                      width: 5,
                    ),
                    FutureBuilder<String>(
                      future: context
                          .read<LanguageProvider>()
                          .translateText("Terms and Conditions"),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "Terms and conditions",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        );
                      },
                    ),
                    // Text(
                    //   "Terms & Conditions",
                    //   style: TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.black),
                    // ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            /*const SizedBox(height: 10),
              _buildDrawerOption(
                context,
                icon: Icons.settings,
                label: "Setting",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                },
              ),
              const SizedBox(height: 40),*/
            const SizedBox(height: 8),

            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.green)),
              onPressed: () {
                Sessiondata.islogin == false;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPageFarmer()),
                    (route) => false);
              },
              child: FutureBuilder<String>(
                future:
                    context.read<LanguageProvider>().translateText("LogOut"),
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data ?? "LogOut",
                    style: const TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
            // ElevatedButton(
            //   style: const ButtonStyle(
            //       backgroundColor: WidgetStatePropertyAll(Colors.blue)),
            //   onPressed: () {
            //     const MyProfilePage().switchBottomSheet(context);
            //   },
            //   child: const Text(
            //     "Switch Account",
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
            const SizedBox(height: 10),

            Center(
              child: GestureDetector(
                onTap: () {
                  const MyProfilePage().switchBottomSheet(context);
                },
                child: Container(
                  height: 35,
                  width: 140,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                  child: FutureBuilder<String>(
                    future: context
                        .read<LanguageProvider>()
                        .translateText("Switch Account"),
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data ?? "Switch Account",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(
              width: 00,
            ),
            const SizedBox(
              width: 00,
            ),
            FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Profile"),
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? "Profile",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 23, 97, 25),
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                );
              },
            ),
            // Text("Profile",
            //     style: TextStyle(
            //         color: Color.fromARGB(255, 23, 97, 25),
            //         fontWeight: FontWeight.bold,
            //         fontSize: 23)),
            const SizedBox(
              width: 80,
            ),
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
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: Colors.blueGrey[50],
                          radius: 50,
                          backgroundImage: farmerphoto != null
                              ? const AssetImage("assets/MyPhotoValid.jpg")
                              : null,
                          child: farmerphoto == null
                              ? const Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                  size: 65,
                                )
                              : null,
                        ),
                      ),
                      Positioned(
                        right: 4,
                        bottom: 4,
                        child: GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.blue,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<String>(
                    future: context
                        .read<LanguageProvider>()
                        .translateText(signupFarmer[0].FullName),
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data ?? signupFarmer[0].FullName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      );
                    },
                  ),
                  // Text(
                  //   signupFarmer[0].FullName,
                  //   style: const TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: FutureBuilder<String>(
                      future: context
                          .read<LanguageProvider>()
                          .translateText("Orders Statistics"),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "Orders Statistics",
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        );
                      },
                    ),
                    // child: Text(
                    //   'Orders Statistics',
                    //   style: TextStyle(
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.green),
                    // ),
                  ),
                  Center(
                    child: FutureBuilder<String>(
                      future: context
                          .read<LanguageProvider>()
                          .translateText("+10 since last week"),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "+10 since last week",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        );
                      },
                    ),
                    // child: Text(
                    //   "+10 since last week",
                    //   style: TextStyle(
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.grey),
                    // ),
                  ),
                  //const SizedBox(height: 10),
                  // PieChart container with a fixed height
                  SizedBox(
                    height: 280, // Set a fixed height for the PieChart
                    child: PieChart(
                      PieChartData(
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 0,
                        centerSpaceRadius: 30,
                        sections: [
                          PieChartSectionData(
                            color: Colors.red,
                            value: inProgress,
                            title: '${inProgress}%',
                            radius: 80,
                            titleStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          PieChartSectionData(
                            color: Colors.blue,
                            value: dispatched,
                            title: '${dispatched}%',
                            radius: 80,
                            titleStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          // PieChartSectionData(
                          //   color: Colors.green,
                          //   value: inProgress,
                          //   title: '$inProgress%',
                          //   radius: 80,
                          //   titleStyle: const TextStyle(
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          // PieChartSectionData(
                          //   color: Colors.yellow,
                          //   value: delivered,
                          //   title: '$delivered%',
                          //   radius: 80,
                          //   titleStyle: const TextStyle(
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.white,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.red,
                            ),
                            const SizedBox(width: 5),
                            FutureBuilder<String>(
                              future: context
                                  .read<LanguageProvider>()
                                  .translateText("Pending"),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.data ?? "Pending",
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.blue,
                            ),
                            const SizedBox(width: 5),
                            FutureBuilder<String>(
                              future: context
                                  .read<LanguageProvider>()
                                  .translateText("Dispatched"),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.data ?? "Dispatched",
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       child: Row(
                  //         children: [
                  //           const SizedBox(width: 37),
                  //           const CircleAvatar(
                  //             radius: 5,
                  //             backgroundColor: Colors.blue,
                  //           ),
                  //           const SizedBox(width: 5),
                  //           FutureBuilder<String>(
                  //             future: context
                  //                 .read<LanguageProvider>()
                  //                 .translateText("Dispatched"),
                  //             builder: (context, snapshot) {
                  //               return Text(
                  //                 snapshot.data ?? "Dispatched",
                  //               );
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       child: Row(
                  //         children: [
                  //           const SizedBox(width: 52),
                  //           const CircleAvatar(
                  //             radius: 5,
                  //             backgroundColor: Colors.yellow,
                  //           ),
                  //           const SizedBox(width: 5),
                  //           FutureBuilder<String>(
                  //             future: context
                  //                 .read<LanguageProvider>()
                  //                 .translateText("Delivered"),
                  //             builder: (context, snapshot) {
                  //               return Text(
                  //                 snapshot.data ?? "Delivered",
                  //               );
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
