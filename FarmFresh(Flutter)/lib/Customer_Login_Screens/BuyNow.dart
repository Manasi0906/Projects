import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:language_page/Customer_Login_Screens/Basket.dart';
import 'package:language_page/Customer_Login_Screens/Notification.dart';
import 'package:language_page/Customer_Login_Screens/NotificationModal.dart';
import 'package:language_page/Customer_Login_Screens/Product_individual.dart';
import 'package:language_page/Customer_Login_Screens/YourOrder.dart';
import 'package:language_page/Customer_Login_Screens/YourProfile.dart';
import 'package:language_page/Customer_Login_Screens/apple.dart';
import 'package:language_page/Customer_Login_Screens/home_product_model.dart';
import 'package:language_page/Customer_Login_Screens/navbar.dart';
import 'package:language_page/FarmerLogin_Screens/NotificationFarmer.dart';
import 'package:language_page/FarmerLogin_Screens/NotificationModel.dart';
import 'package:language_page/FarmerLogin_Screens/farmer_homepage.dart';
import 'package:language_page/FarmerLogin_Screens/uploadPage.dart';
import 'package:language_page/Login_Signup_Screen/LoginPageFarmer.dart';
import 'package:language_page/Login_Signup_Screen/Login_page.dart';
import 'package:language_page/Login_Signup_Screen/signup_Customer.dart';
import 'package:language_page/chatApplication/chatpage1.dart';
import 'package:language_page/language_provider.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class AddressBuyNowPage extends StatelessWidget {
  const AddressBuyNowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor:
                      Colors.transparent, // Make AppBar transparent
                  elevation: 0,
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 32,
                                color: Color.fromARGB(255, 26, 77, 28),
                                weight: 30,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          FutureBuilder<String>(
                            future: context
                                .read<LanguageProvider>()
                                .translateText("Address"),
                            builder: (context, snapshot) {
                              return Text(
                                snapshot.data ?? "Address",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  // color:
                                  //     Color.fromARGB(255, 26, 77, 28),
                                  fontSize: 20,
                                ),
                              );
                            },
                          ),
                          // Text(
                          //   "Delivery Address",
                          //   style: TextStyle(
                          //     fontSize: 25,
                          //     fontWeight: FontWeight.w700,
                          //     color: Color.fromARGB(255, 26, 77, 28),
                          //   ),
                          // ),
                        ])
                      ])))),
      body: Column(children: [
        Column(
          children: [
            const OrderProgressIndicator(currentStep: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${signupCustomer[0].Name}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("${signupCustomer[0].Address}"),
                    const Text("+91 9763362691"),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: FutureBuilder<String>(
                            future: context
                                .read<LanguageProvider>()
                                .translateText("Edit"),
                            builder: (context, snapshot) {
                              return Text(
                                snapshot.data ?? "Edit",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 13,
                                ),
                              );
                            },
                          ),
                          // child: const Text("Edit",
                          //     style: TextStyle(color: Colors.green)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentPage()),
                            );
                          },
                          child: FutureBuilder<String>(
                            future: context
                                .read<LanguageProvider>()
                                .translateText("Deliver to this Address"),
                            builder: (context, snapshot) {
                              return Text(
                                snapshot.data ?? "Deliver to this Address",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              );
                            },
                          ),
                          // child: const Text(
                          //   "Deliver to this Address",
                          //   style: TextStyle(color: Colors.white),
                          // ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AddressPage();
              }));
            },
            child: Container(
              height: 35,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8),
                color: Colors.green.shade50,
              ),
              child: Padding(
                padding: EdgeInsets.all(3),
                child: FutureBuilder<String>(
                  future: context
                      .read<LanguageProvider>()
                      .translateText("+ Add Another Address"),
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data ?? " + Add Another Address",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    );
                  },
                ),
                // child: Text("+ Add Another Address",
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //         fontWeight: FontWeight.bold, fontSize: 16))),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class OrderProgressIndicator extends StatelessWidget {
  final int currentStep;

  const OrderProgressIndicator({Key? key, required this.currentStep})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 5, right: 16, left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStepIcon("Address", 1),
            const Expanded(
              child: Column(
                children: [
                  Divider(
                    color: Colors.green, // Color of the line
                    thickness: 1, // Thickness of the line
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            _buildStepIcon("Payment", 2),
            const Expanded(
              child: Column(
                children: [
                  Divider(
                    color: Colors.green, // Color of the line
                    thickness: 1, // Thickness of the line
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            _buildStepIcon("Summary", 3),
          ],
        ),
      ),
      const Divider(
        color: Colors.grey,
        thickness: 1,
        indent: 10,
        endIndent: 10,
      ),
    ]);
  }

  Widget _buildStepIcon(String label, int step) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor:
              currentStep >= step ? Colors.green : Colors.grey.shade300,
          child: Text("$step",
              style: TextStyle(
                  color: currentStep >= step ? Colors.white : Colors.black)),
        ),
        Text(label),
      ],
    );
  }
}

