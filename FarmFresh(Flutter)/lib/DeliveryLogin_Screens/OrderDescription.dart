import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:language_page/Customer_Login_Screens/Product_individual.dart';
import 'package:language_page/DeliveryLogin_Screens/OrderDescription.dart';
import 'package:language_page/DeliveryLogin_Screens/OrderDescription.dart';
import 'package:language_page/FarmerLogin_Screens/NotificationFarmer.dart';
import 'package:language_page/FarmerLogin_Screens/NotificationModel.dart';
import './OrderModel.dart';
import 'orders.dart';

List<OrdersModel> orders = [];
DeliveryPerson_HomePage_State farmerorder = DeliveryPerson_HomePage_State();
int onlyIndex = 0;

class OrderdescriptionPage extends StatefulWidget {
  const OrderdescriptionPage({super.key, required OrdersModel order});

  @override
  State<OrderdescriptionPage> createState() => _OrderdescriptionPageState();
}

class _OrderdescriptionPageState extends State<OrderdescriptionPage> {
  // PastOrderdescriptionPage card = const PastOrderdescriptionPage();

  @override
  Widget build(BuildContext context) {
    log("${orders}");
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
        title: const Text(
          "Booking for 20 Jun,12:30 PM",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 26, 77, 28),
          ),
        ),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Container(
                width: double.infinity,
                height: 215,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            //const SizedBox(width: 30),
                            //
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(orders[onlyIndex].profileimage),
                              radius: 50,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 10)),
                                  Text(
                                    orders[onlyIndex].name,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    orders[onlyIndex].address,
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
                                        orders[onlyIndex]
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
                                  //  Row(
                                  //   children: [
                                  //     Text(
                                  //       "Time: ",
                                  //       style: TextStyle(
                                  //         fontSize: 14,
                                  //         fontWeight: FontWeight.w300,
                                  //       ),
                                  //     ),
                                  //     Text(
                                  //       orders[index].time,
                                  //       style: TextStyle(
                                  //         fontSize: 14,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),

                            const SizedBox(
                              width: 15,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Order:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 17, 76, 19)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              orders[onlyIndex].order,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green),
                            )
                          ],
                        ),
                      ]),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Container(
                height: 225,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    border: Border.all(color: Colors.green)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.green),
                              color: const Color.fromARGB(255, 43, 168, 48),
                            ),
                            child: const Icon(
                              Icons.access_time,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pending",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "On 18 Jun 2024 12:40 PM",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(color: Colors.green),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.green),
                                color: const Color.fromARGB(255, 43, 168, 48)),
                            child: const Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order In Process",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Will start by 20 Jun 2024, 12:30 PM",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(color: Colors.green),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 43, 168, 48),
                            ),
                            child: const Icon(
                              Icons.check_circle,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Job Finished",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Estimated completion on 20 Jun,2024",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    border: Border.all(color: Colors.green)),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.money,
                      color: Colors.green,
                      size: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Services Cost ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 33, 102, 35),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(children: [
                            Icon(
                              Icons.currency_rupee,
                              size: 20,
                            ),
                            Text("50 / hr")
                          ]),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 89,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      border: Border.all(color: Colors.green)),
                  child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "  Order Address :",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 35),
                                child: Text(
                                  "house no : 4, near hanuman temple, vadjal, Tal- Man, Dist- Satara,415014",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )))
                      ])),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.green)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            "assets/freshlogo.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Customer Review",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Rating:",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 20),
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 20),
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 20),
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 20),
                                  Icon(Icons.star_half,
                                      color: Colors.amber, size: 20),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Description:",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                "Delivery was timely, and the items were in excellent condition. The service was satisfactory, and I appreciate the professionalism of the delivery team.",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
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
                },
                child: Container(
                  width: 390,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      border: Border.all(color: Colors.green)),
                  height: 50,
                  child: Center(
                    child: Text("Order Delivered Successfully !!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.green[800],
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ]),
          )),
    );
  }
}

// class PastOrderdescriptionPage extends StatefulWidget {
//   const PastOrderdescriptionPage({super.key});

//   @override
//   State createState() => _PastOrderdescriptionPageState();
// }

// class _PastOrderdescriptionPageState extends State<PastOrderdescriptionPage> {
//   _OrderdescriptionPageState past = _OrderdescriptionPageState();
//   bool flag = true;

//   Widget pastOrders() {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: 1,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
//             child: GestureDetector(
//               onTap: () {
//                 print("hello");
//               },
//               child: Container(
//                 height: 150,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(color: Colors.green, width: 2),
//                   color: Colors.white,
//                 ),
//                 child: Center(
//                   child: Row(
//                     children: [
//                       const SizedBox(width: 30),
//                       Container(
//                         height: 120,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: CircleAvatar(
//                           backgroundImage:
//                               NetworkImage(orders[index].profileimage),
//                           radius: 50,
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               orders[index].name,
//                               // past.index;
//                               style: const TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               orders[index].address,
//                               style: const TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             // Row(
//                             //   children: [
//                             //     const Text(
//                             //       "Date: ",
//                             //       style: TextStyle(
//                             //         fontSize: 14,
//                             //         fontWeight: FontWeight.w300,
//                             //       ),
//                             //     ),
//                             //     Text(
//                             //       past.orders[index].date,
//                             //       style: const TextStyle(
//                             //         fontSize: 14,
//                             //         fontWeight: FontWeight.bold,
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),
//                             //  Row(
//                             //   children:[
//                             //     const Text(
//                             //       "Time: ",
//                             //       style: TextStyle(
//                             //         fontSize: 14,
//                             //         fontWeight: FontWeight.w300,
//                             //       ),
//                             //     ),
//                             //     Text(
//                             //       past.orders[index].time,
//                             //       style: const TextStyle(
//                             //         fontSize: 14,
//                             //         fontWeight: FontWeight.bold,
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),
//                             const SizedBox(height: 10),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: const Color.fromARGB(255, 237, 225, 225),
//       body: Column(
//         children: [
//           CustomScrollView(
//             shrinkWrap: true,
//             slivers: [
//               SliverAppBar(
//                 expandedHeight: 110,
//                 floating: false,
//                 pinned: true,
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Container(
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topRight,
//                         end: Alignment.bottomLeft,
//                         colors: [
//                           Colors.green,
//                           Color.fromARGB(255, 232, 236, 233),
//                         ],
//                       ),
//                     ),
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 20),
//                         const Text(
//                           "Orders",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.w600,
//                             color: Color.fromARGB(255, 17, 92, 19),
//                           ),
//                         ),
//                         const SizedBox(height: 22),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   //flag = true;
//                                 });
//                               },
//                               child: const Text(
//                                 "Upcoming orders",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 49, 150, 52),
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   flag = false;
//                                 });
//                               },
//                               child: const Text(
//                                 "Past orders",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 49, 150, 52),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           flag ? pastOrders() : nothing(),
//         ],
//       ),
//     );
//   }

//   nothing() {}
// }
