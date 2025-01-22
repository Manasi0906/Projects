import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:language_page/Customer_Login_Screens/Basket.dart';
import 'package:language_page/Customer_Login_Screens/BuyNow.dart';
import 'package:language_page/Customer_Login_Screens/ProfilePage.dart';
import 'package:language_page/Customer_Login_Screens/Wishlist.dart';
import 'package:language_page/Customer_Login_Screens/apple.dart';
import 'package:language_page/Customer_Login_Screens/home_customer.dart';
import 'package:language_page/Customer_Login_Screens/home_product_model.dart';
import 'package:language_page/FarmerLogin_Screens/FarmerModel.dart';
import 'package:language_page/FarmerLogin_Screens/YourProducts.dart';
import 'package:language_page/FarmerLogin_Screens/farmer_homepage.dart';
import 'package:language_page/FarmerLogin_Screens/uploadPage.dart';
import 'package:language_page/Login_Signup_Screen/Login_page.dart';
import 'package:language_page/Login_Signup_Screen/signup_Customer.dart';
import 'package:language_page/chatApplication/chatpage1.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

int orderNo = 1001;

Future<void> getFarmerOrdersdata(String CustomerMail) async {
  pendingOrders.clear();
  try {
    log("-----------------------------------------GET DATA========================================");

    // Fetch data from Firebase Firestore
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection("BuyNow")
        .doc("sangu@gmail.com")
        .collection("MyBasket")
        .get();

    log("Mail:$CustomerMail");
    log("got data: ${response.docs.length}");

    // Loop through the documents and add data to signupCustomer
    for (int i = 0; i < response.docs.length; i++) {
      pendingOrders.add(FarmerModel(
        productImage: response.docs[i]['url'],
        name: response.docs[i]['name'],
        address: response.docs[i]['address'],
        datetime: (response.docs[i]['datetime'] as Timestamp).toDate(),
        orderNo: response.docs[i]['orderNo'].toString(),
        qty: response.docs[i]['quantity'].toString(),
        amount: response.docs[i]['amount'].toString(),
        docId: response.docs[i].id,
      ));
      log("Got Basket data");
    }

    // Access data from signupCustomer correctly
  } catch (e) {
    // Catch any error that occurs during the Firebase call or data processing
    log("Error fetching customer data: $e");
  }
}

final List<Map<String, dynamic>> reviews = [
  {
    'customerName': "John Doe",
    'rating': 5,
    'review': "Great quality apples, will buy again!",
    'date': "2024-11-01",
    'customerImage': "assets/default_user.jpg",
    'reviewImage': "assets/fruits/apple2.jpg",
  },
  {
    'customerName': "Jane Smith",
    'rating': 4,
    'review': "Very fresh, highly recommend!",
    'date': "2024-11-02",
    'customerImage': "assets/default_user.jpg",
    'reviewImage': "assets/fruits/apple.jpg",
  },
  {
    'customerName': "Mark Brown",
    'rating': 3,
    'review': "The apples are good, but a bit pricey.",
    'date': "2024-11-03",
    'customerImage': "assets/default_user.jpg",
    'reviewImage': "assets/fruits/apple4.jpg",
  }
];

int storedQuantity = 1;
int selectedQuantity = 1;
double negotiatedPrice = individualItem[0].proPrice;

List<HomeProduct> individualItem = [];

void main() {
  runApp(const ProductIndividualPage());
}

class ProductIndividualPage extends StatefulWidget {
  const ProductIndividualPage({super.key});

  @override
  State<ProductIndividualPage> createState() => _ProductIndividualPage();
}

class _ProductIndividualPage extends State<ProductIndividualPage> {
  List<bool> isFavorited = [false];

  // void toggleFavorite(int index) {
  //   setState(() {
  //     isFavorited[index] = !isFavorited[index];
  //   });
  // }

  void shareProduct(String imageUrl) {
    Share.share('Check out this product: $imageUrl');
  }

  void addToBasket(HomeProduct product) {
    setState(() {
      basketProductCards.add(product);
    });
  }

  bool isFavourite = false;

  bool isProductFavorited(HomeProduct product) {
    return wishlistProductCards.contains(product);
  }

  void toggleFavorite(HomeProduct product) {
    setState(() {
      if (isProductFavorited(product)) {
        wishlistProductCards.remove(product);
      } else {
        wishlistProductCards.add(product);
      }
    });
  }

  int quantity = 1;
  double get totalPrice => selectedQuantity * individualItem[0].proPrice;

  late FixedExtentScrollController _scrollController;

