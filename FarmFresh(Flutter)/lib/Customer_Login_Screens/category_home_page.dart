import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/EggsPage.dart';
import 'package:language_page/Customer_Login_Screens/FruitsPage.dart';
import 'package:language_page/Customer_Login_Screens/GrainsPage.dart';
import 'package:language_page/Customer_Login_Screens/MilkHomePage.dart';
import 'package:language_page/Customer_Login_Screens/PreOrder.dart';
import 'package:language_page/Customer_Login_Screens/Category_Product_model.dart';
import 'package:language_page/Customer_Login_Screens/VegetablesPage.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryHomePage extends StatefulWidget {
  const CategoryHomePage({super.key});
  @override
  State<CategoryHomePage> createState() => _CategoryHomePage();
}

class _CategoryHomePage extends State<CategoryHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
              title:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  SizedBox(width: 15),
                  FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Category"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Category", style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 26, 77, 28),
                                          fontSize: 20,
                                        ),);
              },
            ),
                  // Text(
                  //   "Category",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     color: Color.fromARGB(255, 26, 77, 28),
                  //     fontSize: 20,
                  //   ),
                  // ),
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return ProductSearchApp();
                            }));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            height: 45,
                            width: 270,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.green, width: 2.5),
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
                                const Icon(Icons.search, size: 20, color: Colors.black),
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
                                          color: Colors.grey, // Subtle color for placeholder effect
                                        ),
                                        speed: const Duration(milliseconds: 100), // Speed of each letter
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
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    //container1
                    const SizedBox(height: 10),

                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const PreorderApp();
                        }));
                        setState(() {});
                      },
                      child: Container(
                        height: 200,
                        width: 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                            //border: Border.all(color: Colors.green, width: 2),
                            boxShadow: [
                              const BoxShadow(
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 10,
                                  color: Colors.green),
                            ]),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            // Base image
                            Positioned.fill(
                              child: Image.asset(
                                "assets/preorder.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Gradient overlay for blending
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.transparent,
                                      Colors.green.withOpacity(0.8),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                             Row(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 210, top: 100)),
                                        FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Pre-order"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Pre-order", style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.right,
                                        );
              },
            ),
                                // Text(
                                //   "Pre-order",
                                //   style: TextStyle(
                                //       fontSize: 24,
                                //       fontWeight: FontWeight.w500,
                                //       color: Colors.white),
                                //   textAlign: TextAlign.right,
                                // ),
                              ],
                            ),
                             Row(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 190, top: 180)),
                                FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Enter Category"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Enter Category", style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.right,
                                        );
              },
            ),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //container3
                    const SizedBox(height: 10),

                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const FruitsApp();
                        }));
                        setState(() {});
                      },
                      child: Container(
                        height: 200,
                        width: 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                            boxShadow: [
                              const BoxShadow(
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 10,
                                  color: Colors.green),
                            ]),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            // Base image
                            Positioned.fill(
                              child: Image.asset(
                                "assets/fruits.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Gradient overlay for blending
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.transparent,
                                      Colors.green.withOpacity(0.8),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                             Row(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 230, top: 100)),
                                         FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Fruits"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Fruits", style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.right,
                                        );
              },
            ),
                                // Text(
                                //   "Fruits",
                                //   style: TextStyle(
                                //       fontSize: 24,
                                //       fontWeight: FontWeight.w500,
                                //       color: Colors.white),
                                //   textAlign: TextAlign.right,
                                // ),
                              ],
                            ),
                             Row(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 190, top: 180)),
                                FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Enter Category"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Enter Category", style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.right,
                                        );
              },
            ),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    //container3
                    const SizedBox(height: 10),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const VegetablesApp();
                        }));
                        setState(() {});
                      },
                      child: Container(
                        height: 200,
                        width: 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                            boxShadow: [
                              const BoxShadow(
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 10,
                                  color: Colors.green),
                            ]),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            // Base image
                            Positioned.fill(
                              child: Image.asset(
                                "assets/vegetables.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Gradient overlay for blending
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.transparent,
                                      Colors.green.withOpacity(0.8),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                             Row(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 200, top: 100)),
                                 FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Vegetables"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Vegetables", style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.right,
                                        );
              },
            ),
                              ],
                            ),
                             Row(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 190, top: 180)),
                                FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Enter Category"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Enter Category", style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.right,
                                        );
              },
            ),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //container4
                    const SizedBox(height: 10),

                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const GrainsApp();
                        }));
                        setState(() {});
                      },
                      child: Container(
                        height: 200,
                        width: 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                            boxShadow: [
                              const BoxShadow(
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 10,
                                  color: Colors.green),
                            ]),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            // Base image
                            Positioned.fill(
                              child: Image.asset(
                                "assets/grains.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Gradient overlay for blending
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.transparent,
                                      Colors.green.withOpacity(0.8),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                             Row(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 220, top: 100)),
                                 FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Grains"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Grains", style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.right,
                                        );
              },
            ),
                              ],
                            ),
                             Row(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 190, top: 180)),
                                FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Enter Category"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Enter Category", style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.right,
                                        );
              },
            ),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //container5
                    const SizedBox(height: 10),

                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const EggsApp();
                        }));
                        setState(() {});
                      },
                      child: Container(
                        height: 200,
                        width: 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              const BoxShadow(
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 10,
                                  color: Colors.green),
                            ]),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            // Base image
                            Positioned.fill(
                              child: Image.asset(
                                "assets/eggsHome.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Gradient overlay for blending
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.transparent,
                                      Colors.green.withOpacity(0.8),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                             Row(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 230, top: 100)),
                                 FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Eggs"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Eggs", style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.right,
                                        );
              },
            ),
                              ],
                            ),
                             Row(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 190, top: 180)),
                                FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Enter Category"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Enter Category", style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.right,
                                        );
              },
            ),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //container6
                    const SizedBox(height: 10),

                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const MilkHomeApp();
                        }));
                        setState(() {});
                      },
                      child: Container(
                        height: 200,
                        width: 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                            boxShadow: [
                              const BoxShadow(
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 10,
                                  color: Colors.green),
                            ]),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            // Base image
                            Positioned.fill(
                              child: Image.asset(
                                "assets/milk.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Gradient overlay for blending
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.transparent,
                                      Colors.green.withOpacity(0.8),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                             Row(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 235, top: 100)),
                                 FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Milk"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Milk", style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.right,
                                        );
              },
            ),
                              ],
                            ),
                             Row(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 190, top: 180)),
                                         FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Enter Category"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Enter Category", style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.right,
                                        );
              },
            ),
                                // Text(
                                //   "Enter Category",
                                //   style: TextStyle(
                                //       fontSize: 18,
                                //       fontWeight: FontWeight.w500,
                                //       color: Colors.white),
                                //   textAlign: TextAlign.right,
                                // ),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
      //bottomNavigationBar: const NavBarPage(),
    );
  }
}