double? finalTotalPrice;

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool showCardFields = false;
  bool upiCard = false;
  String? selectedPaymentMethod;
  String? selectedUPIOption;

  // Constants
  double deliveryCharges = 50;
  double freeDeliveryThreshold = 499;
  double finalTotalNegotiatedPrice = 0;

  @override
  Widget build(BuildContext context) {
    double totalProductPrice = 0;
    //double totalQuantityPrice = 0;

    totalProductPrice = individualItem[0].proPrice * storedQuantity;
    double negotiatedTotal = negotiatedPrice * storedQuantity;

    double finalDeliveryCharges = 0.0;

    String? errorMessage;
    if (negotiationDone == true) {
      finalDeliveryCharges =
          negotiatedTotal > freeDeliveryThreshold ? 0 : deliveryCharges;
      finalTotalPrice = negotiatedTotal + finalDeliveryCharges;
    } else {
      if (flagBasket == false) {
        finalDeliveryCharges =
            totalProductPrice > freeDeliveryThreshold ? 0 : deliveryCharges;
        finalTotalPrice = totalProductPrice + finalDeliveryCharges;
      } else {
        finalDeliveryCharges =
            totalBasketPrice > freeDeliveryThreshold ? 0 : deliveryCharges;
        finalTotalPrice = totalBasketPrice + finalDeliveryCharges;
      }
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 32,
                                color: Color.fromARGB(255, 26, 77, 28),
                                weight: 30,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          FutureBuilder<String>(
                            future: context
                                .read<LanguageProvider>()
                                .translateText("Payment"),
                            builder: (context, snapshot) {
                              return Text(
                                snapshot.data ?? "Payment",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 26, 77, 28),
                                ),
                              );
                            },
                          ),
                          // const Text(
                          //   "Payment",
                          //   style: TextStyle(
                          //     fontSize: 25,
                          //     fontWeight: FontWeight.w700,
                          //     color: Color.fromARGB(255, 26, 77, 28),
                          //   ),
                          // ),
                        ])
                      ])))),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const OrderProgressIndicator(currentStep: 2),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 7),
                  FutureBuilder<String>(
                    future: context
                        .read<LanguageProvider>()
                        .translateText("Payment Details"),
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data ?? "Payment Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      );
                    },
                  ),
                  // const Text(
                  //   "Payment details:",
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  // ),

                  const SizedBox(height: 7),
                  flagBasket == false
                      ? (negotiationDone == false
                          ? (Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FutureBuilder<String>(
                                        future: context
                                            .read<LanguageProvider>()
                                            .translateText(
                                                individualItem[0].proName),
                                        builder: (context, snapshot) {
                                          return Text(
                                            snapshot.data ??
                                                individualItem[0].proName,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700),
                                          );
                                        },
                                      ),
                                      // Text(individualItem[globalIndex].proName,
                                      //     style: const TextStyle(fontSize: 16)),
                                      Text(
                                          '₹${individualItem[0].proPrice} x $storedQuantity',
                                          style: const TextStyle(fontSize: 16)),
                                      Text(
                                          '₹${individualItem[0].proPrice * storedQuantity}',
                                          style: const TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ),
                                FutureBuilder<String>(
                                  future: context
                                      .read<LanguageProvider>()
                                      .translateText(
                                          'Total Product Price: ₹$totalProductPrice'),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ??
                                          'Total Product Price: ₹$totalProductPrice',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    );
                                  },
                                ),
                                // Text('Total Product Price: ₹$totalProductPrice',
                                //     style: const TextStyle(fontSize: 16)),
                                const SizedBox(height: 8),
                                // Text('Quantity-wise Total: ₹$totalQuantityPrice', style: const TextStyle(fontSize: 16)),
                                // const SizedBox(height: 8),
                                FutureBuilder<String>(
                                  future: context
                                      .read<LanguageProvider>()
                                      .translateText(
                                          'Delivery Charges: ₹$finalDeliveryCharges'),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ??
                                          'Delivery Charges: ₹$finalDeliveryCharges',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    );
                                  },
                                ),
                                // Text('Delivery Charges: ₹$finalDeliveryCharges',
                                //     style: const TextStyle(fontSize: 16)),
                                const SizedBox(height: 8),
                                const Divider(),
                                const SizedBox(height: 8),
                              ],
                            ))
                          : (Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FutureBuilder<String>(
                                        future: context
                                            .read<LanguageProvider>()
                                            .translateText(
                                                individualItem[0].proName),
                                        builder: (context, snapshot) {
                                          return Text(
                                            snapshot.data ??
                                                individualItem[0].proName,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700),
                                          );
                                        },
                                      ),
                                      // Text(individualItem[globalIndex].proName,
                                      //     style: const TextStyle(fontSize: 16)),
                                      Text(
                                          '₹${negotiatedPrice} x $storedQuantity',
                                          style: const TextStyle(fontSize: 16)),
                                      Text(
                                          '₹${negotiatedPrice * storedQuantity}',
                                          style: const TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ),
                                FutureBuilder<String>(
                                  future: context
                                      .read<LanguageProvider>()
                                      .translateText(
                                          'Total Product Price: ₹$negotiatedTotal'),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ??
                                          'Total Product Price: ₹$negotiatedTotal',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    );
                                  },
                                ),
                                // Text('Total Product Price: ₹$negotiatedTotal',
                                //     style: const TextStyle(fontSize: 16)),
                                const SizedBox(height: 8),
                                // Text('Quantity-wise Total: ₹$totalQuantityPrice', style: const TextStyle(fontSize: 16)),
                                // const SizedBox(height: 8),
                                FutureBuilder<String>(
                                  future: context
                                      .read<LanguageProvider>()
                                      .translateText(
                                          'Delivery Charges: ₹$finalDeliveryCharges'),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ??
                                          'Delivery Charges: ₹$finalDeliveryCharges',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    );
                                  },
                                ),
                                // Text('Delivery Charges: ₹$finalDeliveryCharges',
                                //     style: const TextStyle(fontSize: 16)),
                                const SizedBox(height: 8),
                                const Divider(),
                                const SizedBox(height: 8),
                              ],
                            )))
                      : Column(
                          children: [
                            Column(
                              children: basketProductCards
                                  .asMap()
                                  .entries
                                  .where((entry) {
                                int index = entry.key;
                                return itemSelected[
                                    index]; // Check if the item is selected
                              }).map((entry) {
                                HomeProduct item = entry.value;
                                return Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FutureBuilder<String>(
                                        future: context
                                            .read<LanguageProvider>()
                                            .translateText(item.proName),
                                        builder: (context, snapshot) {
                                          return Text(
                                            snapshot.data ?? item.proName,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700),
                                          );
                                        },
                                      ),
                                      // Text(item.proName,
                                      //     style: const TextStyle(fontSize: 16)),
                                      Text('₹${item.proPrice}',
                                          style: const TextStyle(fontSize: 16)),
                                      // Text('₹${item.proPrice}* ${globalBasketQuantities[globalBasketIndices[index]] }', style: const TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            FutureBuilder<String>(
                              future: context
                                  .read<LanguageProvider>()
                                  .translateText(
                                      'Total Product Price: ₹$totalBasketPrice'),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.data ??
                                      'Total Product Price: ₹$totalBasketPrice',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                );
                              },
                            ),
                            // Text('Total Product Price: ₹$totalBasketPrice',
                            //     style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 8),
                            // Text('Quantity-wise Total: ₹$totalQuantityPrice', style: const TextStyle(fontSize: 16)),
                            // const SizedBox(height: 8),
                            FutureBuilder<String>(
                              future: context
                                  .read<LanguageProvider>()
                                  .translateText(
                                      'Delivery Charges: ₹$finalDeliveryCharges'),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.data ??
                                      'Delivery Charges: ₹$finalDeliveryCharges',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                );
                              },
                            ),
                            // Text('Delivery Charges: ₹$finalDeliveryCharges',
                            //     style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 8),
                            const Divider(),
                            const SizedBox(height: 8),
                          ],
                        ),

                  const SizedBox(height: 10),
                  // const Divider(),
                  const SizedBox(height: 16),

                  // Summary

                  Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green.shade50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          FutureBuilder<String>(
                            future: context
                                .read<LanguageProvider>()
                                .translateText("Total Amount "),
                            builder: (context, snapshot) {
                              return Text(
                                snapshot.data ?? "Total Amount ",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w500),
                              );
                            },
                          ),
                          // const Text("Total Amount ",
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.w500, fontSize: 19)),
                          const Spacer(),
                          const Icon(Icons.currency_rupee_sharp),
                          Text("$finalTotalPrice",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 19)),
                        ],
                      ),
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        FutureBuilder<String>(
                          future: context
                              .read<LanguageProvider>()
                              .translateText("Payment option:"),
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.data ?? "Payment option:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            );
                          },
                        ),
                        // const Text(
                        //   "Payment option:",
                        //   style: TextStyle(
                        //       fontSize: 18, fontWeight: FontWeight.w700),
                        // ),
                        ListTile(
                          leading: const Icon(Icons.credit_card),
                          title: const Text("Credit/Debit Card"),
                          trailing: selectedPaymentMethod == "Credit/Debit Card"
                              ? const Icon(Icons.check_circle,
                                  color: Colors.green)
                              : null, // Show check mark if selected
                          onTap: () {
                            setState(() {
                              selectedPaymentMethod = "Credit/Debit Card";
                              showCardFields = !showCardFields;
                            });
                          },
                        ),
                        if (showCardFields)
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Card Number",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  const TextField(
                                    decoration: InputDecoration(
                                      hintText: "xxxx xxxx xxxx xxxx",
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.number,
                                    maxLength: 16,
                                  ),
                                  const SizedBox(height: 10),
                                  const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Expiry Date",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            TextField(
                                              decoration: InputDecoration(
                                                hintText: "MM/YY",
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType:
                                                  TextInputType.datetime,
                                              maxLength: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("CVV",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            TextField(
                                              decoration: InputDecoration(
                                                hintText: "123",
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              maxLength: 3,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showCardFields = false;
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.green),
                                      child: const Center(
                                        child: Text(
                                          "Pay 250",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                        ListTile(
                          leading: const Icon(Icons.home),
                          title: const Text("Net Banking"),
                          trailing: selectedPaymentMethod == "Net Banking"
                              ? const Icon(Icons.check_circle,
                                  color: Colors.green)
                              : null, // Show check mark if selected
                          onTap: () {
                            setState(() {
                              selectedPaymentMethod = "Net Banking";
                            });
                          },
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                        ListTile(
                          leading: const Icon(Icons.payment),
                          title: const Text("Wallet"),
                          trailing: selectedPaymentMethod == "Wallet"
                              ? const Icon(Icons.check_circle,
                                  color: Colors.green)
                              : null, // Show check mark if selected
                          onTap: () {
                            setState(() {
                              selectedPaymentMethod = "Wallet";
                            });
                          },
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                        ListTile(
                          leading: const Icon(Icons.currency_rupee_rounded),
                          title: const Text("Cash On Delivery"),
                          trailing: selectedPaymentMethod == "Cash On Delivery"
                              ? const Icon(Icons.check_circle,
                                  color: Colors.green)
                              : null, // Show check mark if selected
                          onTap: () {
                            setState(() {
                              selectedPaymentMethod = "Cash On Delivery";
                            });
                          },
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                        ListTile(
                          leading: const Icon(Icons.money_rounded),
                          title: const Row(children: [
                            Text(
                              "UPI",
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "   (Pay by any UPI app)",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.green),
                            )
                          ]),
                          trailing: selectedPaymentMethod == "UPI"
                              ? const Icon(Icons.check_circle,
                                  color: Colors.green)
                              : null, // Show check mark if selected
                          onTap: () {
                            setState(() {
                              selectedPaymentMethod = "UPI";
                              upiCard = !upiCard;
                            });
                          },
                        ),
                        if (upiCard)
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  ...[
                                    {
                                      "name": "PhonePe",
                                      "image": "assets/phonepay.jpeg.jpg"
                                    },
                                    {
                                      "name": "Gpay",
                                      "image": "assets/googlepay.jpeg.jpg"
                                    },
                                    {
                                      "name": "FamPay",
                                      "image":
                                          "https://tse4.mm.bing.net/th?id=OIP.Bo-U_lBURXoZmnsk4rOttgAAAA&pid=Api&P=0&h=220"
                                    },
                                    {
                                      "name": "Paytm",
                                      "image":
                                          "https://static.vecteezy.com/system/resources/previews/019/017/541/original/paytm-transparent-free-png.png"
                                    },
                                  ].map((upi) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedUPIOption = upi["name"]!;
                                          selectedPaymentMethod = "UPI";
                                          upiCard = false; // Close card
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Colors.white,
                                                child: upi["image"]!
                                                        .contains("http")
                                                    ? Image.network(
                                                        upi["image"]!,
                                                        scale: 6.5)
                                                    : Image.asset(upi["image"]!,
                                                        scale: 6.5),
                                              ),
                                              const SizedBox(width: 20),
                                              FutureBuilder<String>(
                                                future: context
                                                    .read<LanguageProvider>()
                                                    .translateText(
                                                        upi["name"]!),
                                                builder: (context, snapshot) {
                                                  return Text(
                                                    snapshot.data ??
                                                        upi["name"]!,
                                                    style: TextStyle(
                                                        color: upi["name"] ==
                                                                selectedUPIOption
                                                            ? Colors.green
                                                            : Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  );
                                                },
                                              ),
                                              // Text(
                                              //   upi["name"]!,
                                              //   style: TextStyle(
                                              //     color: upi["name"] ==
                                              //             selectedUPIOption
                                              //         ? Colors.green
                                              //         : Colors.black,
                                              //     fontSize: 18,
                                              //     fontWeight: FontWeight.w600,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                          const Divider(
                                            color: Colors.grey,
                                            thickness: 1,
                                            indent: 10,
                                            endIndent: 10,
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 55,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              onPressed: () {
                                if (selectedPaymentMethod != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SummaryPage()),
                                  );

                                  setState(() {});
                                } else {
                                  errorMessage = null;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: FutureBuilder<String>(
                                            future: context
                                                .read<LanguageProvider>()
                                                .translateText(
                                                    "Please select a payment method before proceeding."!),
                                            builder: (context, snapshot) {
                                              return Text(
                                                snapshot.data ??
                                                    "Please select a payment method before proceeding.",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 26, 77, 28),
                                                  fontSize: 16,
                                                ),
                                              );
                                            },
                                          ),
                                          // content: Text(
                                          //   "Please select a payment method before proceeding.",
                                          //   style: TextStyle(
                                          //       color: Color.fromARGB(
                                          //           255, 26, 77, 28),
                                          //       fontSize: 16),
                                          // ),
                                          backgroundColor: Color.fromARGB(
                                              255, 192, 248, 193)));
                                  setState(() {});
                                }
                              },
                              child: const Text("Proceed to Summary",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryPage extends StatefulWidget {
  SummaryPage({Key? key}) : super(key: key);

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  bool showCardFields = false;
  bool upiCard = false;
  String?
      selectedPaymentMethod; // Variable to store the selected payment option
  String? selectedUPIOption;

  // Constants
  double deliveryCharges = 50;
  double freeDeliveryThreshold = 499;

  //List<HomeProduct> products = individualItem[index] as List<HomeProduct>;

  @override
  Widget build(BuildContext context) {
    double totalProductPrice = 0;
    totalProductPrice = individualItem[0].proPrice * storedQuantity;
    double negotiatedTotal = negotiatedPrice * storedQuantity;

    double finalDeliveryCharges = 0.0;

    String? errorMessage;
    if (negotiationDone == true) {
      finalDeliveryCharges =
          negotiatedTotal > freeDeliveryThreshold ? 0 : deliveryCharges;
      finalTotalPrice = negotiatedTotal + finalDeliveryCharges;
    } else {
      if (flagBasket == false) {
        finalDeliveryCharges =
            totalProductPrice > freeDeliveryThreshold ? 0 : deliveryCharges;
        finalTotalPrice = totalProductPrice + finalDeliveryCharges;
      } else {
        finalDeliveryCharges =
            totalBasketPrice > freeDeliveryThreshold ? 0 : deliveryCharges;
        finalTotalPrice = totalBasketPrice + finalDeliveryCharges;
      }
    }

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
                child: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 32,
                                  color: Color.fromARGB(255, 26, 77, 28),
                                  weight: 30,
                                )),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              "Order Summary",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 26, 77, 28),
                              ),
                            ),
                          ])
                        ])))),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const OrderProgressIndicator(currentStep: 3),
            const Text(
              "    Address Summary:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${signupCustomer[0].Name}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                    Text("${signupCustomer[0].Address}"),
                    Text("+91 9763362691"),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            const Text(
              "    Payment Summary:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 7),

                  flagBasket == false
                      ? (negotiationDone == false
                          ? (Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(individualItem[0].proName,
                                          style: const TextStyle(fontSize: 16)),
                                      Text(
                                          '₹${individualItem[0].proPrice} x $storedQuantity',
                                          style: const TextStyle(fontSize: 16)),
                                      Text(
                                          '₹${individualItem[0].proPrice * storedQuantity}',
                                          style: const TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ),
                                Text('Total Product Price: ₹$totalProductPrice',
                                    style: const TextStyle(fontSize: 16)),
                                const SizedBox(height: 8),
                                // Text('Quantity-wise Total: ₹$totalQuantityPrice', style: const TextStyle(fontSize: 16)),
                                // const SizedBox(height: 8),
                                Text('Delivery Charges: ₹$finalDeliveryCharges',
                                    style: const TextStyle(fontSize: 16)),
                                const SizedBox(height: 8),
                                const Divider(),
                                const SizedBox(height: 8),
                              ],
                            ))
                          : (Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(individualItem[0].proName,
                                          style: const TextStyle(fontSize: 16)),
                                      Text(
                                          '₹${negotiatedPrice} x $storedQuantity',
                                          style: const TextStyle(fontSize: 16)),
                                      Text(
                                          '₹${negotiatedPrice * storedQuantity}',
                                          style: const TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ),
                                Text('Total Product Price: ₹$negotiatedTotal',
                                    style: const TextStyle(fontSize: 16)),
                                const SizedBox(height: 8),
                                // Text('Quantity-wise Total: ₹$totalQuantityPrice', style: const TextStyle(fontSize: 16)),
                                // const SizedBox(height: 8),
                                Text('Delivery Charges: ₹$finalDeliveryCharges',
                                    style: const TextStyle(fontSize: 16)),
                                const SizedBox(height: 8),
                                const Divider(),
                                const SizedBox(height: 8),
                              ],
                            )))
                      : Column(
                          children: [
                            Column(
                              children: basketProductCards
                                  .asMap()
                                  .entries
                                  .where((entry) {
                                int index = entry.key;
                                return itemSelected[
                                    index]; // Check if the item is selected
                              }).map((entry) {
                                HomeProduct item = entry.value;
                                return Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(item.proName,
                                          style: const TextStyle(fontSize: 16)),
                                      Text('₹${item.proPrice}',
                                          style: const TextStyle(fontSize: 16)),
                                      // Text('₹${item.proPrice}* ${globalBasketQuantities[globalBasketIndices[index]] }', style: const TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            Text('Total Product Price: ₹$totalBasketPrice',
                                style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 8),
                            // Text('Quantity-wise Total: ₹$totalQuantityPrice', style: const TextStyle(fontSize: 16)),
                            // const SizedBox(height: 8),
                            Text('Delivery Charges: ₹$finalDeliveryCharges',
                                style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 8),
                            const Divider(),
                            const SizedBox(height: 8),
                          ],
                        ),

                  const SizedBox(height: 10),
                  // const Divider(),
                  const SizedBox(height: 16),

                  // Summary

                  Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green.shade50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          const Text("Total Amount ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 19)),
                          const Spacer(),
                          const Icon(Icons.currency_rupee_sharp),
                          Text("$finalTotalPrice",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 19)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                      );
                    },
                    child: const Text("Place Order",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ]),
        ));
  }
}

