import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/Category_Product_model.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';

class EggsApp extends StatefulWidget {
  const EggsApp({super.key});

  @override
  State<EggsApp> createState() => _EggsApp();
}

class _EggsApp extends State<EggsApp> {
  List<Product> productCards = [
    Product(image: "assets/eggs/eggs.jpg", proName: "Normal Eggs"),
    Product(
        image: "assets/eggs/white egg shell.jpg", proName: "White Shell Egg"),
    Product(
        image: "assets/eggs/brown shell eggs.jpg", proName: "Brown Shell Egg"),
    Product(image: "assets/eggs/hybrideggs.jpg", proName: "Organic Eggs"),
    Product(image: "assets/eggs/organiceggs.jpg", proName: "Hybrid Eggs"),
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
              future: context.read<LanguageProvider>().translateText( "Eggs"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Eggs", style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                           color: Color.fromARGB(255, 26, 77, 28),
                                          fontSize: 25,
                                        ),);
              },
            ),
                              // Text(
                              //   "Eggs",
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
                return Container(
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
              future: context.read<LanguageProvider>().translateText( productCards[index].proName),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? productCards[index].proName , style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          
                                          fontSize: 13,
                                        ),);
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
