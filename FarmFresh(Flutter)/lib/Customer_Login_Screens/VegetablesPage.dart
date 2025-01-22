import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/Category_Product_model.dart';
import 'package:language_page/Customer_Login_Screens/tomato.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';

class VegetablesApp extends StatefulWidget {
  const VegetablesApp({super.key});

  @override
  State<VegetablesApp> createState() => _VegetablesApp();
}

class _VegetablesApp extends State<VegetablesApp> {
  List<Product> productCards = [
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
  ];

  @override
  Widget build(BuildContext context) {
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

              //titlePadding: const EdgeInsets.only(top: 70, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 15),
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
                              FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Vegetables"),
              builder: (context, snapshot) {
                return Text(snapshot.data ??"Vegetables", style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 26, 77, 28),));
              },
            ),
                              // Text(
                              //   "Vegetables",
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     color: Color.fromARGB(255, 26, 77, 28),
                              //     fontSize: 25,
                              //   ),
                              // ),
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
        SliverPadding(
          padding: EdgeInsets.all(7),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of cards in a row
              childAspectRatio: 1, // Aspect ratio of the cards
              crossAxisSpacing: 7, // Space between the cards horizontally
              mainAxisSpacing: 7, // Space between the cards vertically
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (productCards[index].proName == "Tomato" ||
                        productCards[index].proName == "Tomatoes" ||
                        productCards[index].proName == "tomato" ||
                        productCards[index].proName == "tomatoes") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TomatoPage();
                          },
                        ),
                      );
                    } else {}
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          productCards[index].image,
                          height: 65, // Adjust height to fit your design
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 10),
                        FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText(productCards[index].proName),
              builder: (context, snapshot) {
                return Text(snapshot.data ??productCards[index].proName , style:const TextStyle(fontSize: 13,fontWeight: FontWeight.bold));
              },
            ),
                        // Text(
                        //   productCards[index].proName,
                        //   style: const TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              },
              childCount: productCards.length, // Number of items in the grid
            ),
          ),
        )
      ]),
      //bottomNavigationBar: const NavBarPage(),
    );
  }
}