// List combining products from all 6 categories
List<Product> allProducts = [
  //Fruits category 
  Product(image: "assets/fruits/apple.jpg", proName: "Apple"),
    Product(image: "assets/fruits/banana.jpg", proName: "Banana"),
    Product(image: "assets/fruits/blackberry.jpg", proName: "Blackberry"),
    Product(image: "assets/fruits/blueberry.jpg", proName: "Blueberry"),
    Product(image: "assets/fruits/cherry.jpg", proName: "Cherry"),
    Product(image: "assets/fruits/chiku.jpeg", proName: "Chiku"),
    Product(image: "assets/fruits/dates.jpg", proName: "Dates"),
    Product(image: "assets/fruits/dryfruits.jpg", proName: "Dryfruits"),
    Product(image: "assets/fruits/fig.jpg", proName: "Fig"),
    Product(image: "assets/fruits/grape fruit.jpg", proName: "Grape Fruit"),
    Product(image: "assets/fruits/grapes.jpeg", proName: "Grapes"),
    Product(image: "assets/fruits/green apple.jpg", proName: "Green Apple"),
    Product(image: "assets/fruits/guava.webp", proName: "Guava"),
    Product(image: "assets/fruits/kivi.jpg", proName: "Kivi"),
    Product(image: "assets/fruits/mango.jpg", proName: "Mango"),
    Product(image: "assets/fruits/muskmelon.jpg", proName: "Muskmelon"),
    Product(image: "assets/fruits/orange.jpg", proName: "Orange"),
    Product(image: "assets/fruits/papaya.jpg", proName: "Papaya"),
    Product(image: "assets/fruits/peach.jpg", proName: "Peach"),
    Product(image: "assets/fruits/pear.jpg", proName: "Pear"),
    Product(image: "assets/fruits/pineapple.jpg", proName: "Pineapple"),
    Product(image: "assets/fruits/pomygraned.jpg", proName: "Pomegranate"),
    Product(image: "assets/fruits/raspberry.jpg", proName: "Raspberry"),
    Product(
        image: "assets/fruits/red dragon fruit.jpeg",
        proName: "Red Dragonfruit"),
    Product(image: "assets/fruits/red grapes.jpg", proName: "Red Grapes"),
    Product(image: "assets/fruits/strawberry.jpg", proName: "Strawberry"),
    Product(image: "assets/fruits/tangerine.jpg", proName: "Tangerine"),
    Product(
        image: "assets/fruits/white dragonfruit.jpg", proName: "Dragonfruit"),


  //Vegetable category
   Product(image: "assets/vegetables/onion.jpg", proName: "Onion"),
    Product(image: "assets/vegetables/potato.jpg", proName: "Potato"),
    Product(image: "assets/vegetables/tomato.jpg", proName: "Tomato"),
    Product(
        image: "assets/vegetables/coriender leaves.jpg",
        proName: "Coriander Leave"),
    Product(image: "assets/vegetables/capsicum.jpg", proName: "Capsicum"),
    Product(image: "assets/vegetables/carrots.jpg", proName: "Carrots"),
    Product(
        image: "assets/vegetables/green chilies.jpg",
        proName: "Green Chillies"),
    Product(image: "assets/vegetables/lady finger.jpg", proName: "Lady Finger"),
    Product(image: "assets/vegetables/lemons.jpg", proName: "Lemons"),
    Product(image: "assets/vegetables/mint .jpg", proName: "Mint"),
    Product(image: "assets/vegetables/cabbage.jpg", proName: "Cabbage"),
    Product(image: "assets/vegetables/cucumber.jpg", proName: "Cucumber"),
    Product(
        image: "assets/vegetables/green onions.jpg", proName: "Green Onions"),
    Product(image: "assets/vegetables/cauliflower.jpg", proName: "Cauliflower"),
    Product(image: "assets/vegetables/spinach.jpg", proName: "Spinach"),
    Product(
        image: "assets/vegetables/red chilies.webp", proName: "Red Chillies"),
    Product(image: "assets/vegetables/sweet corn.webp", proName: "Sweet Corn"),
    Product(image: "assets/vegetables/avocado.jpg", proName: "Avocado"),
    Product(image: "assets/vegetables/fenugreek.jpg", proName: "Fenugreek"),
    Product(image: "assets/vegetables/garlic.jpg", proName: "Garlic"),
    Product(image: "assets/vegetables/ginger.jpg", proName: "Ginger"),
    Product(image: "assets/vegetables/mushrooms.jpg", proName: "Mushrooms"),
    Product(image: "assets/vegetables/peanuts.jpg", proName: "Peanuts"),
    Product(
        image: "assets/vegetables/baby tomatos.jpg", proName: "Baby Tomatos"),
    Product(image: "assets/vegetables/bitroot.jpg", proName: "Beetroot"),
    Product(
        image: "assets/vegetables/bitter gourd.webp", proName: "Bitter Gourd"),
    Product(image: "assets/vegetables/broccoli.jpg", proName: "Broccoli"),
    Product(
        image: "assets/vegetables/chinese cabbage.webp",
        proName: "Napa Cabbage"),
    Product(
        image: "assets/vegetables/colored capsicum.jpg", proName: "Capsicum"),
    Product(
        image: "assets/vegetables/garlic-chives.webp",
        proName: "Garlic Chives"),
    Product(
        image: "assets/vegetables/green-luffa.webp", proName: "Green Luffa"),
    Product(image: "assets/vegetables/lettus.jpg", proName: "Lettus"),
    Product(
        image: "assets/vegetables/long brijals.webp", proName: "Long Brijals"),
    Product(
        image: "assets/vegetables/mini green tomato.webp",
        proName: "Green Tomato"),
    Product(image: "assets/vegetables/peas.jpg", proName: "Peas"),
    Product(image: "assets/vegetables/pumpkin.jpg", proName: "Pumpkin"),
    Product(image: "assets/vegetables/raddish.jpg", proName: "Raddish"),
    Product(
        image: "assets/vegetables/red cabbage.webp", proName: "Red Cabbage"),
    Product(image: "assets/vegetables/suger cane.webp", proName: "Sugarcane"),
    Product(
        image: "assets/vegetables/sweet-potato.webp", proName: "Sweet Potato"),
    Product(image: "assets/vegetables/tamarind.webp", proName: "Tamarind"),
    Product(image: "assets/vegetables/zucchini.webp", proName: "Zucchini"),

  //Grains category 
   Product(image: "assets/grains/rice.jpeg", proName: "Rice"),
    Product(image: "assets/grains/wheat.jpeg", proName: "Wheat"),
    Product(image: "assets/grains/bajra.jpeg", proName: "Bajra"),
    Product(image: "assets/grains/jawar.webp", proName: "Jawar"),
    Product(image: "assets/grains/brown rice.png", proName: "Brown Rice"),
    Product(
        image: "assets/grains/black turtle bean.png", proName: "Turtle Bean"),
    Product(
        image: "assets/grains/black-urad-dal.webp", proName: "Black Udad Dal"),
    Product(image: "assets/grains/buckwheat.webp", proName: "Buck Wheat"),
    Product(image: "assets/grains/cheakpeas.png", proName: "Cheakpeas"),
    Product(image: "assets/grains/chiaseeds.png", proName: "Chiaseeds"),
    Product(
        image: "assets/grains/cranberry beans.png", proName: "Cranberry Beans"),
    Product(image: "assets/grains/cumin-seeds.webp", proName: "Cumin Seeds"),
    Product(
        image: "assets/grains/fenugreek-seeds.webp", proName: "Fenugreek seed"),
    Product(image: "assets/grains/flax-seed.webp", proName: "Flax Seed"),
    Product(
        image: "assets/grains/jamaica-pepper.webp", proName: "Jamaica Pepper"),
    Product(image: "assets/grains/kidney beans.png", proName: "Kidney Beans"),
    Product(image: "assets/grains/millet seeds.webp", proName: "Millet Seeds"),
    Product(image: "assets/grains/navy beans.png", proName: "Navy Beans"),
    Product(image: "assets/grains/oats.webp", proName: "Oats"),
    Product(image: "assets/grains/pigeon pea.png", proName: "Pigeon Pea"),
    Product(image: "assets/grains/pumpkin seed.png", proName: "Pumpkin Seed"),
    Product(
        image: "assets/grains/raw-rice-flakes.webp",
        proName: "Raw Rice Flakes"),
    Product(image: "assets/grains/sesame seeds.png", proName: "Sesame Seeds"),
    Product(
        image: "assets/grains/sunflower seeds.png", proName: "Sunflower Seed"),
    Product(image: "assets/grains/white beans.png", proName: "White Beans"),
 
    Product(image: "assets/eggs/eggs.jpg", proName: "Normal Eggs"),
    Product(
        image: "assets/eggs/white egg shell.jpg", proName: "White Shell Egg"),
    Product(
        image: "assets/eggs/brown shell eggs.jpg", proName: "Brown Shell Egg"),
    Product(image: "assets/eggs/organic eggs.jpg", proName: "Organic Eggs"),
    Product(image: "assets/eggs/hybrid eggs.jpg", proName: "Hybrid Eggs"),


  // Milk category products
  Product(image: "assets/milk/buffalo milk.jpeg", proName: "Buffalo Milk"),
  Product(image: "assets/milk/cow milk.jpeg", proName: "Cow Milk"),
  Product(image: "assets/milk/goat milk.jpeg", proName: "Goat Milk"),
  Product(image: "assets/milk/raw milk.jpeg", proName: "Raw Milk"),
  Product(image: "assets/milk/almond milk.jpg", proName: "Almond Milk"),
  Product(image: "assets/milk/coconutmilk.jpg", proName: "Coconut Milk"),
  Product(image: "assets/milk/soy milk.jpg", proName: "Soy Milk"),

  // Dairy products category products
  Product(image: "assets/milk/milk_products/butter.jpg", proName: "Butter"),
  Product(image: "assets/milk/milk_products/cheddar cheese.jpg", proName: "Cheese"),
  Product(image: "assets/milk/milk_products/cream.jpg", proName: "Cream"),
  Product(image: "assets/milk/milk_products/malai.jpg", proName: "Malai"),
  Product(image: "assets/milk/milk_products/powdered milk.jpg", proName: "Powdered Milk"),
  Product(image: "assets/milk/milk_products/sour cream.jpg", proName: "Sour Cream"),
  Product(image: "assets/milk/milk_products/yogurt.jpg", proName: "Yogurt"),
  Product(image: "assets/milk/milk_products/paneer.jpg", proName: "Paneer"),

];

