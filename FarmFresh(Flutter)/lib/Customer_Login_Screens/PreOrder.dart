import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/Basket.dart';
import 'package:language_page/Customer_Login_Screens/Wishlist.dart';
import 'package:language_page/Customer_Login_Screens/home_product_model.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';


List<HomeProduct> productCards = [
    HomeProduct(
        image: "assets/fruits/apple.jpg",
        proName: "Apples",
        proPrice: 150,
        days: 3,
        isBasketItem: true,
        measureUnit: '/kg'),
    HomeProduct(
        image: "assets/vegetables/fenugreek.jpg",
        proName: "Fenugreek",
        proPrice: 15,
        days: 2,
        isBasketItem: true,
        measureUnit: '/bunch'),
    HomeProduct(
        image: "assets/fruits/white dragonfruit.jpg",
        proName: "Dragonfruit",
        proPrice: 250,
        days: 4,
        isBasketItem: true,
        measureUnit: '/kg'),
    HomeProduct(
        image: "assets/vegetables/green chilies.jpg",
        proName: "Green Chilies",
        proPrice: 50,
        days: 3,
        isBasketItem: true,
        measureUnit: '/kg'),
    HomeProduct(
        image: "assets/fruits/guava.webp",
        proName: "Guava",
        proPrice: 80,
        days: 5,
        isBasketItem: true,
        measureUnit: '/kg'),
    HomeProduct(
        image: "assets/vegetables/coriender leaves.jpg",
        proName: "Coriender Leaves",
        proPrice: 15,
        days: 6,
        isBasketItem: true,
        measureUnit: '/bunch'),
    HomeProduct(
        image: "assets/fruits/chiku.jpeg",
        proName: "Chiku",
        proPrice: 40,
        days: 3,
        isBasketItem: true,
        measureUnit: '/kg'),
    HomeProduct(
        image: "assets/vegetables/sweet corn.webp",
        proName: "Sweetcorn",
        proPrice: 70,
        days: 5,
        isBasketItem: true,
        measureUnit: '/kg'),
    HomeProduct(
        image: "assets/fruits/dates.jpg",
        proName: "Dates",
        proPrice: 180,
        days: 6,
        isBasketItem: true,
        measureUnit: '/kg'),
    HomeProduct(
        image: "assets/fruits/blackberry.jpg",
        proName: "Blackberry",
        proPrice: 120,
        days: 6,
        isBasketItem: true,
        measureUnit: '/kg'),
    HomeProduct(
        image: "assets/milk/raw milk.jpeg",
        proName: "Raw milk",
        proPrice: 90,
        days: 1,
        isBasketItem: true,
        measureUnit: '/l'),
    HomeProduct(
        image: "assets/fruits/peach.jpg",
        proName: "Peach",
        proPrice: 190,
        days: 5,
        isBasketItem: true,
        measureUnit: '/kg'),
    HomeProduct(
        image: "assets/vegetables/cucumber.jpg",
        proName: "Cucumber",
        proPrice: 68,
        days: 3,
        isBasketItem: true,
        measureUnit: '/kg'),
    HomeProduct(
        image: "assets/grains/bajra.jpeg",
        proName: "Bajra",
        proPrice: 150,
        days: 4,
        isBasketItem: true,
        measureUnit: '/kg'),
    HomeProduct(
        image: "assets/milk/coconutmilk.jpg",
        proName: "Coconut milk",
        proPrice: 70,
        days: 1,
        isBasketItem: true,
        measureUnit: '/l'),
    HomeProduct(
        image: "assets/fruits/pomygraned.jpg",
        proName: "Pomygraned",
        proPrice: 60,
        days: 5,
        isBasketItem: true,
        measureUnit: '/kg'),
  ];

class PreorderApp extends StatefulWidget {
  const PreorderApp({super.key});

  @override
  State<PreorderApp> createState() => _PreorderApp();
}

class _PreorderApp extends State<PreorderApp> {
  
  late List<bool> isFavorited;
  @override
  void initState() {
    super.initState();
    productCards.sort((a, b) => a.days!.compareTo(b.days as num));
    isFavorited = List.generate(productCards.length, (index) => false);
  }

   // Function to check if the product is in the wishlist
  bool isProductFavorited(HomeProduct product) {
    return wishlistProductCards.contains(product);
  }

  // Function to handle the favorite toggle
  void toggleFavorite(HomeProduct product) {
    setState(() {
      if (isProductFavorited(product)) {
        wishlistProductCards.remove(product);
      } else {
        wishlistProductCards.add(product);
      }
    });
  }
  
 void addToBasket(HomeProduct product) {
  setState(() {
    basketProductCards.add(product);
  });
}



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
                              FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( "Pre-Order"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Pre-Order" , style:const TextStyle(
                              fontWeight: FontWeight.bold,
                             color: Color.fromARGB(255, 26, 77, 28),
                              fontSize: 28,
                            ),);
              },
            ),
                              // const Text(
                              //   "Pre-Order",
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
          padding: EdgeInsets.all(8),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of cards in a row
              childAspectRatio: 1, // Aspect ratio of the cards
              crossAxisSpacing: 8, // Space between the cards horizontally
              mainAxisSpacing: 8, // Space between the cards vertically
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                HomeProduct product = productCards[index];
               bool isFavorited = isProductFavorited(product);
                return Container(
                  height: 160,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children:[ Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          productCards[index].image!,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( productCards[index].proName),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? productCards[index].proName , style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              // color: Colors.green,
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
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                   FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("₹${productCards[index].proPrice}${productCards[index].measureUnit}"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "₹${productCards[index].proPrice}${productCards[index].measureUnit}" , style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              // color: Colors.green,
                              fontSize: 13,
                            ),);
              },
            ),
                                  
                                  // Text(
                                  //   "₹${productCards[index].proPrice}${productCards[index].measureUnit}",
                                  //   style: const TextStyle(
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      addToBasket(productCards[index]);
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText('${productCards[index].proName} added to basket!'),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? '${productCards[index].proName} added to basket!' , style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              // color: Colors.green,
                              fontSize: 13,
                            ),);
              },
            ),
                                                  // Text('${productCards[index].proName} added to basket!'),
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
                                        child:  Center(
                                            child: FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( "Add"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Add" , style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 13,
                            ),);
              },
            ),)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( "Available in ${productCards[index].days} days"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Available in ${productCards[index].days} days" , style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 13,
                            ),);
              },
            ),
                              // Text(
                              //   "Available in ${productCards[index].days} days",
                              //   style: const TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       color: Colors.green),
                              // ),
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
                              color:
                                  isFavorited ? Colors.red : Colors.grey,
                            ),
                            onPressed: () { toggleFavorite(product);
                             //addToWishlist(productCards[index]);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( '${productCards[index].proName} added to wishlist!'),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? '${productCards[index].proName} added to wishlist!' , style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              // color: Color.fromARGB(255, 26, 77, 28),
                              fontSize: 13,
                            ),);
              },
            ),
                                                // Text('${productCards[index].proName} added to wishlist!'),
                                              ),
                                            );
                            }
                          ),
                        ),
                    ],
                  ),
                );
              },
              childCount: productCards.length,
            ),
          ),
        ),
      ]),
    );
  }
}
