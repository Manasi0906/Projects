import 'package:flutter/material.dart';
import 'package:language_page/FarmerLogin_Screens/NotificationModel.dart';

List<NotificationModelFarmer> farmerNotifications = [
  // NotificationModel(
  //     title: 'Order Shipped',
  //     message: 'Your order has been shipped!',
  //     isSeen: false),
  // NotificationModel(
  //     title: 'New Discount',
  //     message: '20% off on your next purchase!',
  //     isSeen: false),
  // NotificationModel(
  //     title: 'Order Delivered',
  //     message: 'Your order has been delivered.',
  //     isSeen: true),
  // NotificationModel(
  //     title: 'Price Drop Alert',
  //     message: 'An item in your wishlist is now cheaper!',
  //     isSeen: false),
  // NotificationModel(
  //     title: 'Account Update',
  //     message: 'Your account information has been updated.',
  //     isSeen: true),
  // NotificationModel(
  //     title: 'Preorder Confirmed',
  //     message: 'Your preorder has been confirmed.',
  //     isSeen: false),
  // NotificationModel(
  //     title: 'Preorder Shipped',
  //     message: 'Your preorder has been shipped!',
  //     isSeen: true),
  // NotificationModel(
  //     title: 'New Preorder Available',
  //     message: 'A new product is available for preorder.',
  //     isSeen: false),
];

class FarmerNotificationPage extends StatefulWidget {
  const FarmerNotificationPage({super.key});

  @override
  State<FarmerNotificationPage> createState() => _FarmerNotificationPage();
}

class _FarmerNotificationPage extends State<FarmerNotificationPage> {
  List<bool> selectedNotifications = [];
  bool showSelection = false;

  @override
  void initState() {
    super.initState();
    selectedNotifications =
        List<bool>.filled(farmerNotifications.length, false);
  }

  void deleteSelectedNotifications() {
    setState(() {
      farmerNotifications = [
        for (int i = 0; i < farmerNotifications.length; i++)
          if (!selectedNotifications[i]) farmerNotifications[i]
      ];
      selectedNotifications =
          List<bool>.filled(farmerNotifications.length, false);
      showSelection = false;
    });
  }

  int countUnseenNotifications() {
    return farmerNotifications
        .where((notification) => !notification.isSeen)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 80.0,
            floating: true,
            snap: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.green,
                          Color.fromARGB(255, 232, 236, 233)
                        ],
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 17, left: 20, right: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back,
                                size: 32,
                                color: Color.fromARGB(255, 26, 77, 28)),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Notifications",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 26, 77, 28),
                              fontSize: 25,
                            ),
                          ),
                          if (countUnseenNotifications() > 0)
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 12,
                                child: Text(
                                  countUnseenNotifications().toString(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ),
                          const Spacer(),
                          if (!showSelection)
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Color.fromARGB(255, 26, 77, 28)),
                              onPressed: () {
                                setState(() {
                                  showSelection = true;
                                });
                              },
                            ),
                          if (showSelection)
                            IconButton(
                              icon: const Icon(Icons.check,
                                  color: Color.fromARGB(255, 26, 77, 28)),
                              onPressed: deleteSelectedNotifications,
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 232, 236, 233),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final notification = farmerNotifications[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: notification.isSeen
                          ? Colors.grey.shade300
                          : Colors.green.shade100,
                    ),
                    child: ListTile(
                      leading: showSelection
                          ? Checkbox(
                              value: selectedNotifications[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedNotifications[index] = value ?? false;
                                });
                              },
                            )
                          : null,
                      title: Text(
                        notification.title,
                        style: TextStyle(
                          fontWeight: notification.isSeen
                              ? FontWeight.normal
                              : FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(notification.message),
                      // trailing: IconButton(
                      //   icon: const Icon(Icons.more_vert),
                      //   onPressed: () {
                      //     // Handle more actions if needed
                      //   },
                      // ),
                      onTap: () {
                        setState(() {
                          notification.isSeen = true;
                        });
                      },
                    ),
                  ),
                );
              },
              childCount: farmerNotifications.length,
            ),
          ),
        ],
      ),
    );
  }
}