class ProductSearchApp extends StatefulWidget {
  const ProductSearchApp({super.key});

  @override
  State<ProductSearchApp> createState() => _ProductSearchApp();
}

class _ProductSearchApp extends State<ProductSearchApp> {
  List<Product> filteredProducts = allProducts;
  TextEditingController _searchController = TextEditingController();
  List<String> recentSearches = [];
  SharedPreferences? prefs;

  // Function to filter products based on search query
  void _filterProducts(String query) {
    setState(() {
      filteredProducts = allProducts
          .where((product) =>
              product.proName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // Function to load recent searches from SharedPreferences
  void _loadRecentSearches() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      recentSearches = prefs?.getStringList('recent_searches') ?? [];
    });
  }

  // Function to save a recent search
  void _saveRecentSearch(String query) async {
    if (!recentSearches.contains(query)) {
      recentSearches.add(query);
      prefs?.setStringList('recent_searches', recentSearches);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadRecentSearches();
    _searchController.addListener(() {
      // We don't store the input in recent searches until Enter is pressed
      _filterProducts(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Search Products'),
      //   backgroundColor: Colors.green,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              cursorColor: Colors.green,
              autofocus: true,  // Auto focus the search bar
              decoration: InputDecoration(
                labelText: 'Search Products',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2),
            ),
              ),
              // Save query to recent searches only when Enter key is pressed
              onSubmitted: (query) {
                _saveRecentSearch(query);  // Save only when the user presses Enter
                _filterProducts(query);     // Filter the products based on the query
              },
            ),
          ),

          // Recent Search History
          if (recentSearches.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Recent Searches"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Recent Searches", style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                  // textAlign: TextAlign.right,
                                        );
              },
            ),
                  // const Text(
                  //   "Recent Searches",
                  //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 15),
                  // ),
                  ...recentSearches.map((search) {
                    return GestureDetector(
                      onTap: () {
                        _searchController.text = search;
                        _filterProducts(search);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Icon(Icons.history, size: 20,),
                            SizedBox(width: 4,),
                            Text(search,style: TextStyle(fontSize: 15),),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

          // Display filtered products
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor: Colors.green,
                  elevation: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        filteredProducts[index].image,
                        height: 65,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 10),
                      FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText(filteredProducts[index].proName),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? filteredProducts[index].proName, style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                     ),
                                  // textAlign: TextAlign.right,
                                        );
              },
            ),
                      // Text(
                      //   filteredProducts[index].proName,
                      //   style: const TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ],
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