List<NotificationModelCustomer> orderNotification = [
  NotificationModelCustomer(
      title: "Order Placed", message: "Your order placed successfully!!")
];

List<NotificationModelFarmer> orderFarmerNotification = [
  NotificationModelFarmer(title: "Got Order", message: "You got an order!!")
];

int index = 0;

String getFormattedDate() {
  final DateTime now = DateTime.now();

  String getDayWithSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }

  String dayWithSuffix = getDayWithSuffix(now.day);
  String monthName = DateFormat('MMMM').format(now);

  return '$dayWithSuffix $monthName';
}

String dateTodayOrder = getFormattedDate();

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  void addToNotification(NotificationModelCustomer notification) {
    setState(() {
      notifications.add(notification);
    });
  }

  void addToFarmerNotification(NotificationModelFarmer notification) {
    setState(() {
      farmerNotifications.add(notification);
    });
  }

  void addOrderProduct(HomeProduct product) {
    setState(() {
      orderProductCards.add(product);
    });
  }

  // Define the yourOrder list
  List<HomeProduct> yourOrder = [];

// Function to complete the buy procedure
  void completePurchase() {
    // Add all selected items to yourOrder
    for (int i = 0; i < itemSelected.length; i++) {
      if (itemSelected[i]) {
        orderProductCards.add(basketProductCards[i]);
      }
    }

    // Reset selected items after purchase
    itemSelected = List<bool>.filled(basketProductCards.length, true);
  }

  // NotificationModelCustomer notification = orderNotification[index];
  // NotificationModelFarmer farmerNotification = orderNotification[index];

  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    flagComplete = false;
    _controller = VideoPlayerController.asset(
      'assets/verified.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late HomeProduct product;

  @override
  Widget build(BuildContext context) {
    if (flagBasket == false) {
      product = individualItem[0];
    } else {
      product = basketProductCards[globalBasket];
      // basketProductCards.map((item){
      //   product=item;
      // });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 280,
              height: 200,
              decoration: const BoxDecoration(color: Colors.white),
              child: Image.asset("assets/checkmarkimage.jpg"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "YOUR ORDER HAS BEEN CONFIRMED !!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
                orderNo++;
                Map<String, dynamic> basket = {
                  "url": individualItem[0].image,
                  "name": signupCustomer[0].Name,
                  "address": signupCustomer[0].Address,
                  "datetime": DateTime.now(),
                  "orderNo": orderNo,
                  "quantity": selectedQuantity,
                  "amount": finalTotalPrice
                };
                await FirebaseFirestore.instance
                    .collection("BuyNow")
                    .doc(CustomerMail)
                    .collection("MyBasket")
                    .add(basket);

                Map<String, dynamic> farmerNotifications = {
                  "title": "Received Order",
                  "Message": "You received an order for your Product"
                };

                await FirebaseFirestore.instance
                    .collection("NotificationFarmer")
                    .doc("s@gmail.com")
                    .collection("FN")
                    .add(farmerNotifications);

                getFarmerOrdersdata(CustomerMail!);
                getFarmerNotifications();

                // addToNotification(notification);
                // addToFarmerNotification(farmerNotification);

                flagBasket == true
                    ? completePurchase()
                    : addOrderProduct(product);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const YourOrderPage(),
                  ),
                  (route) => route.isFirst,
                );
              },
              child: Container(
                height: 42,
                width: 100,
                padding: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green),
                child: const Text(
                  "Done",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
