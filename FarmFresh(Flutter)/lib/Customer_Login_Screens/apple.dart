import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/Basket.dart';
import 'package:language_page/Customer_Login_Screens/BuyNow.dart';
import 'package:language_page/Customer_Login_Screens/Product_individual.dart';
import 'package:language_page/Customer_Login_Screens/Wishlist.dart';
import 'package:language_page/Customer_Login_Screens/home_product_model.dart';
import 'package:language_page/FarmerLogin_Screens/uploadPage.dart';

int globalIndex = 0;
int indexforbuynow = 0;

List<HomeProduct> appleList = [
  // HomeProduct(
  //     image: "assets/fruits/apple1.jpg",
  //     proName: demoList[index].proName,
  //     proPrice: 200,
  //     measureUnit: '/kg',
  //     farmerName: "Sumit",
  //     rating: 4,
  //     productDescrip: "NA",
  //     productImages: [
  //       "assets/fruits/apple1.jpg",
  //       "assets/fruits/apple2.jpg",
  //       "assets/fruits/apple4.jpg"
  //     ]),
  // HomeProduct(
  //     image: "assets/fruits/apple2.jpg",
  //     proName: "Apples",
  //     proPrice: 172,
  //     measureUnit: '/kg',
  //     farmerName: "Punam Khedkar",
  //     rating: 4,
  //     productDescrip: "Fresh and Tasty to eat",
  //     productImages: [
  //       "assets/fruits/apple1.jpg",
  //       "assets/fruits/apple2.jpg",
  //       "assets/fruits/apple4.jpg"
  //     ]),
  // HomeProduct(
  //     image: "assets/fruits/apple3.jpg",
  //     proName: "Apples",
  //     proPrice: 175,
  //     measureUnit: '/kg',
  //     farmerName: "Sumit Katkar",
  //     rating: 3,
  //     productDescrip: "Fresh and Tasty to eat",
  //     productImages: [
  //       "assets/fruits/apple1.jpg",
  //       "assets/fruits/apple2.jpg",
  //       "assets/fruits/apple4.jpg"
  //     ]),
  // HomeProduct(
  //     image: "assets/fruits/apple.jpg",
  //     proName: "Apples",
  //     proPrice: 168,
  //     measureUnit: '/kg',
  //     farmerName: "Manasi Jadhav",
  //     rating: 3,
  //     productDescrip: "Fresh and Tasty to eat",
  //     productImages: [
  //       "assets/fruits/apple1.jpg",
  //       "assets/fruits/apple2.jpg",
  //       "assets/fruits/apple4.jpg"
  //     ]),
  // HomeProduct(
  //     image: "assets/fruits/apple4.jpg",
  //     proName: "Apples",
  //     proPrice: 171,
  //     measureUnit: '/kg',
  //     farmerName: "Punam Khedkar",
  //     rating: 3,
  //     productDescrip: "Fresh and Tasty to eat",
  //     productImages: [
  //       "assets/fruits/apple1.jpg",
  //       "assets/fruits/apple2.jpg",
  //       "assets/fruits/apple4.jpg"
  //     ]),
  // HomeProduct(
  //     image: "assets/fruits/apple5.jpg",
  //     proName: "Apples",
  //     proPrice: 169,
  //     measureUnit: '/kg',
  //     farmerName: "Sumit Katkar",
  //     rating: 4,
  //     productDescrip: "Fresh and Tasty to eat",
  //     productImages: [
  //       "assets/fruits/apple1.jpg",
  //       "assets/fruits/apple2.jpg",
  //       "assets/fruits/apple4.jpg"
  //     ]),
  // HomeProduct(
  //     image: "assets/fruits/apple6.jpg",
  //     proName: "Apples",
  //     proPrice: 170,
  //     measureUnit: '/kg',
  //     farmerName: "Manasi Jadhav",
  //     rating: 4,
  //     productDescrip: "Fresh and Tasty to eat",
  //     productImages: [
  //       "assets/fruits/apple1.jpg",
  //       "assets/fruits/apple2.jpg",
  //       "assets/fruits/apple4.jpg"
  //     ]),
];

class ApplePage extends StatefulWidget {
  const ApplePage({super.key});

  @override
  State<ApplePage> createState() => _ApplePage();
}

class _ApplePage extends State<ApplePage> {
  // Initialize the isFavorited list with false for each product card
  late List<bool> isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = List.generate(appleList.length, (index) => false);
    Future.delayed(Duration.zero, () async {
      await getMyProductsCategory("Apples");

      setState(() {});
    });
  }

  // // Function to handle the favorite toggle
  // void toggleFavorite(int index) {
  //   setState(() {
  //     isFavorited[index] = !isFavorited[index];
  //   });
  // }

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

  int currentPage = 0;

  void addToBasket(HomeProduct product) {
    setState(() {
      basketProductCards.add(product);
    });
  }

  void addToIndividualPage(HomeProduct product) {
    setState(() {
      individualItem.clear();
      individualItem.add(product);
    });
  }

//  void addToWishlist(HomeProduct product) {
//   setState(() {
//     wishlistProductCards.add(product);
//   });
// }

  @override
  Widget build(BuildContext context) {
    log("App listy: $appleList");
    return Scaffold(
      body: CustomScrollView(slivers: [
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
            preferredSize: const Size.fromHeight(80),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
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
                                "Apples",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 26, 77, 28),
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              HomeProduct product = appleList[index];
              log("Apple lsit: ${appleList.toString()}");
              bool isFavorited = isProductFavorited(product);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    print("My Index number is $index");
                    addToIndividualPage(product);
                    globalIndex = index;
                    print("helo");
                    print("The GlobalIndex is :$globalIndex");
                    indexforbuynow = index;
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const ProductIndividualPage();
                    }));
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              product.image!,
                              height: 80,
                              width: 110,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    appleList[index].proName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        "₹${appleList[index].proPrice}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          addToBasket(appleList[index]);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  '${appleList[index].proName} added to basket!'),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 22,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Add",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                              icon: Icon(
                                isFavorited
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorited ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                toggleFavorite(product);
                                //addToWishlist(productCards[index]);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        '${appleList[index].proName} added to wishlist!'),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: appleList.length,
          ),
        ),
      ]),
    );
  }
}
