// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:language_page/Customer_Login_Screens/BuyNow.dart';
// import 'package:language_page/DeliveryLogin_Screens/DeliveryPersonProfile.dart';

// import 'package:language_page/DeliveryLogin_Screens/Notification.dart';
// import 'package:language_page/DeliveryLogin_Screens/OrderDescription.dart';
// import 'package:language_page/DeliveryLogin_Screens/OrderModel.dart';
// import 'package:language_page/DeliveryLogin_Screens/Profile_Details.dart';
// import 'package:language_page/DeliveryLogin_Screens/Ratings.dart';
// import 'package:language_page/DeliveryLogin_Screens/Wallet_deliveryperson.dart';
// import 'package:language_page/FarmerLogin_Screens/farmer_homepage.dart';
// import 'package:language_page/Login_Signup_Screen/LoginPageDeliveryPerson.dart';
// import 'package:url_launcher/url_launcher.dart';

// List<OrdersModel> orderDetails = [];

// class DeliveryPerson_HomePage extends StatefulWidget {
//   const DeliveryPerson_HomePage({super.key});
//   @override
//   State createState() => DeliveryPerson_HomePage_State();
// }

// class CallScreen {
//   final String phoneNumber = "+919322762831";

//   Future<void> makeCall(String number) async {
//     try {
//       final Uri phoneUri = Uri.parse("tel://$number");

//       // Check if the URL can be launched

//       await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
//     } catch (e) {
//       _showError("An unexpected error occurred: $e");
//     }
//   }

//   void _showError(String message) {
//     debugPrint(message); // Log the error
//   }
// }

// class DeliveryPerson_HomePage_State extends State {
//   final RatingPage rating = const RatingPage();
//   final DeliveryPersonProfile profile = const DeliveryPersonProfile();
//   final WalletPageDeliveryPerson wallet = const WalletPageDeliveryPerson();
//   final OrderdescriptionPage orderDescription = const OrderdescriptionPage();

//   bool flag = true;
//   CallScreen calling = CallScreen();
//   //int index = 1;
//   @override
//   void initState() {
//     super.initState();

//     loaddataforDeliveryPerson();
//   }

//   void loaddataforDeliveryPerson() async {
//     await check(mail);
//     await getDPOrdersdata();

//     setState(() {});
//   }

//   String phoneNumber = "+8010367093";

//   CallPage(phoneNumber) {
//     log("Got a Call");
//     _makePhoneCall(phoneNumber);
//   }

//   void _makePhoneCall(String phoneNumber) async {
//     //final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
//     final Uri callUri = Uri.parse('tel:$phoneNumber');

//     if (await canLaunchUrl(callUri)) {
//       await launchUrl(callUri);
//     } else {
//       throw 'Could not launch $callUri';
//     }
//   }