  // Open Quantity BottomSheet
  void _showQuantityBottomSheet() {
    _scrollController =
        FixedExtentScrollController(initialItem: storedQuantity - 1);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white, // Set the color of the bottom sheet
      isScrollControlled: true, // Make bottom sheet fit the content
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FutureBuilder<String>(
                              future: context
                                  .read<LanguageProvider>()
                                  .translateText("Select Quantity"),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.data ?? "Select Quantity",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    //  color: Color.fromARGB(255, 26, 77, 28),
                                    fontSize: 18,
                                  ),
                                );
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  storedQuantity =
                                      selectedQuantity; // Store the selected quantity
                                });
                                Navigator.pop(context); // Close the BottomSheet
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              child: FutureBuilder<String>(
                                future: context
                                    .read<LanguageProvider>()
                                    .translateText('Done'),
                                builder: (context, snapshot) {
                                  return Text(
                                    snapshot.data ?? 'Done',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  );
                                },
                              ),
                              //  const Text(
                              //   'Done',
                              //   style: TextStyle(
                              //       color: Colors.white, fontSize: 16),
                              // ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16.0),
                                child: Image.asset(
                                  'assets/fruits/apple1.jpg',
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height:
                                    180, // Height to show around 3 items at a time
                                child: ListWheelScrollView.useDelegate(
                                  controller: _scrollController,
                                  itemExtent: 60,
                                  diameterRatio: 2,
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: (index) {
                                    setModalState(() {
                                      selectedQuantity =
                                          (index + 1) > 0 ? index + 1 : 1;
                                    });
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    builder: (context, index) {
                                      if (index >= 50) return null;
                                      int quantity = index + 1;
                                      return AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        opacity: selectedQuantity == quantity
                                            ? 1.0
                                            : 0.5,
                                        child: BackdropFilter(
                                          filter: selectedQuantity == quantity
                                              ? ImageFilter.blur(
                                                  sigmaX: 0, sigmaY: 0)
                                              : ImageFilter.blur(
                                                  sigmaX: 0, sigmaY: 0),
                                          child: Container(
                                            height: 60,
                                            alignment: Alignment.center,

                                            ///color: Colors.transparent,
                                            child: Text(
                                              '$quantity',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    selectedQuantity == quantity
                                                        ? Colors.black
                                                        : Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              "Item(s)",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Actual Price:',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Text(
                              '\₹${individualItem[0].proPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Price:',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                                children: [
                                  const TextSpan(
                                    text: "₹",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: totalPrice.toStringAsFixed(0),
                                    style: const TextStyle(fontSize: 28),
                                  ),
                                  TextSpan(
                                    text: totalPrice
                                        .toStringAsFixed(2)
                                        .substring(3),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Open Review BottomSheet
  void _showReviewBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "You can't leave a review as you haven't purchased this product.",
                        style: TextStyle(
                            color: Color.fromARGB(255, 26, 77, 28),
                            fontSize: 16),
                      ),
                      backgroundColor: Color.fromARGB(255, 192, 248, 193)));
                  setState(() {});
                  // Implement add text review functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(45), // Set button height
                ),
                child: const Text('Add Review',
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "You can't leave a review as you haven't purchased this product.",
                      style: TextStyle(
                          color: Color.fromARGB(255, 26, 77, 28), fontSize: 16),
                    ),
                    backgroundColor: Color.fromARGB(255, 192, 248, 193),
                  ));
                  setState(() {});
                  // Implement add review with image/video functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(45), // Set button height
                ),
                child: const Text('Add Review with Image/Video',
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

  final String productWeight = "1 Kg";
  final String storageConditions = "Store in a cool, dry place.";
  final String shelfLife = "7 days from the date of purchase.";
  final String packagingType = "Eco-friendly recyclable packaging.";

  final bool isInStock = true; // Example stock status

  double? averageRating = individualItem[0].rating;
  int totalRatings = 10 + 5 + 2 + 1;
  final Map<int, int> ratingDistribution = {
    5: 10,
    4: 5,
    3: 2,
    2: 1,
    1: 0,
  };

  void openFarmerProfile() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerProfilePage()));
  }

  PageController pageController = PageController(viewportFraction: 0.8);
  int currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = isProductFavorited(individualItem[0]);
    return Scaffold(
      backgroundColor: Colors.white,
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
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Product",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Container(
                  height: 250,
                  width: 900,
                  child: Stack(
                    children: [
                      // Add a Container to give width and height to the PageView
                      Positioned.fill(
                        // Makes the PageView take the full space
                        child: Container(
                          width: double.infinity,
                          height: 320, // Set a specific height to the PageView
                          child: PageView.builder(
                            controller: pageController,
                            itemCount: individualItem[0].productImages!.length,
                            itemBuilder: (context, index) {
                              print(
                                  "Index: $index, URL: ${individualItem[0].productImages![index]}");

                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // Text(
                                  //     "Index: $index"), // Display the index for debugging
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    width: 400,
                                    height: 230, // Adjust as needed
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.green, width: 3),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: individualItem[0].isBasketItem
                                            ? Image.asset(
                                                individualItem[0]
                                                    .productImages![index],
                                                fit: BoxFit.contain,
                                              )
                                            : Image.network(
                                                individualItem[0]
                                                    .productImages![index],
                                                fit: BoxFit.contain,
                                              )),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),

                      // Favorite and Share icons on top of the image
                      Positioned(
                        top: 12,
                        right: 35,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                toggleFavorite(individualItem[0]);
                              },
                            ),
                            IconButton(
                              icon:
                                  const Icon(Icons.share, color: Colors.black),
                              onPressed: () =>
                                  shareProduct("assets/fruits/apple.jpg"),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // Page Indicator (Dots)
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: List.generate(
              //     individualItem[0].productImages!.length,
              //     (index) => Container(
              //       margin: const EdgeInsets.symmetric(horizontal: 4),
              //       width: 10,
              //       height: 10,
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         color: currentPage == index ? Colors.green : Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 30,
              // ),

              // Product name and price with gradient background
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Category: Apples",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      individualItem[0].proName,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Price: ₹${individualItem[0].proPrice}/kg (₹${(individualItem[0].proPrice) / 10}/100g)',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatPage()));
                      },
                      child: Container(
                        height: 35,
                        width: 130,
                        decoration: BoxDecoration(
                          //color: Colors.green,
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.chat,
                              size: 18,
                            ),
                            Text("Negotiate", style: TextStyle(fontSize: 17)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        _showQuantityBottomSheet();
                      },
                      child: Container(
                        height: 35,
                        width: 120,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Quantity", style: TextStyle(fontSize: 17)),
                            Icon(Icons.arrow_drop_down_outlined)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Product stock status
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  isInStock ? "In Stock" : "Out of Stock",
                  style: TextStyle(
                      fontSize: 17,
                      color: isInStock ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),

              // Farmer's name under product images
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      "Sold by: ${individualItem[0].farmerName}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "FREE delivery on orders over ₹499",
                  style: TextStyle(
                      fontSize: 17, color: Colors.black87, height: 1.6),
                ),
              ),
              const SizedBox(height: 15),

              // Quantity selection
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   child: GestureDetector(
              //     onTap: () {
              //         _showQuantityBottomSheet();
              //     },
              //     child: Container(
              //       height: 35,
              //       width: 120,
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.green),
              //         borderRadius: BorderRadius.circular(15)
              //       ),
              //       child: const Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: [
              //           Text("Quantity", style: TextStyle(fontSize: 17)),
              //           Icon(Icons.arrow_drop_down_outlined)
              //         ],
              //       ),
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.green)),
                  child: Column(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 9,
                                ),
                                Icon(
                                  Icons.local_shipping,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "Fast Delivery",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 45,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 34,
                                  width: 34,
                                  child: Image.asset("assets/freshlogo.png"),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "Fresh Product",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  child: Image.asset("assets/nonreturn.png"),
                                ),
                                //const SizedBox(width: 10,),
                                const Text(
                                  "Non-Returnable",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                          Container(
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 7,
                                ),
                                Container(
                                  height: 22,
                                  width: 22,
                                  child: Image.asset(
                                      "assets/securetransaction.png"),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "Secure Transaction",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Product description with stylized text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description:",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          height: 1.6,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${individualItem[0].productDescrip}",
                      style: const TextStyle(
                          fontSize: 16, color: Colors.black87, height: 1.6),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Rating Distribution Poll
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Display the average rating in bold
                          const Text(
                            "Overall Rating:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              // Show stars (filled based on average rating)
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < averageRating!
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 20,
                                  );
                                }),
                              ),
                              const SizedBox(width: 10),
                              // Display the average rating value
                              Text(
                                "$averageRating out of 5",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          // Display the number of ratings in less bold
                          Text(
                            "$totalRatings global ratings",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    for (int i = 5; i >= 1; i--)
                      Row(
                        children: [
                          Text(
                            "$i Star",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: (ratingDistribution[i]! * 20.0).toDouble(),
                            height: 9,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "${ratingDistribution[i]!} people",
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Overall Rating Section

              // Customer reviews with images and add review option
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: reviews.map((review) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.person_rounded),
                                    Text(review['customerName'],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Text(review['date'],
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.yellow[700], size: 18),
                                Text(review['rating'].toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(review['review'],
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                    height: 1.5)),
                            const SizedBox(height: 8),
                            review['reviewImage'] != null
                                ? Image.asset(review['reviewImage'],
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.contain)
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ReviewListPage();
                    }));
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 42,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("See more reviews",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Button to add new review
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    _showReviewBottomSheet();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 45,
                    width: 130,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Add Review",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "You might also like",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 29, 114, 32)),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: recentlyProductCards.map((product) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      width: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(color: Colors.green)),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              product.image!,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            product.proName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "₹${product.proPrice}${product.measureUnit}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 120,
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        addToBasket(individualItem[0]);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "${individualItem[0].proName} added To Basket!",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 26, 77, 28),
                                  fontSize: 16),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 192, 248, 193)));
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity,
                            50), // Set height to 60 and width to take full space
                      ),
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // Add space between buttons
                  // "Buy Now" Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // orderNo++;
                        // Map<String, dynamic> basket = {
                        //   "url": individualItem[globalIndex].image,
                        //   "name": signupCustomer[0].Name,
                        //   "address": signupCustomer[0].Address,
                        //   "datetime": DateTime.now(),
                        //   "orderNo": orderNo,
                        // "quantity": _selectedQuantity,
                        // "amount": totalPrice
                        // };
                        // await FirebaseFirestore.instance
                        //     .collection("BuyNow")
                        //     .doc(CustomerMail)
                        //     .collection("MyBasket")
                        //     .add(basket);

                        // getFarmerOrdersdata(CustomerMail);

                        flagBasket = false;
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const AddressBuyNowPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity,
                            50), // Set height to 60 and width to take full space
                      ),
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class ReviewListPage extends StatelessWidget {
  double averageRating = 3; // Replace with your logic to compute the average
  int totalRatings =
      10 + 5 + 2 + 1; // Replace with your logic to compute the total ratings
  final Map<int, int> ratingDistribution = {
    5: 10, // 10 people rated 5 stars
    4: 5, // 5 people rated 4 stars
    3: 2, // 2 people rated 3 stars
    2: 1, // 1 person rated 2 stars
    1: 0, // 0 people rated 1 star
  };
  // Sample data for reviews
  final List<Map<String, dynamic>> reviews = List.generate(15, (index) {
    return {
      'user': 'User ${index + 1}',
      'date': '2024-11-${index + 1}',
      'rating': (index % 5) + 1,
      // 'reviewText': 'This is a detailed review text for user ${index + 1}.',
      'media': index % 3 == 0 ? 'https://via.placeholder.com/150' : null,
      'isVideo': index % 5 == 0, // To simulate some media as videos
    };
  });

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
                            "All Reviews",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display the average rating in bold
                      const Text(
                        "Overall Rating:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          // Show stars (filled based on average rating)
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < averageRating
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: 20,
                              );
                            }),
                          ),
                          const SizedBox(width: 10),
                          // Display the average rating value
                          Text(
                            "$averageRating out of 5",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // Display the number of ratings in less bold
                      Text(
                        "$totalRatings global ratings",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                for (int i = 5; i >= 1; i--)
                  Row(
                    children: [
                      Text(
                        "$i Star",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: (ratingDistribution[i]! * 20.0).toDouble(),
                        height: 9,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${ratingDistribution[i]!} people",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header with user name and date
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child:
                                      Icon(Icons.person, color: Colors.white),
                                  radius: 16,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  review['user'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              review['date'],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Rating display
                        Row(
                          children: List.generate(5, (starIndex) {
                            return Icon(
                              starIndex < review['rating']
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 20,
                            );
                          }),
                        ),
                        const SizedBox(height: 12),
                        // Review text
                        // Text(
                        //   review['reviewText'],
                        //   style: const TextStyle(fontSize: 14),
                        // ),
                        // const SizedBox(height: 12),
                        // // Media display (image or video)
                        if (review['media'] != null)
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: review['isVideo']
                                ? Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 150,
                                        width: double.infinity,
                                        color: Colors.black12,
                                      ),
                                      const Icon(Icons.play_circle_filled,
                                          color: Colors.black87, size: 50),
                                    ],
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      "assets/fruits/apple2.jpg",
                                      fit: BoxFit.contain,
                                      // Replace with your image path
                                      height: 150,
                                      width: 150,
                                      // fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        const SizedBox(height: 12),
                        //Verified Purchase & Tags
                        const Text(
                          "Verified Purchase - Size: Medium, Color: red",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        // const SizedBox(height: 8),
                        // Wrap(
                        //   spacing: 6.0,
                        //   children: [
                        //     Chip(
                        //       label: Text("Fast Delivery"),
                        //       backgroundColor: Colors.green.shade100,
                        //     ),
                        //     Chip(
                        //       label: Text("Great Quality"),
                        //       backgroundColor: Colors.blue.shade100,
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 12),
                        // Seller's Response
                        if (index % 2 == 0)
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "Seller's Response: Thank you for your valuable feedback!",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black87),
                            ),
                          ),
                        const SizedBox(height: 12),
                        // Helpful Votes and Report Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.thumb_up,
                                    size: 16, color: Colors.blue),
                                SizedBox(width: 4),
                                Text(
                                  "12 helpful votes",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Row(
                                children: [
                                  Icon(Icons.flag,
                                      size: 16, color: Colors.grey),
                                  SizedBox(width: 4),
                                  Text("Report",
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
