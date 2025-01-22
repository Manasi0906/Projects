import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/Category_Product_model.dart';
import 'package:language_page/Customer_Login_Screens/apple.dart';
import 'package:language_page/Customer_Login_Screens/mango.dart';
import 'package:language_page/Customer_Login_Screens/rice.dart';
import 'package:language_page/Customer_Login_Screens/tomato.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';

class FruitsApp extends StatefulWidget {
  const FruitsApp({super.key});

  @override
  State<FruitsApp> createState() => _FruitsApp();
}

class _FruitsApp extends State<FruitsApp> {
  List<Product> productCards = [
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
                                future: context
                                    .read<LanguageProvider>()
                                    .translateText("Fruits"),
                                builder: (context, snapshot) {
                                  return Text(
                                    snapshot.data ?? "Fruits",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 26, 77, 28),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // textAlign: TextAlign.right,
                                  );
                                },
                              ),
                              // Text(
                              //   "Fruits",
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
                    // Check if the tapped card corresponds to "Apple"
                    if (productCards[index].proName == "Apple" ||
                        productCards[index].proName == "Apples" ||
                        productCards[index].proName == "apple" ||
                        productCards[index].proName == "apples") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ApplePage(); // Navigate only for ApplePage
                          },
                        ),
                      );
                    } else if (productCards[index].proName == "Mango" ||
                        productCards[index].proName == "Mangoes" ||
                        productCards[index].proName == "mango" ||
                        productCards[index].proName == "mangoes") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MangoPage();
                          },
                        ),
                      );
                    }
                    //else if(productCards[index].proName == "Tomato"||productCards[index].proName == "Tomatoes"||productCards[index].proName == "tomato"||productCards[index].proName == "tomatoes"){
                    //    Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) {
                    //         return TomatoPage();
                    //       },
                    //     ),
                    //   );
                    // }else if(productCards[index].proName == "rice"||productCards[index].proName == "Rice"||productCards[index].proName == "rices"||productCards[index].proName == "Rices"){
                    //    Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) {
                    //         return Ricepage();
                    //       },
                    //     ),
                    //   );
                    // }
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
                          future: context
                              .read<LanguageProvider>()
                              .translateText(productCards[index].proName),
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.data ?? productCards[index].proName,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                              // textAlign: TextAlign.right,
                            );
                          },
                        ),
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
    );
  }
}
