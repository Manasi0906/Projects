import "dart:developer";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:language_page/Customer_Login_Screens/BuyNow.dart";
import "package:language_page/Customer_Login_Screens/Product_individual.dart";
import "package:language_page/Customer_Login_Screens/apple.dart";
import "package:language_page/DeliveryLogin_Screens/Notification.dart";
import "package:language_page/DeliveryLogin_Screens/OrderModel.dart";
import "package:language_page/DeliveryLogin_Screens/orders.dart";
import "package:language_page/FarmerLogin_Screens/NotificationFarmer.dart";
import "package:language_page/FarmerLogin_Screens/NotificationModel.dart";
import "package:language_page/FarmerLogin_Screens/uploadPage.dart";
import "package:language_page/Login_Signup_Screen/LoginPageDeliveryPerson.dart";
import "package:language_page/Login_Signup_Screen/LoginPageFarmer.dart";
import "package:language_page/Login_Signup_Screen/signup_Customer.dart";
import "package:language_page/chatApplication/chatpage1.dart";
import "package:language_page/Customer_Login_Screens/Notification.dart";
import "package:language_page/chatApplication/loading.dart";
import "package:language_page/language_provider.dart";
import "package:provider/provider.dart";

String email = FirebaseAuth.instance.currentUser?.email ?? "defaultEmail";

Future<void> getDPOrdersdata() async {
  orderDetails.clear();
  try {
    log("");

    // Fetch data from Firebase Firestore
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection("CollectionForDP")
        .doc("sangu@gmail.com")
        .collection("deliveryOrders")
        .get();

    // log("Mail:$CustomerMail");
    log("got data: ${response.docs.length}");

    // Loop through the documents and add data to signupCustomer
    for (int i = 0; i < response.docs.length; i++) {
      orderDetails.add(OrdersModel(
        profileimage: response.docs[i]['proImage'],
        name: response.docs[i]['name'],
        address: response.docs[i]['address'],
        date: (response.docs[i]['date'] as Timestamp).toDate(),
        order: response.docs[i]['orderNo'].toString(),
        docId: response.docs[i].id,
        // qty: response.docs[i]['quantity'].toString(),
        // amount: response.docs[i]['amount'].toString(),
      ));
      log("Got Basket data");
    }

    // Access data from signupCustomer correctly
  } catch (e) {
    // Catch any error that occurs during the Firebase call or data processing
    log("Error fetching customer data: $e");
  }
}

