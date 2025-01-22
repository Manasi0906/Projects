import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/BuyNow.dart';
import 'package:language_page/Customer_Login_Screens/ProfilePage.dart';
import 'package:language_page/Customer_Login_Screens/apple.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'home_product_model.dart';

List<HomeProduct> basketProductCards = [];

int globalBasket = 0;

double totalBasketPrice = 0;
int totalBasketItems = basketProductCards.length;

bool flagBasket = true;
List<int> itemCounts = [];
List<bool> itemSelected = [];

class BasketPage extends StatefulWidget {
  BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPage();
}

class _BasketPage extends State<BasketPage> {
  List<HomeProduct> updatedBasketProducts = [];
  List<int> updatedItemCounts = [];
  List<bool> updatedItemSelected = [];

  @override
  void initState() {
    super.initState();
    initializeBasket();
  }

  void initializeBasket() {
    setState(() {
      // Ensure itemCounts and itemSelected match basketProductCards length
      itemCounts = List<int>.filled(basketProductCards.length, 1);
      itemSelected = List<bool>.filled(basketProductCards.length, true);
    });
    calculateTotalBasketPrice();
  }

  void _deleteSelectedItems() {
    if (!itemSelected.contains(true)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'No item selected. Select any item first.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      return;
    }
    setState(() {
      for (int i = 0; i < basketProductCards.length; i++) {
        if (!itemSelected[i]) {
          updatedBasketProducts.add(basketProductCards[i]);
          updatedItemCounts.add(itemCounts[i]);
          updatedItemSelected.add(itemSelected[i]);
        }
      }

      basketProductCards = updatedBasketProducts;
      itemCounts = updatedItemCounts;
      itemSelected = updatedItemSelected;
    });
  }

// void initState(){
//   setState(() {
//     profileBasket=true;
//   });
// }

  void _shareSelectedItems() {
    final selectedItems = basketProductCards
        .asMap()
        .entries
        .where((entry) => itemSelected[entry.key])
        .map((entry) => entry.value.proName)
        .join(', ');
    if (selectedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'No item selected. Select any item first.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      return;
    }

    if (selectedItems.isNotEmpty) {
      Share.share('I selected: $selectedItems');
    }
  }

  void calculateTotalBasketPrice() {
    totalBasketPrice = 0; // Reset the price
    for (int i = 0; i < basketProductCards.length; i++) {
      if (itemSelected[i]) {
        totalBasketPrice += basketProductCards[i].proPrice * itemCounts[i];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    calculateTotalBasketPrice();
    double remainingAmount = 499 - totalBasketPrice;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
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
                    // decoration: const BoxDecoration(
                    //   gradient: LinearGradient(
                    //     begin: Alignment.topRight,
                    //     end: Alignment.bottomLeft,
                    //     colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                    //   ),
                    // ),

                    //titlePadding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            profileBasket == false
                            ? FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Basket"),
              builder: (context, snapshot) {
                return Text(snapshot.data ??"Basket" , style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 26, 77, 28),
                                          fontSize: 28,
                                        ),);
              },
            )
                                // ? const Text(
                                //     "Basket",
                                //     style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       color: Color.fromARGB(255, 26, 77, 28),
                                //       fontSize: 28,
                                //     ),
                                //   )
                                : Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Icon(
                                            Icons.arrow_back,
                                            size: 32,
                                            color:
                                                Color.fromARGB(255, 26, 77, 28),
                                            weight: 30,
                                          )),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                       FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Your Basket"),
              builder: (context, snapshot) {
                return Text(snapshot.data ??"Your Basket" , style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 26, 77, 28),
                                          fontSize: 25,
                                        ),);
              },
            ),
                                      // const Text(
                                      //   "Your Basket",
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.bold,
                                      //     color:
                                      //         Color.fromARGB(255, 26, 77, 28),
                                      //     fontSize: 25,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                            const SizedBox(
                              width: 45,
                            ),
                            Row(children: [
                              IconButton(
                                icon: const Icon(Icons.share,
                                    color: Colors.white),
                                onPressed: _shareSelectedItems,
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.white),
                                onPressed: _deleteSelectedItems,
                              )
                            ]),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: basketProductCards.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.add_shopping_cart,
                                color: Colors.grey.shade600,
                                size: 40,
                              ),
                              Text(
                                'No items in the cart',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            bool allSelected =
                                itemSelected.every((element) => element);
                            setState(() {
                              for (int i = 0; i < itemSelected.length; i++) {
                                itemSelected[i] = !allSelected;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.green,
                            child: Text(
                              itemSelected.every((element) => element)
                                  ? "Deselect All"
                                  : "Select All",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                ),
              ),
              // Display the remaining amount for free delivery
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.green.shade100,
                    child: Text(
                      remainingAmount > 0
                          ? "Add ₹${remainingAmount.toStringAsFixed(2)} more to get free delivery!"
                          : "You are eligible for free delivery!",
                      style: TextStyle(
                        color:
                            remainingAmount > 0 ? Colors.black : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.green),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: itemSelected[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  itemSelected[index] = value ?? false;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                            Container(
                              height: 130,
                              width: 100,
                              padding: const EdgeInsets.all(5),
                              child:basketProductCards[index].isBasketItem ?
                               Image.asset(
                                basketProductCards[index].image!,
                                fit: BoxFit.contain,
                              ):
                               Image.network(
                                basketProductCards[index].image!,
                                fit: BoxFit.contain,
                              )
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText(basketProductCards[index].proName),
              builder: (context, snapshot) {
                return Text(snapshot.data ??basketProductCards[index].proName , style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          // color:
                                          //     Color.fromARGB(255, 26, 77, 28),
                                          fontSize: 13,
                                        ),);
              },
            ),
                                    // Text(
                                    //   basketProductCards[index].proName,
                                    //   maxLines: 2,
                                    //   overflow: TextOverflow.ellipsis,
                                    //   style: const TextStyle(
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "₹${basketProductCards[index].proPrice}${basketProductCards[index].measureUnit}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              basketProductCards
                                                  .removeAt(index);
                                            });
                                          },
                                          child: Container(
                                            height: 32,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.red, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Container(
                                          height: 32,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.green, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    if (itemCounts[index] > 1) {
                                                      itemCounts[index]--;
                                                    }
                                                    setState(() {});
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 20,
                                                    color: Colors.green,
                                                  )),
                                              Text(
                                                "${itemCounts[index]}",
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    itemCounts[index]++;
                                                    setState(() {});
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 20,
                                                    color: Colors.green,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: basketProductCards.length,
                ),
              ),
              // Add extra padding to prevent last item from being hidden
              const SliverToBoxAdapter(
                child: SizedBox(
                    height:
                        80), // Adjust the height to match the fixed container
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                flagBasket = true;
                globalBasket = index;
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AddressBuyNowPage();
                }));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 222, 251, 223),
                  border: Border.all(color: Colors.green),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Proceed to buy (${basketProductCards.length} items)",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 26, 77, 28),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Total: ₹$totalBasketPrice",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 26, 77, 28), fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