//   Widget homePage(int count) {
//     if (count == 1) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           height: 210,
//           width: double.infinity,
//           padding: const EdgeInsets.only(top: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: Colors.green, width: 2),
//             color: Colors.white,
//           ),
//           child: Center(
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     const SizedBox(width: 10),
//                     Container(
//                       height: 120,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: CircleAvatar(
//                         backgroundImage:
//                             NetworkImage(orderDetails[index].profileimage),
//                         radius: 60,
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             orderDetails[index].name,
//                             style: const TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             orderDetails[index].address,
//                             maxLines: 2,
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Row(
//                             children: [
//                               const Text(
//                                 "Date: ",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w300,
//                                 ),
//                               ),
//                               Text(
//                                 orderDetails[index]
//                                     .date
//                                     .toString()
//                                     .split(' ')[0],
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               const Text(
//                                 "OrderNo: ",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w300,
//                                 ),
//                               ),
//                               Text(
//                                 orderDetails[index].order,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           // Text(
//                           //   orderDetails[index].,
//                           //   style: const TextStyle(
//                           //     fontSize: 14,
//                           //     fontWeight: FontWeight.w500,
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ),
//                     // GestureDetector(
//                     //   onTap: () {
//                     //     CallPage(phoneNumber);
//                     //   },
//                     //   child: Container(
//                     //     height: 50,
//                     //     width: 50,
//                     //     decoration: const BoxDecoration(
//                     //       shape: BoxShape.circle,
//                     //       color: Colors.green,
//                     //     ),
//                     //     child: const Icon(Icons.call, color: Colors.white),
//                     //   ),
//                     // ),
//                     GestureDetector(
//                       onTap: () {
//                         calling.makeCall("+919322762831");

//                         setState(() {});
//                       },
//                       child: Container(
//                         height: 50,
//                         width: 50,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.green,
//                         ),
//                         child: const Icon(Icons.call, color: Colors.white),
//                       ),
//                     ),
//                     const SizedBox(width: 15),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 3,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         orders.add(orderDetails[index]);
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => orderDescription),
//                         );
//                       },
//                       child: Container(
//                         height: 35,
//                         width: 80,
//                         padding: const EdgeInsets.all(4),
//                         decoration: BoxDecoration(
//                             color: Colors.green,
//                             borderRadius: BorderRadius.circular(15)),
//                         child: const Text(
//                           "Accept",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         orderDetails.remove(orderDetails[index]);
//                         setState(() {});
//                       },
//                       child: Container(
//                         height: 35,
//                         width: 80,
//                         padding: const EdgeInsets.all(4.8),
//                         decoration: BoxDecoration(
//                             color: Colors.red[400],
//                             borderRadius: BorderRadius.circular(15)),
//                         child: const Text(
//                           "Reject",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
//     } else if (count == 2) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
//         child: GestureDetector(
//           onTap: () {
//             print("past");
//           },
//           child: Container(
//             height: 150,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Colors.green, width: 2),
//               color: Colors.white,
//             ),
//             child: Center(
//               child: Row(
//                 children: [
//                   const SizedBox(width: 10),
//                   Container(
//                     height: 120,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: CircleAvatar(
//                       backgroundImage: NetworkImage(
//                         orderDetails[index].profileimage,
//                       ),
//                       radius: 50,
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           orderDetails[index].name,
//                           style: const TextStyle(
//                             fontSize: 17,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           orderDetails[index].address,
//                           maxLines: 2,
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             const Text(
//                               "Date: ",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                             Text(
//                               DateTime.now().toString().split(' ')[0],
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             const Text(
//                               "OrderNo: ",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                             Text(
//                               orderDetails[index].order,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         // Text(
//                         //   orderDetails[index],
//                         //   style: const TextStyle(
//                         //     fontSize: 14,
//                         //     fontWeight: FontWeight.w500,
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     } else {
//       return Text("past");
//     }
//   }

//   int _selectedIndex = 0;
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(100.0),
//           child: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//               ),
//               borderRadius: const BorderRadius.vertical(
//                 bottom: Radius.circular(10),
//               ),
//             ),
//             child: AppBar(
//               backgroundColor: Colors.transparent, // Make AppBar transparent
//               elevation: 0,
//               title: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(children: [
//                     const SizedBox(
//                       width: 110,
//                     ),
//                     Text(
//                       "My Orders",
//                       style: GoogleFonts.inter(
//                         fontSize: 22,
//                         fontWeight: FontWeight.w700,
//                         color: const Color.fromARGB(255, 26, 77, 28),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 75,
//                     ),
//                     // const Spacer(),
//                     // const Icon(Icons.notifications_outlined)

//                     // Notification icon with subtle animation effect
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context)
//                             .push(MaterialPageRoute(builder: (context) {
//                           return const NotificationPage();
//                         }));
//                       },
//                       child: Stack(
//                         alignment: Alignment.topRight,
//                         children: [
//                           const Icon(
//                             Icons.notifications_outlined,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                           Positioned(
//                             right: 4,
//                             top: 4,
//                             child: Container(
//                               width: 10,
//                               height: 10,
//                               decoration: const BoxDecoration(
//                                 color: Colors.red,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ]),
//                 ],
//               ),
//               centerTitle: true,
//               bottom: TabBar(
//                 indicatorColor: const Color.fromARGB(255, 26, 77, 28),
//                 unselectedLabelColor: Colors.white60,
//                 labelColor: const Color.fromARGB(255, 26, 77, 28),
//                 tabs: [
//                   Tab(
//                     child: Text(
//                       "Active orders",
//                       style: GoogleFonts.inter(
//                           fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Tab(
//                     child: Text(
//                       "Past orders",
//                       style: GoogleFonts.inter(
//                           fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             ListView.builder(
//               itemCount: orderDetails.length,
//               itemBuilder: (context, index) {
//                 return homePage(1);
//               },
//             ),
//             ListView.builder(
//               itemCount: orderDetails.length,
//               itemBuilder: (context, index) {
//                 return homePage(2);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_page/Customer_Login_Screens/BuyNow.dart';
import 'package:language_page/DeliveryLogin_Screens/Notification.dart';
import 'package:language_page/DeliveryLogin_Screens/OrderDescription.dart';
import 'package:language_page/DeliveryLogin_Screens/OrderModel.dart';
import 'package:language_page/DeliveryLogin_Screens/Profile_Details.dart';
import 'package:language_page/DeliveryLogin_Screens/otpScren.dart';
import 'package:language_page/FarmerLogin_Screens/farmer_homepage.dart';
import 'package:language_page/Login_Signup_Screen/LoginPageDeliveryPerson.dart';
import 'package:url_launcher/url_launcher.dart';

List<OrdersModel> orderDetails = [];
List<OrdersModel> pastOrders = [];

class CallScreen {
  final String phoneNumber = "+919322762831";

  Future<void> makeCall(String number) async {
    try {
      final Uri phoneUri = Uri.parse("tel://$number");

      // Check if the URL can be launched

      await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      _showError("An unexpected error occurred: $e");
    }
  }

  void _showError(String message) {
    debugPrint(message); // Log the error
  }
}

class DeliveryPerson_HomePage extends StatefulWidget {
  @override
  DeliveryPerson_HomePage_State createState() =>
      DeliveryPerson_HomePage_State();
}

class DeliveryPerson_HomePage_State extends State<DeliveryPerson_HomePage> {
  void acceptOrder(int index) {
    setState(() {
      pastOrders.add(orderDetails[index]);
      orderDetails.removeAt(index);
    });
  }

  void rejectOrder(int index) {
    setState(() {
      orderDetails.removeAt(index);
    });
  }

  bool flag = true;
  CallScreen calling = CallScreen();
  //int index = 1;
  @override
  void initState() {
    super.initState();

    loaddataforDeliveryPerson();
  }

  void loaddataforDeliveryPerson() async {
    await check(mail);
    await getDPOrdersdata();

    setState(() {});
  }

  // String phoneNumber = "+8010367093";

  CallPage(phoneNumber) {
    log("Got a Call");
    _makePhoneCall(phoneNumber);
  }

  void _makePhoneCall(String phoneNumber) async {
    //final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    final Uri callUri = Uri.parse('tel:$phoneNumber');

    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw 'Could not launch $callUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent, // Make AppBar transparent
              elevation: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const SizedBox(
                      width: 110,
                    ),
                    Text(
                      "My Orders",
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 26, 77, 28),
                      ),
                    ),
                    const SizedBox(
                      width: 75,
                    ),
                    // const Spacer(),
                    // const Icon(Icons.notifications_outlined)

                    // Notification icon with subtle animation effect
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return NotificationPage();
                        }));
                      },
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          const Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          Positioned(
                            right: 4,
                            top: 4,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
              centerTitle: true,
              bottom: TabBar(
                indicatorColor: const Color.fromARGB(255, 26, 77, 28),
                unselectedLabelColor: Colors.white60,
                labelColor: const Color.fromARGB(255, 26, 77, 28),
                tabs: [
                  Tab(
                    child: Text(
                      "Active orders",
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Past orders",
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // Active Orders Tab
            ListView.builder(
              itemCount: orderDetails.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onlyIndex = index;
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => OtpScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 210,
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green, width: 2),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                Container(
                                  height: 120,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        orderDetails[index].profileimage),
                                    radius: 60,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        orderDetails[index].name,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        orderDetails[index].address,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Text(
                                            "Date: ",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Text(
                                            orderDetails[index]
                                                .date
                                                .toString()
                                                .split(' ')[0],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "OrderNo: ",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Text(
                                            orderDetails[index].order,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    calling.makeCall("+919322762831");

                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                    child: const Icon(Icons.call,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 15),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    acceptOrder(index);
                                    // log("${orderDetails[index].docId}");
                                    await FirebaseFirestore.instance
                                        .collection('CollectionForDP')
                                        .doc('sangu@gmail.com')
                                        .collection('deliveryOrders')
                                        .doc(orderDetails[index].docId)
                                        .delete();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  child: const Text(
                                    'Done',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () async {
                                    rejectOrder(index);
                                    await FirebaseFirestore.instance
                                        .collection('CollectionForDP')
                                        .doc('sangu@gmail.com')
                                        .collection('deliveryOrders')
                                        .doc(orderDetails[index].docId)
                                        .delete();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: const Text(
                                    'Reject',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            // Past Orders Tab
            ListView.builder(
              itemCount: pastOrders.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 210,
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green, width: 2),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              Container(
                                height: 120,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    pastOrders[index].profileimage,
                                  ),
                                  radius: 60,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      pastOrders[index].name,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      pastOrders[index].address,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const Text(
                                          "Date: ",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          pastOrders[index]
                                              .date
                                              .toString()
                                              .split(' ')[0],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "OrderNo: ",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          pastOrders[index].order,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class DeliveryPerson_HomePage extends StatefulWidget {
//   @override
//   DeliveryPerson_HomePage_State createState() =>
//       DeliveryPerson_HomePage_State();
// }

// class DeliveryPerson_HomePage_State extends State<DeliveryPerson_HomePage> {
//   List<Order> orderDetails = []; // List of active orders
//   List<Order> pastOrders = [];   // List of past orders

//   @override
//   void initState() {
//     super.initState();
//     loaddataforDeliveryPerson();
//   }

//   // Mock Data - This will be replaced by actual data loading
//   void loaddataforDeliveryPerson() async {
//     setState(() {
//       orderDetails = [
//         Order(
//           name: "John Doe",
//           address: "1234 Elm Street",
//           order: "ORD001",
//           profileimage: "https://example.com/image.jpg",
//           date: DateTime.now(),
//         ),
//         Order(
//           name: "Jane Smith",
//           address: "5678 Oak Avenue",
//           order: "ORD002",
//           profileimage: "https://example.com/image2.jpg",
//           date: DateTime.now().subtract(Duration(days: 1)),
//         ),
//       ];
//     });
//   }

//   // Accept Order Logic
//   void acceptOrder(int index) {
//     setState(() {
//       pastOrders.add(orderDetails[index]);
//       orderDetails.removeAt(index);
//     });
//   }

//   // Reject Order Logic
//   void rejectOrder(int index) {
//     setState(() {
//       orderDetails.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Orders'),
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: 'Active Orders'),
//               Tab(text: 'Past Orders'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             // Active Orders Tab
//             ListView.builder(
//               itemCount: orderDetails.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) =>
//                           OrderdescriptionPage(order: orderDetails[index]),
//                     ));
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: 210,
//                       width: double.infinity,
//                       padding: const EdgeInsets.only(top: 10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: Colors.green, width: 2),
//                         color: Colors.white,
//                       ),
//                       child: Center(
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 const SizedBox(width: 10),
//                                 Container(
//                                   height: 120,
//                                   width: 100,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   child: CircleAvatar(
//                                     backgroundImage:
//                                         NetworkImage(orderDetails[index].profileimage),
//                                     radius: 60,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 20),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         orderDetails[index].name,
//                                         style: const TextStyle(
//                                           fontSize: 17,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       Text(
//                                         orderDetails[index].address,
//                                         maxLines: 2,
//                                         style: const TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 10),
//                                       Row(
//                                         children: [
//                                           const Text(
//                                             "Date: ",
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w300,
//                                             ),
//                                           ),
//                                           Text(
//                                             orderDetails[index].date.toString().split(' ')[0],
//                                             style: const TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           const Text(
//                                             "OrderNo: ",
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w300,
//                                             ),
//                                           ),
//                                           Text(
//                                             orderDetails[index].order,
//                                             style: const TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 10),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 3,
//                             ),
//                             Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: () => acceptOrder(index),
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.green,
//                                   ),
//                                   child: Text('Accept'),
//                                 ),
//                                 SizedBox(width: 8),
//                                 ElevatedButton(
//                                   onPressed: () => rejectOrder(index),
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.red,
//                                   ),
//                                   child: Text('Reject'),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             // Past Orders Tab
//             ListView.builder(
//               itemCount: pastOrders.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 210,
//                     width: double.infinity,
//                     padding: const EdgeInsets.only(top: 10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: Colors.green, width: 2),
//                       color: Colors.white,
//                     ),
//                     child: Center(
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               const SizedBox(width: 10),
//                               Container(
//                                 height: 120,
//                                 width: 100,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 child: CircleAvatar(
//                                   backgroundImage:
//                                       NetworkImage(pastOrders[index].profileimage),
//                                   radius: 60,
//                                 ),
//                               ),
//                               const SizedBox(width: 20),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       pastOrders[index].name,
//                                       style: const TextStyle(
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       pastOrders[index].address,
//                                       maxLines: 2,
//                                       style: const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 10),
//                                     Row(
//                                       children: [
//                                         const Text(
//                                           "Date: ",
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w300,
//                                           ),
//                                         ),
//                                         Text(
//                                           pastOrders[index].date.toString().split(' ')[0],
//                                           style: const TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         const Text(
//                                           "OrderNo: ",
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w300,
//                                           ),
//                                         ),
//                                         Text(
//                                           pastOrders[index].order,
//                                           style: const TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 10),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

