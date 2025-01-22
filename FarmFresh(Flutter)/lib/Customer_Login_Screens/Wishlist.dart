import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/ProfilePage.dart';
import 'package:language_page/Customer_Login_Screens/home_product_model.dart';

List<HomeProduct> wishlistProductCards = [
  // HomeProduct(
  //     image: "assets/grains/brown rice.png",
  //     proName: "Brown Rice",
  //     proPrice: 170,
  //     measureUnit: '/kg'),
  // HomeProduct(
  //     image: "assets/vegetables/green onions.jpg",
  //     proName: "Green Onions",
  //     proPrice: 40,
  //     measureUnit: '/bunch'),
  // HomeProduct(
  //     image: "assets/milk/buffalo milk.jpeg",
  //     proName: "Buffalo Milk",
  //     proPrice: 60,
  //     measureUnit: '/l'),
  // HomeProduct(
  //     image: "assets/fruits/red grapes.jpg",
  //     proName: "Red Grapes",
  //     proPrice: 50,
  //     measureUnit: '/kg'),
  // HomeProduct(
  //     image: "assets/vegetables/lemons.jpg",
  //     proName: "Lemons",
  //     proPrice: 45,
  //     measureUnit: '/kg'),
  // HomeProduct(
  //     image: "assets/vegetables/mint .jpg",
  //     proName: "Mint",
  //     proPrice: 20,
  //     measureUnit: '/bunch'),
  // HomeProduct(
  //     image: "assets/grains/cumin-seeds.webp",
  //     proName: "Cumin seeds",
  //     proPrice: 67,
  //     measureUnit: '/kg'),
  // HomeProduct(
  //     image: "assets/fruits/banana.jpg",
  //     proName: "Banana",
  //     proPrice: 60,
  //     measureUnit: '/kg'),
];

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPage();
}

class _WishListPage extends State<WishListPage> {
  late List<bool> isFavorited;
  late List<bool> isSelectedForAction;
  bool isLongPressed = false;

  @override
  void initState() {
    super.initState();
    isFavorited = List.generate(wishlistProductCards.length, (index) => true);
    isSelectedForAction =
        List.generate(wishlistProductCards.length, (index) => false);
  }

  void toggleFavorite(int index) {
    setState(() {
      // Flip the state of the specific index only
      isFavorited[index] = !isFavorited[index];

      // Optionally, add logic to remove or retain the item based on the change
      if (!isFavorited[index]) {
        wishlistProductCards.removeAt(index);
        isSelectedForAction.removeAt(index);
        isFavorited.removeAt(index); // Ensure the list remains consistent
      }
    });
  }

  void toggleSelectForAction(int index) {
    setState(() {
      if (isLongPressed) {
        isSelectedForAction[index] = !isSelectedForAction[index];
      }
    });
  }

  void onLongPress(int index) {
    setState(() {
      isLongPressed = true;
      isSelectedForAction[index] = true;
    });
  }

  void deleteSelectedItems() {
    setState(() {
      for (int i = wishlistProductCards.length - 1; i >= 0; i--) {
        if (isSelectedForAction[i]) {
          wishlistProductCards.removeAt(i);
          isSelectedForAction.removeAt(i);
          isFavorited.removeAt(i);
        }
      }
      isLongPressed = false;
    });
  }

  void shareSelectedItems() {
    // Implement logic to share selected items here
    List<String> sharedItems = [];
    for (int i = 0; i < wishlistProductCards.length; i++) {
      if (isSelectedForAction[i]) {
        sharedItems.add(wishlistProductCards[i]
            .proName); // Assuming product has a 'name' property
      }
    }
    print("Shared items: ${sharedItems.join(', ')}");
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
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
                        colors: [
                          Colors.green,
                          Color.fromARGB(255, 232, 236, 233)
                        ],
                      ),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(80),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  "Your Wishlist",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 26, 77, 28),
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.share,
                                      color: Colors.white),
                                  onPressed: shareSelectedItems,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.white),
                                  onPressed: deleteSelectedItems,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15)
                      ],
                    ),
                  ),
                ),
              ),
              wishlistProductCards.isEmpty
                  ? const SliverFillRemaining(
                      child: Center(
                        child: Text(
                          "Your Wishlist is empty",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  : SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onLongPress: () => onLongPress(
                                  index), // Long press to enable checkboxes
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        wishlistProductCards[index].isBasketItem ?
                                        Image.asset(
                                          wishlistProductCards[index].image!,
                                          height: 80,
                                          width: 110,
                                          fit: BoxFit.contain,
                                        ) :
                                         Image.network(
                                          wishlistProductCards[index].image!,
                                          height: 80,
                                          width: 110,
                                          fit: BoxFit.contain,
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                wishlistProductCards[index]
                                                    .proName,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    "₹${wishlistProductCards[index].proPrice}${wishlistProductCards[index].measureUnit}",
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    height: 22,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.red),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        "Add",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                    // Positioned(
                                    //   top: 0,
                                    //   right: 0,
                                    //   child: IconButton(
                                    //     icon: Icon(
                                    //       isFavorited[index] ? Icons.favorite : Icons.favorite_border,
                                    //       color: isFavorited[index] ? Colors.red : Colors.grey,
                                    //     ),
                                    //     onPressed: () => toggleFavorite(index),
                                    //   ),
                                    // ),

                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: isLongPressed
                                          ? Checkbox(
                                              value: isSelectedForAction[index],
                                              onChanged: (bool? value) {
                                                toggleSelectForAction(index);
                                              },
                                              activeColor: Colors.green,
                                            )
                                          : IconButton(
                                              icon: Icon(
                                                isFavorited[index]
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: isFavorited[index]
                                                    ? Colors.red
                                                    : Colors.grey,
                                              ),
                                              onPressed: () =>
                                                  toggleFavorite(index),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: wishlistProductCards.length,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}


  // List<HomeProduct> productCards = [
  //   HomeProduct(
  //       image: "assets/grains/brown rice.png",
  //       proName: "Brown Rice",
  //       proPrice: 170,
  //       measureUnit: '/kg'),
  //   HomeProduct(
  //       image: "assets/vegetables/green onions.jpg",
  //       proName: "Green Onions",
  //       proPrice: 40,
  //       measureUnit: '/bunch'),
  //   HomeProduct(
  //       image: "assets/milk/buffalo milk.jpeg",
  //       proName: "Buffalo Milk",
  //       proPrice: 60,
  //       measureUnit: '/l'),
  //   HomeProduct(
  //       image: "assets/fruits/red grapes.jpg",
  //       proName: "Red Grapes",
  //       proPrice: 50,
  //       measureUnit: '/kg'),
  //   HomeProduct(
  //       image: "assets/vegetables/lemons.jpg",
  //       proName: "Lemons",
  //       proPrice: 45,
  //       measureUnit: '/kg'),
  //   HomeProduct(
  //       image: "assets/vegetables/mint .jpg",
  //       proName: "Mint",
  //       proPrice: 20,
  //       measureUnit: '/bunch'),
  //   HomeProduct(
  //       image: "assets/grains/cumin-seeds.webp",
  //       proName: "Cumin seeds",
  //       proPrice: 67,
  //       measureUnit: '/kg'),
  //   HomeProduct(
  //       image: "assets/fruits/banana.jpg",
  //       proName: "Banana",
  //       proPrice: 60,
  //       measureUnit: '/kg'),
  // ];

  