Future<void> getFarmerNotifications() async {
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

Future<void> getDeliveryNotifications() async {
  deliveryNotifications.clear();
  try {
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection("NotificationDelivery")
        .doc("sham@gmail.com")
        .collection("DP")
        .get();
    for (int i = 0; i < response.docs.length; i++) {
      deliveryNotifications.add(
        NotificationModelDelivery(
            title: response.docs[i]['title'],
            message: response.docs[i]['Message'],
            isSeen: false),
      );
      log("Got notified to deliveryPerson");
    }
  } catch (e) {
    log("Error in FarmerNotification:$e");
  }
}

Future<void> getdispatchedList() async {
  dispatchedOrders.clear();
  try {
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection("DispatchedOrders")
        .doc("s@gmail.com")
        .collection("All")
        .get();
    for (int i = 0; i < response.docs.length; i++) {
      dispatchedOrders.add(FarmerModel(
        productImage: response.docs[i]['url'],
        name: response.docs[i]['name'],
        address: response.docs[i]['address'],
        datetime: (response.docs[i]['datetime'] as Timestamp).toDate(),
        orderNo: response.docs[i]['orderNo'].toString(),
        qty: response.docs[i]['quantity'].toString(),
        amount: response.docs[i]['amount'].toString(),
        docId: response.docs[i].id,
      ));
      log("got into dispatched");
    }
  } catch (e) {
    log("Error in dispatched Orders:$e");
  }
}

int justforfun = -1;
List<FarmerModel> pendingOrders = [];

List<FarmerModel> dispatchedOrders = [];

class FarmerModel {
  final String name, address, orderNo, qty, amount, productImage, docId;
  final DateTime datetime;

  FarmerModel({
    required this.name,
    required this.address,
    required this.datetime,
    required this.orderNo,
    required this.qty,
    required this.amount,
    required this.productImage,
    required this.docId,
  });
}

class FarmerHomePage extends StatefulWidget {
  const FarmerHomePage({super.key});

  @override
  State<FarmerHomePage> createState() => _FarmerHomePageState();
}

class _FarmerHomePageState extends State<FarmerHomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await getFarmerOrdersdata(mail);
    await getMyProducts("Apples");
    await getMyProductsCategory("Apples");
    await getdispatchedList();

    setState(() {
      // Trigger a rebuild with the fetched data
    });
  }

  bool boolfororders = true;

  Widget buildOrderCard(
      bool boolfororders, FarmerModel order, String status, int index) {
    if (boolfororders == true) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Container(
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 6, color: Colors.grey, offset: Offset(0, 3)),
            ],
          ),
          child: Row(
            children: [
              // Image Section
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(pendingOrders[index].productImage
                      // fit: BoxFit.cover,
                      ),
                ),
              ),

              // Details Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Order Details
                      FutureBuilder<String>(
                        future: context.read<LanguageProvider>().translateText(
                            "Order No: ${pendingOrders[index].orderNo}"),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ??
                                "Order No: ${pendingOrders[index].orderNo}",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          );
                        },
                      ),
                      // Text(
                      //   "Order No: ${pendingOrders[index].orderNo}",
                      //   style: GoogleFonts.inter(
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.w600,
                      //     color: Colors.black87,
                      //   ),
                      // ),
                      const SizedBox(height: 5),
                      FutureBuilder<String>(
                        future: context.read<LanguageProvider>().translateText(
                            "Customer Name: ${pendingOrders[index].name}"),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ?? " ${pendingOrders[index].name}",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          );
                        },
                      ),
                      // Text(
                      //   "Name: ${pendingOrders[index].name}",
                      //   style: GoogleFonts.inter(
                      //     fontSize: 13,
                      //     color: Colors.black54,
                      //   ),
                      // ),

                      const SizedBox(height: 5),
                      FutureBuilder<String>(
                        future: context.read<LanguageProvider>().translateText(
                            "Qty: ${pendingOrders[index].qty} | Amount: ${pendingOrders[index].amount}"),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ??
                                "Qty: ${pendingOrders[index].qty} | Amount: ${pendingOrders[index].amount}",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              // color: Colors.black54,
                            ),
                          );
                        },
                      ),
                      // Text(
                      //   "Qty: ${pendingOrders[index].qty} | Amount: ${pendingOrders[index].amount}",
                      //   style: GoogleFonts.inter(
                      //     fontSize: 13,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      const SizedBox(height: 5),
                      FutureBuilder<String>(
                        future: context
                            .read<LanguageProvider>()
                            .translateText("Ordered On: ${order.datetime}"),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ?? "Ordered On: ${order.datetime}",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              // color: Colors.black54,
                            ),
                          );
                        },
                      ),
                      // Text(
                      //   "Ordered On: ${order.datetime}",
                      //   style: GoogleFonts.inter(
                      //     fontSize: 12,
                      //     color: Colors.black54,
                      //   ),
                      // ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Status Tag
                          Container(
                            height: 38,
                            width: 95,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                status,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),

                          // Dispatch Button (only for In Progress)
                          if (status == "In Progress")
                            GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    dispatchedOrders.add(pendingOrders[index]);
                                    pendingOrders.removeAt(
                                        index); // Remove item at the correct index
                                  });
                                  await FirebaseFirestore.instance
                                      .collection("BuyNow")
                                      .doc("sangu@gmail.com")
                                      .collection("MyBasket")
                                      .doc(pendingOrders[index].docId)
                                      .delete();
                                  // Add item to Firebase
                                  Map<String, dynamic> dpOrderlist = {
                                    "name": dispatchedOrders.last.name,
                                    "address": dispatchedOrders.last.address,
                                    "date": DateTime.now(),
                                    "orderNo": dispatchedOrders.last.orderNo,
                                    "proImage":
                                        dispatchedOrders.last.productImage,
                                  };

                                  await FirebaseFirestore.instance
                                      .collection("CollectionForDP")
                                      .doc("sangu@gmail.com")
                                      .collection("deliveryOrders")
                                      .add(dpOrderlist);

                                  Map<String, dynamic>
                                      deliverPersonNotifications = {
                                    "title": "Received Order",
                                    "Message":
                                        "You got an order for OrderNo:$orderNo"
                                  };

                                  await FirebaseFirestore.instance
                                      .collection("NotificationDelivery")
                                      .doc("sham@gmail.com")
                                      .collection("DP")
                                      .add(deliverPersonNotifications);

                                  getDPOrdersdata();
                                  getDeliveryNotifications();

                                  Map<String, dynamic> dispatchedList = {
                                    "url": individualItem[globalIndex].image,
                                    "name": signupCustomer[0].Name,
                                    "address": signupCustomer[0].Address,
                                    "datetime": DateTime.now(),
                                    "orderNo": orderNo,
                                    "quantity": selectedQuantity,
                                    "amount": finalTotalPrice
                                  };
                                  getdispatchedList();

                                  await FirebaseFirestore.instance
                                      .collection("DispatchedOrders")
                                      .doc("s@gmail.com")
                                      .collection("All")
                                      .add(dispatchedList);

                                  log("Deleted ");
                                },
                                child: Container(
                                  height: 38,
                                  width: 95,
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: FutureBuilder<String>(
                                    future: context
                                        .read<LanguageProvider>()
                                        .translateText("Dispatched"),
                                    builder: (context, snapshot) {
                                      return Text(snapshot.data ?? "Dispatched",
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center);
                                    },
                                  ),

                                  // const Text(
                                  //   "Dispatched",
                                  //   style: TextStyle(
                                  //       color: Colors.white,
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 14),
                                  //   textAlign: TextAlign.center,
                                  // ),
                                )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Container(
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 6, color: Colors.grey, offset: Offset(0, 3)),
            ],
          ),
          child: Row(
            children: [
              // Image Section
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(dispatchedOrders[index].productImage
                      // fit: BoxFit.cover,
                      ),
                ),
              ),

              // Details Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Order Details
                      FutureBuilder<String>(
                        future: context.read<LanguageProvider>().translateText(
                            "Order No: ${dispatchedOrders[index].orderNo}"),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ??
                                "Order No: ${dispatchedOrders[index].orderNo}",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          );
                        },
                      ),
                      // Text(
                      //   "Order No: ${dispatchedOrders[index].orderNo}",
                      //   style: GoogleFonts.inter(
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.w600,
                      //     color: Colors.black87,
                      //   ),
                      // ),
                      const SizedBox(height: 5),
                      FutureBuilder<String>(
                        future: context.read<LanguageProvider>().translateText(
                            "Name: ${dispatchedOrders[index].name}"),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ??
                                "Name: ${dispatchedOrders[index].name}",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              // fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          );
                        },
                      ),
                      // Text(
                      //   "Name: ${dispatchedOrders[index].name}",
                      //   style: GoogleFonts.inter(
                      //     fontSize: 13,
                      //     color: Colors.black54,
                      //   ),
                      // ),

                      const SizedBox(height: 5),
                      FutureBuilder<String>(
                        future: context.read<LanguageProvider>().translateText(
                            "Qty: ${dispatchedOrders[index].qty} | Amount: ${dispatchedOrders[index].amount}"),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ??
                                "Qty: ${dispatchedOrders[index].qty} | Amount: ${dispatchedOrders[index].amount}",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              // color: Colors.black54,
                            ),
                          );
                        },
                      ),
                      // Text(
                      //   "Qty: ${dispatchedOrders[index].qty} | Amount: ${dispatchedOrders[index].amount}",
                      //   style: GoogleFonts.inter(
                      //     fontSize: 13,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      const SizedBox(height: 5),
                      FutureBuilder<String>(
                        future: context
                            .read<LanguageProvider>()
                            .translateText("Ordered On: ${order.datetime}"),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ?? "Ordered On: ${order.datetime}",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              // fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          );
                        },
                      ),
                      // Text(
                      //   "Ordered On: ${order.datetime}",
                      //   style: GoogleFonts.inter(
                      //     fontSize: 12,
                      //     color: Colors.black54,
                      //   ),
                      // ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Status Tag
                          Container(
                            height: 38,
                            width: 95,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                status,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),

                          // Dispatch Button (only for In Progress)
                          if (status == "In Progress")
                            // FutureBuilder<String>(
                            //   future: context
                            //       .read<LanguageProvider>()
                            //       .translateText("In Progress"),
                            //   builder: (context, snapshot) {
                            //     return Text(
                            //       snapshot.data ?? "In Progress",
                            //     );
                            //   },
                            // ))
                            GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    dispatchedOrders.add(pendingOrders[index]);
                                    pendingOrders.removeAt(index);
                                  });
                                  // Remove item at the correct index

                                  // Add item to Firebase
                                  Map<String, dynamic> dpOrderlist = {
                                    "name": dispatchedOrders.last.name,
                                    "address": dispatchedOrders.last.address,
                                    "date": DateTime.now(),
                                    "orderNo": dispatchedOrders.last.orderNo,
                                    "proImage":
                                        dispatchedOrders.last.productImage,
                                  };

                                  FirebaseFirestore.instance
                                      .collection("CollectionForDP")
                                      .doc("sangu@gmail.com")
                                      .collection("deliveryOrders")
                                      .add(dpOrderlist);

                                  getDPOrdersdata();
                                },
                                child: Container(
                                  height: 38,
                                  width: 95,
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: FutureBuilder<String>(
                                    future: context
                                        .read<LanguageProvider>()
                                        .translateText("Dispatched"),
                                    builder: (context, snapshot) {
                                      return Text(
                                        snapshot.data ?? "Dispatched",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                        textAlign: TextAlign.center,
                                      );
                                    },
                                  ),
                                  // const Text(
                                  //   "Dispatched",
                                  //   style: TextStyle(
                                  //       color: Colors.white,
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 14),
                                  //   textAlign: TextAlign.center,
                                  // ),
                                )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
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
                colors: [Colors.green, Colors.white],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                children: [
                  const SizedBox(
                    width: 105,
                  ),
                  FutureBuilder<String>(
                    future: context
                        .read<LanguageProvider>()
                        .translateText("My Orders"),
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data ?? "My Orders",
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 26, 77, 28),
                        ),
                      );
                    },
                  ),
                  // Text(
                  //   "My Orders",
                  //   style: GoogleFonts.inter(
                  //     fontSize: 22,
                  //     fontWeight: FontWeight.w700,
                  //     color: const Color.fromARGB(255, 26, 77, 28),
                  //   ),
                  // ),
                  const SizedBox(
                    width: 40,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const FarmerNotificationPage();
                          }));
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            const Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 28,
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
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ChatPage();
                          }));
                        },
                        child: const Icon(
                          Icons.chat,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              centerTitle: true,
              bottom: TabBar(
                indicatorColor: const Color.fromARGB(255, 26, 77, 28),
                unselectedLabelColor: const Color.fromARGB(255, 143, 142, 142),
                labelColor: const Color.fromARGB(255, 26, 77, 28),
                tabs: [
                  Tab(
                    child: FutureBuilder<String>(
                      future: context
                          .read<LanguageProvider>()
                          .translateText("Pending Orders"),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "Pending Orders",
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            // color: const Color.fromARGB(255, 26, 77, 28),
                          ),
                        );
                      },
                    ),
                    // child: Text(
                    //   "Pending Orders",
                    //   style: GoogleFonts.inter(
                    //       fontSize: 15, fontWeight: FontWeight.bold),
                    // ),
                  ),
                  Tab(
                    child: FutureBuilder<String>(
                      future: context
                          .read<LanguageProvider>()
                          .translateText("Dispatched Orders"),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "Dispatched Orders",
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            // color: const Color.fromARGB(255, 26, 77, 28),
                          ),
                        );
                      },
                    ),
                    // child: Text(
                    //   "Dispatched Orders",
                    //   style: GoogleFonts.inter(
                    //       fontSize: 15, fontWeight: FontWeight.bold),
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: pendingOrders.length,
              itemBuilder: (context, indexcount1) {
                return buildOrderCard(
                    true, pendingOrders[index], "In Progress", indexcount1);
              },
            ),
            ListView.builder(
              itemCount: dispatchedOrders.length,
              itemBuilder: (context, indexcount2) {
                return buildOrderCard(
                    false, dispatchedOrders[index], "Dispatched", indexcount2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
