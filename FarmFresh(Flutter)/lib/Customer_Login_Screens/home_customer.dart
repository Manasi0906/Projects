import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:language_page/Customer_Login_Screens/Basket.dart';
import 'package:language_page/Customer_Login_Screens/Notification.dart';
import 'package:language_page/Customer_Login_Screens/Product_individual.dart';

import 'package:language_page/Customer_Login_Screens/category_home_page.dart';
import 'package:language_page/Customer_Login_Screens/home_product_model.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:language_page/FarmerLogin_Screens/uploadPage.dart';
import 'package:language_page/Login_Signup_Screen/Login_page.dart';
import 'package:language_page/Login_Signup_Screen/signup_Customer.dart';

List<HomeProduct> recentlyProductCards = [
  HomeProduct(
      image: "assets/grains/brown rice.png",
      proName: "Brown Rice",
      proPrice: 170,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/grains/brown rice.png",
        "assets/grains/brown rice.png",
        "assets/grains/brown rice.png",
      ]),
  HomeProduct(
      image: "assets/vegetables/green onions.jpg",
      proName: "Green Onions",
      proPrice: 40,
      measureUnit: '/bunch',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/vegetables/green onions.jpg",
        "assets/vegetables/green onions.jpg",
        "assets/vegetables/green onions.jpg",
      ]),
  HomeProduct(
      image: "assets/milk/buffalo milk.jpeg",
      proName: "Buffalo Milk",
      proPrice: 60,
      measureUnit: '/l',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/milk/buffalo milk.jpeg",
        "assets/milk/buffalo milk.jpeg",
        "assets/milk/buffalo milk.jpeg",
      ]),
  HomeProduct(
      image: "assets/fruits/red grapes.jpg",
      proName: "Red Grapes",
      proPrice: 50,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/fruits/red grapes.jpg",
        "assets/fruits/red grapes.jpg",
        "assets/fruits/red grapes.jpg",
      ]),
  HomeProduct(
      image: "assets/vegetables/lemons.jpg",
      proName: "Lemons",
      proPrice: 45,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/vegetables/lemons.jpg",
        "assets/vegetables/lemons.jpg",
        "assets/vegetables/lemons.jpg",
      ]),
  HomeProduct(
      image: "assets/vegetables/coriender leaves.jpg",
      proName: "Coriender Leaves",
      proPrice: 20,
      measureUnit: '/bunch',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/vegetables/coriender leaves.jpg",
        "assets/vegetables/coriender leaves.jpg",
        "assets/vegetables/coriender leaves.jpg",
      ]),
  HomeProduct(
      image: "assets/grains/cumin-seeds.webp",
      proName: "Cumin seeds",
      proPrice: 67,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/grains/cumin-seeds.webp",
        "assets/grains/cumin-seeds.webp",
        "assets/grains/cumin-seeds.webp",
      ]),
  HomeProduct(
      image: "assets/fruits/dates.jpg",
      proName: "Dates",
      proPrice: 60,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/fruits/dates.jpg",
        "assets/fruits/dates.jpg",
        "assets/fruits/dates.jpg",
      ]),
];

