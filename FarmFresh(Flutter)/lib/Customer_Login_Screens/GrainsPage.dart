import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/Category_Product_model.dart';
import 'package:language_page/Customer_Login_Screens/rice.dart';
import 'package:language_page/Customer_Login_Screens/tomato.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';

class GrainsApp extends StatefulWidget {
  const GrainsApp({super.key});

  @override
  State<GrainsApp> createState() => _GrainsApp();
}

class _GrainsApp extends State<GrainsApp> {
  List<Product> productCards = [
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
              future: context.read<LanguageProvider>().translateText("Grains"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Grains", style: TextStyle(
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 26, 77, 28),
                                      fontWeight: FontWeight.bold,
                                     ),
                                  // textAlign: TextAlign.right,
                                        );
              },
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
                    if (productCards[index].proName == "rice" ||
                        productCards[index].proName == "rices" ||
                        productCards[index].proName == "Rice" ||
                        productCards[index].proName == "Rices") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Ricepage();
                          },
                        ),
                      );
                    }
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
                return Text(snapshot.data ??productCards[index].proName , style:const TextStyle(fontSize: 13, fontWeight: FontWeight.bold));
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