List<HomeProduct> mostlyProductCards = [
  HomeProduct(
      image: "assets/vegetables/lady finger.jpg",
      proName: "Lady Finger",
      proPrice: 20,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/vegetables/lady finger.jpg",
        "assets/vegetables/lady finger.jpg",
        "assets/vegetables/lady finger.jpg",
      ]),
  HomeProduct(
      image: "assets/grains/rice.jpeg",
      proName: "Rice",
      proPrice: 140,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/grains/rice.jpeg",
        "assets/grains/rice.jpeg",
        "assets/grains/rice.jpeg",
      ]),
  HomeProduct(
      image: "assets/vegetables/capsicum.jpg",
      proName: "Capsicum",
      proPrice: 25,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/vegetables/capsicum.jpg",
        "assets/vegetables/capsicum.jpg",
        "assets/vegetables/capsicum.jpg",
      ]),
  HomeProduct(
      image: "assets/milk/milk_products/cream.jpg",
      proName: "Cream",
      proPrice: 86,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/milk/milk_products/cream.jpg",
        "assets/milk/milk_products/cream.jpg",
        "assets/milk/milk_products/cream.jpg",
      ]),
  HomeProduct(
      image: "assets/grains/jawar.webp",
      proName: "Jawar",
      proPrice: 87,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/grains/jawar.webp",
        "assets/grains/jawar.webp",
        "assets/grains/jawar.webp",
      ]),
  HomeProduct(
      image: "assets/vegetables/green calabash.webp",
      proName: "Calabash",
      proPrice: 30,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/vegetables/green calabash.webp",
      ]),
  HomeProduct(
      image: "assets/fruits/white dragonfruit.jpg",
      proName: "Dragonfruit",
      proPrice: 180,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/fruits/white dragonfruit.jpg",
      ]),
  HomeProduct(
      image: "assets/milk/milk_products/powdered milk.jpg",
      proName: "Powdered milk",
      proPrice: 70,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/milk/milk_products/powdered milk.jpg",
        "assets/milk/milk_products/powdered milk.jpg",
      ]),
];

List<HomeProduct> preorderCards = [
  HomeProduct(
      image: "assets/vegetables/cucumber.jpg",
      proName: "Cucumber",
      proPrice: 20,
      measureUnit: '/kg',
      days: 1,
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/vegetables/cucumber.jpg",
        "assets/vegetables/cucumber.jpg",
        "assets/vegetables/cucumber.jpg",
      ]),
  HomeProduct(
      image: "assets/fruits/orange.jpg",
      proName: "Orange",
      proPrice: 40,
      measureUnit: '/kg',
      days: 1,
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/fruits/orange.jpg",
        "assets/fruits/orange.jpg",
      ]),
  HomeProduct(
      image: "assets/milk/milk_products/yogurt.jpg",
      proName: "Yogurt",
      proPrice: 56,
      measureUnit: '/l',
      days: 2,
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/milk/milk_products/yogurt.jpg",
        "assets/milk/milk_products/yogurt.jpg",
      ]),
  HomeProduct(
      image: "assets/eggs/white egg shell.jpg",
      proName: "White Shell Egg",
      proPrice: 10,
      measureUnit: '/item',
      days: 3,
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/eggs/white egg shell.jpg",
        "assets/eggs/white egg shell.jpg",
        "assets/eggs/white egg shell.jpg",
      ]),
  HomeProduct(
      image: "assets/grains/jawar.webp",
      proName: "Jawar",
      proPrice: 130,
      measureUnit: '/kg',
      days: 3,
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/grains/jawar.webp",
        "assets/grains/jawar.webp",
        "assets/grains/jawar.webp",
      ]),
  HomeProduct(
      image: "assets/vegetables/cabbage.jpg",
      proName: "Cabbage",
      proPrice: 20,
      measureUnit: '/kg',
      days: 4,
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/vegetables/cabbage.jpg",
        "assets/vegetables/cabbage.jpg",
        "assets/vegetables/cabbage.jpg",
      ]),
];

List<HomeProduct> fruitsandvegetablesCards = [
  HomeProduct(
      image: "assets/vegetables/baby tomatos.jpg",
      proName: "Baby Tomatos",
      proPrice: 30,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/vegetables/baby tomatos.jpg",
        "assets/vegetables/baby tomatos.jpg",
        "assets/vegetables/baby tomatos.jpg",
      ]),
  HomeProduct(
      image: "assets/fruits/grapes.jpeg",
      proName: "Grapes",
      proPrice: 40,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: []),
  HomeProduct(
      image: "assets/vegetables/lady finger.jpg",
      proName: "Lady Finger",
      proPrice: 20,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: []),
  HomeProduct(
      image: "assets/fruits/mango.jpg",
      proName: "Mango",
      proPrice: 270,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: []),
  HomeProduct(
      image: "assets/fruits/peach.jpg",
      proName: "Peach",
      proPrice: 150,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: []),
  HomeProduct(
      image: "assets/vegetables/lettus.jpg",
      proName: "Lettus",
      proPrice: 80,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: []),
  HomeProduct(
      image: "assets/fruits/strawberry.jpg",
      proName: "Strawberry",
      proPrice: 90,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: []),
  HomeProduct(
      image: "assets/vegetables/onion.jpg",
      proName: "Onion",
      proPrice: 50,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: []),
];
List<HomeProduct> grinsandmilkCards = [
  HomeProduct(
      image: "assets/grains/cheakpeas.png",
      proName: "Cheakpeas",
      proPrice: 50,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/grains/cheakpeas.png",
        "assets/grains/cheakpeas.png",
        "assets/grains/cheakpeas.png",
      ]),
  HomeProduct(
      image: "assets/milk/buffalo milk.jpeg",
      proName: "Buffalo milk",
      proPrice: 60,
      measureUnit: '/l',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/milk/buffalo milk.jpeg",
        "assets/milk/buffalo milk.jpeg",
      ]),
  HomeProduct(
      image: "assets/eggs/eggs.jpg",
      proName: "Eggs",
      proPrice: 10,
      measureUnit: '/item',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/eggs/eggs.jpg",
        "assets/eggs/eggs.jpg",
      ]),
  HomeProduct(
      image: "assets/grains/kidney beans.png",
      proName: "Kidney Beans",
      proPrice: 50,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/grains/kidney beans.png",
        "assets/grains/kidney beans.png",
      ]),
  HomeProduct(
      image: "assets/milk/milk_products/butter.jpg",
      proName: "Butter",
      proPrice: 60,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/milk/milk_products/butter.jpg",
        "assets/milk/milk_products/butter.jpg",
      ]),
  HomeProduct(
      image: "assets/milk/cow milk.jpeg",
      proName: "Cow milk",
      proPrice: 70,
      measureUnit: '/l',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/milk/cow milk.jpeg",
      ]),
  HomeProduct(
      image: "assets/grains/pumpkin seed.png",
      proName: "Pumpkin seed",
      proPrice: 60,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/grains/pumpkin seed.png",
        "assets/grains/pumpkin seed.png",
      ]),
  HomeProduct(
      image: "assets/grains/wheat.jpeg",
      proName: "Wheat",
      proPrice: 120,
      measureUnit: '/kg',
      farmerName: "Manasi Jadhav",
      rating: 4,
      productDescrip: "Fresh and Tasty to eat",
      isBasketItem: true,
      productImages: [
        "assets/grains/wheat.jpeg",
        "assets/grains/wheat.jpeg",
      ]),
];

class HomePageApp extends StatefulWidget {
  const HomePageApp({super.key});

  @override
  State<HomePageApp> createState() => _HomePageApp();
}

class _HomePageApp extends State<HomePageApp> {
  void addToIndividualPage(HomeProduct product) {
    setState(() {
      individualItem.clear();
      individualItem.add(product);
    });
  }

  void addToBasket(HomeProduct product) {
    setState(() {
      basketProductCards.add(product);
    });
  }

  void initState() {
    super.initState();
    getSignupCustomerData(CustomerMail!);
    getMyProductsCategory("Apple");
    getMyProducts("Apples");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 120.0,
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
            titlePadding: const EdgeInsets.only(top: 65, left: 20, right: 20),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    const SizedBox(width: 15),
                    // Logo with shadow effect and circular border
                    Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.green),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 1), // Shadow position
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset("assets/farmfresh_logo.jpg",
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "FarmFresh",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 26, 77, 28),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      // Enhanced search bar with a more modern feel
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const ProductSearchApp();
                          }));
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ProductSearchApp();
                            }));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            height: 45,
                            width: 270,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border:
                                  Border.all(color: Colors.green, width: 2.5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                const Icon(Icons.search,
                                    size: 20, color: Colors.black),
                                const SizedBox(width: 15),
                                // Add the AnimatedTextKit for letter-by-letter animation
                                Expanded(
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        "Search for everything",
                                        textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors
                                              .grey, // Subtle color for placeholder effect
                                        ),
                                        speed: const Duration(
                                            milliseconds:
                                                100), // Speed of each letter
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Notification icon with subtle animation effect
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const NotificationPage();
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
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildListDelegate(
            [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Recently Viewed ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 29, 114, 32)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: List.generate(recentlyProductCards.length,
                        (indexRecently) {
                      final product = recentlyProductCards[indexRecently];
                      return Container(
                        margin: const EdgeInsets.only(right: 15),
                        width: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                addToIndividualPage(product);
                                //globalIndex = indexRecently;
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const ProductIndividualPage();
                                  },
                                ));
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.green),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                  product.image!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              product.proName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                                GestureDetector(
                                  onTap: () {
                                    addToBasket(product);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            '${product.proName} added to basket!'),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 22,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.red),
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Add",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),

        ///////Mostly ordered//////////

        SliverList.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Mostly Ordered ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 29, 114, 32)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: List.generate(mostlyProductCards.length,
                            (indexMostly) {
                          final product = mostlyProductCards[indexMostly];
                          return Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    addToIndividualPage(product);
                                    //globalIndex = indexMostly;
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return const ProductIndividualPage();
                                      },
                                    ));
                                  },
                                  child: Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.green),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.asset(
                                      product.image!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  product.proName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
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
                                    GestureDetector(
                                      onTap: () {
                                        addToBasket(product);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                '${product.proName} added to basket!'),
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
/////preorder////

        const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "  Reserve your unripe Treats",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 29, 114, 32),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(8),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 8, // Space between rows
              crossAxisSpacing: 8, // Space between columns
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int indexPreHome) {
                return Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        preorderCards[indexPreHome].image!,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              preorderCards[indexPreHome].proName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "₹${preorderCards[indexPreHome].proPrice}${preorderCards[indexPreHome].measureUnit}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    addToBasket(preorderCards[indexPreHome]);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            '${preorderCards[indexPreHome].proName} added to basket!'),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 22,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.red),
                                      borderRadius: BorderRadius.circular(5),
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
                            const SizedBox(height: 8),
                            Text(
                              "Available in ${preorderCards[indexPreHome].days} days",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: preorderCards.length,
            ),
          ),
        ),
        ///////////Fruits and Vegetables/////////
        SliverList.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Fruits and Vegetables",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 29, 114, 32)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: List.generate(fruitsandvegetablesCards.length,
                            (indexFruVeg) {
                          final product = fruitsandvegetablesCards[indexFruVeg];
                          return Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    addToIndividualPage(product);
                                    //globalIndex = indexFruVeg;
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return const ProductIndividualPage();
                                      },
                                    ));
                                  },
                                  child: Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.green),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.asset(
                                      product.image!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  product.proName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
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
                                    GestureDetector(
                                      onTap: () {
                                        addToBasket(product);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                '${product.proName} added to basket!'),
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        /////Fruits and Vegetables/////////
        SliverList.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Grains, Milk and Eggs",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 29, 114, 32)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: List.generate(grinsandmilkCards.length,
                            (indexMilkGrain) {
                          final product = grinsandmilkCards[indexMilkGrain];
                          return Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    addToIndividualPage(product);
                                    //globalIndex = indexMilkGrain;
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return const ProductIndividualPage();
                                      },
                                    ));
                                  },
                                  child: Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.green),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.asset(
                                      product.image!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  product.proName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
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
                                    GestureDetector(
                                      onTap: () {
                                        addToBasket(product);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                '${product.proName} added to basket!'),
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          },
        ),
      ]),

      // bottomNavigationBar: const NavBarPage()
    );
  }
}
