// import 'package:flutter/material.dart';
// import 'package:language_page/Customer_Login_Screens/Basket.dart';
// import 'package:language_page/Customer_Login_Screens/Wishlist.dart';
// import 'package:language_page/Customer_Login_Screens/YourOrder.dart';
// import 'package:language_page/Customer_Login_Screens/YourProfile.dart';
// import 'package:language_page/Customer_Login_Screens/home_product_model.dart';

// List<HomeProduct> yourOrderCards = [
//   HomeProduct(
//       image: "assets/vegetables/lady finger.jpg",
//       proName: "Lady Finger",
//       proPrice: 20,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/grains/rice.jpeg",
//       proName: "Rice",
//       proPrice: 140,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/vegetables/capsicum.jpg",
//       proName: "Capsicum",
//       proPrice: 25,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/milk/milk_products/cream.jpg",
//       proName: "Cream",
//       proPrice: 86,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/grains/jawar.webp",
//       proName: "Jawar",
//       proPrice: 87,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/vegetables/green calabash.webp",
//       proName: "Calabash",
//       proPrice: 30,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/fruits/white dragonfruit.jpg",
//       proName: "Dragonfruit",
//       proPrice: 180,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/milk/milk_products/powdered milk.jpg",
//       proName: "Powdered milk",
//       proPrice: 70,
//       measureUnit: '/kg'),
// ];

// List<HomeProduct> yourWishlistCards = [
//   HomeProduct(
//       image: "assets/vegetables/baby tomatos.jpg",
//       proName: "Baby Tomatos",
//       proPrice: 30,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/fruits/grapes.jpeg",
//       proName: "Grapes",
//       proPrice: 40,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/vegetables/lady finger.jpg",
//       proName: "Lady Finger",
//       proPrice: 20,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/fruits/mango.jpg",
//       proName: "Mango",
//       proPrice: 270,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/fruits/peach.jpg",
//       proName: "Peach",
//       proPrice: 150,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/vegetables/lettus.jpg",
//       proName: "Lettus",
//       proPrice: 80,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/fruits/strawberry.jpg",
//       proName: "Strawberry",
//       proPrice: 90,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/vegetables/onion.jpg",
//       proName: "Onion",
//       proPrice: 50,
//       measureUnit: '/kg'),
// ];

// List<HomeProduct> yourCartCards = [
//   HomeProduct(
//       image: "assets/grains/cheakpeas.png",
//       proName: "Cheakpeas",
//       proPrice: 50,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/milk/buffalo milk.jpeg",
//       proName: "Buffalo milk",
//       proPrice: 60,
//       measureUnit: '/l'),
//   HomeProduct(
//       image: "assets/eggs/eggs.jpg",
//       proName: "Eggs",
//       proPrice: 10,
//       measureUnit: '/item'),
//   HomeProduct(
//       image: "assets/grains/kidney beans.png",
//       proName: "Kidney Beans",
//       proPrice: 50,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/milk/milk_products/butter.jpg",
//       proName: "Butter",
//       proPrice: 60,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/milk/cow milk.jpeg",
//       proName: "Cow milk",
//       proPrice: 70,
//       measureUnit: '/l'),
//   HomeProduct(
//       image: "assets/grains/pumpkin seed.png",
//       proName: "Pumpkin seed",
//       proPrice: 60,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/grains/wheat.jpeg",
//       proName: "Wheat",
//       proPrice: 120,
//       measureUnit: '/kg'),
// ];

// List<HomeProduct> recentlyProductCards = [
//   HomeProduct(
//       image: "assets/grains/brown rice.png",
//       proName: "Brown Rice",
//       proPrice: 170,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/fruits/strawberry.jpg",
//       proName: "Strawberry",
//       proPrice: 90,
//       measureUnit: '/kg'),
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
//       image: "assets/fruits/mango.jpg",
//       proName: "Mango",
//       proPrice: 270,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/grains/cumin-seeds.webp",
//       proName: "Cumin seeds",
//       proPrice: 67,
//       measureUnit: '/kg'),
//   HomeProduct(
//       image: "assets/fruits/dates.jpg",
//       proName: "Dates",
//       proPrice: 60,
//       measureUnit: '/kg'),
// ];

// bool profileBasket = true;

// class ProfilePage extends StatefulWidget {
//   ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePage();
// }

// class _ProfilePage extends State<ProfilePage> {
//   // Method to add product to the basket
//   void addToBasket(HomeProduct product) {
//     setState(() {
//       basketProductCards.add(product);
//     });
//   }

//   void initState() {
//     setState(() {
//       profileBasket = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             automaticallyImplyLeading: false,
//             expandedHeight: 80.0,
//             floating: true,
//             snap: true,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topRight,
//                     end: Alignment.bottomLeft,
//                     colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
//                   ),
//                 ),
//               ),
//             ),
//             bottom: PreferredSize(
//               preferredSize: const Size.fromHeight(80),
//               child: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topRight,
//                     end: Alignment.bottomLeft,
//                     colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
//                   ),
//                 ),

//                 //titlePadding: const EdgeInsets.only(top: 70, left: 20, right: 20),
//                 child: const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         SizedBox(width: 15),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Profile",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 26, 77, 28),
//                                 fontSize: 28,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 15,
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildCategoryCard(
//                         icon: Icons.person,
//                         label: "Your Profile",
//                         color: Colors.green,
//                         onTap: () {
//                           Navigator.of(context)
//                               .push(MaterialPageRoute(builder: (context) {
//                             return const YourProfilePage();
//                           }));
//                         },
//                       ),
//                       _buildCategoryCard(
//                         icon: Icons.favorite,
//                         label: "Your Wishlist",
//                         color: Colors.green,
//                         onTap: () {
//                           Navigator.of(context)
//                               .push(MaterialPageRoute(builder: (context) {
//                             return const WishListPage();
//                           }));
//                           setState(() {});
//                         },
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildCategoryCard(
//                         icon: Icons.shopping_cart,
//                         label: "Your Basket",
//                         color: Colors.green,
//                         onTap: () {
//                           Navigator.of(context)
//                               .push(MaterialPageRoute(builder: (context) {
//                             return BasketPage();
//                           }));
//                           setState(() {});
//                         },
//                       ),
//                       _buildCategoryCard(
//                         icon: Icons.shopping_bag,
//                         label: "Your Orders",
//                         color: Colors.green,
//                         onTap: () {
//                           Navigator.of(context)
//                               .push(MaterialPageRoute(builder: (context) {
//                             return const YourOrderPage();
//                           }));
//                           setState(() {});
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Your Orders",
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 29, 114, 32)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: Row(
//                       children: yourOrderCards.map((product) {
//                         return Container(
//                           margin: const EdgeInsets.only(right: 10.0),
//                           width: 110,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 height: 110,
//                                 width: 110,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: Colors.white,
//                                     border: Border.all(color: Colors.green)),
//                                 //clipBehavior: Clip.antiAlias,
//                                 child: Image.asset(
//                                   product.image!,
//                                   fit: BoxFit.contain,
//                                 ),
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 product.proName,
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               const SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "₹${product.proPrice}${product.measureUnit}",
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   const Spacer(),
//                                   GestureDetector(
//                                     onTap: () {
//                                       addToBasket(product);
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         SnackBar(
//                                           content: Text(
//                                               '${product.proName} added to basket!'),
//                                         ),
//                                       );
//                                     },
//                                     child: Container(
//                                       height: 22,
//                                       width: 35,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             width: 1, color: Colors.red),
//                                         borderRadius: BorderRadius.circular(5),
//                                         color: Colors.white,
//                                       ),
//                                       child: const Center(
//                                         child: Text(
//                                           "Add",
//                                           style: TextStyle(
//                                               color: Colors.red,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 10),
//                             ],
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SliverList.builder(
//             itemCount: 1,
//             itemBuilder: (context, index) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "Your Wishlist",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Color.fromARGB(255, 29, 114, 32)),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Row(
//                           children: yourWishlistCards.map((product) {
//                             return Container(
//                               margin: const EdgeInsets.only(right: 10.0),
//                               width: 110,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 110,
//                                     width: 110,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: Colors.white,
//                                         border:
//                                             Border.all(color: Colors.green)),
//                                     clipBehavior: Clip.antiAlias,
//                                     child: Image.asset(
//                                       product.image!,
//                                       fit: BoxFit.contain,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 5),
//                                   Text(
//                                     product.proName,
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   const SizedBox(height: 5),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         "₹${product.proPrice}${product.measureUnit}",
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       const Spacer(),
//                                       GestureDetector(
//                                         onTap: () {
//                                           addToBasket(product);
//                                           ScaffoldMessenger.of(context)
//                                               .showSnackBar(
//                                             SnackBar(
//                                               content: Text(
//                                                   '${product.proName} added to basket!'),
//                                             ),
//                                           );
//                                         },
//                                         child: Container(
//                                           height: 22,
//                                           width: 35,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 width: 1, color: Colors.red),
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             color: Colors.white,
//                                           ),
//                                           child: const Center(
//                                             child: Text(
//                                               "Add",
//                                               style: TextStyle(
//                                                   color: Colors.red,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 10),
//                                 ],
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           SliverList.builder(
//             itemCount: 1,
//             itemBuilder: (context, index) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "Your Cart",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Color.fromARGB(255, 29, 114, 32)),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Row(
//                           children: yourCartCards.map((product) {
//                             return Container(
//                               margin: const EdgeInsets.only(right: 10.0),
//                               width: 110,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 110,
//                                     width: 110,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: Colors.white,
//                                         border:
//                                             Border.all(color: Colors.green)),
//                                     clipBehavior: Clip.antiAlias,
//                                     child: Image.asset(
//                                       product.image!,
//                                       fit: BoxFit.contain,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 5),
//                                   Text(
//                                     product.proName,
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   const SizedBox(height: 5),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         "₹${product.proPrice}${product.measureUnit}",
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       const Spacer(),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 10),
//                                 ],
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           SliverList.builder(
//             itemCount: 1,
//             itemBuilder: (context, index) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "Recently Viewed",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Color.fromARGB(255, 29, 114, 32)),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Row(
//                           children: recentlyProductCards.map((product) {
//                             return Container(
//                               margin: const EdgeInsets.only(right: 10.0),
//                               width: 110,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 110,
//                                     width: 110,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: Colors.white,
//                                         border:
//                                             Border.all(color: Colors.green)),
//                                     clipBehavior: Clip.antiAlias,
//                                     child: Image.asset(
//                                       product.image!,
//                                       fit: BoxFit.contain,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 5),
//                                   Text(
//                                     product.proName,
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   const SizedBox(height: 5),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         "₹${product.proPrice}${product.measureUnit}",
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       const Spacer(),
//                                       GestureDetector(
//                                         onTap: () {
//                                           addToBasket(product);
//                                           ScaffoldMessenger.of(context)
//                                               .showSnackBar(
//                                             SnackBar(
//                                               content: Text(
//                                                   '${product.proName} added to basket!'),
//                                             ),
//                                           );
//                                         },
//                                         child: Container(
//                                           height: 22,
//                                           width: 35,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 width: 1, color: Colors.red),
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             color: Colors.white,
//                                           ),
//                                           child: const Center(
//                                             child: Text(
//                                               "Add",
//                                               style: TextStyle(
//                                                   color: Colors.red,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 10),
//                                 ],
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       // Uncomment the following line to add your navigation bar
//       // bottomNavigationBar: const NavBarPage(),
//     );
//   }

//   Widget _buildCategoryCard({
//     required IconData icon,
//     required String label,
//     required Color color,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 120,
//         width: 120,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: color),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               blurRadius: 5,
//               spreadRadius: 2,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 40, color: color),
//             const SizedBox(height: 10),
//             Text(
//               label,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: color,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/Basket.dart';
import 'package:language_page/Customer_Login_Screens/Wishlist.dart';
import 'package:language_page/Customer_Login_Screens/YourOrder.dart';
import 'package:language_page/Customer_Login_Screens/YourProfile.dart';
import 'package:language_page/Customer_Login_Screens/home_customer.dart';
import 'package:language_page/Customer_Login_Screens/home_product_model.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';

bool profileBasket = true;

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  void addToBasket(HomeProduct product) {
    setState(() {
      basketProductCards.add(product);
    });
  }

  void initState() {
    setState(() {
      profileBasket = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( 'Profile'),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? 'Profile' , style:const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 26, 77, 28),
                                fontSize: 28,
                              ),);
              },
            ),
                            // Text(
                            //   "Profile",
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //     color: Color.fromARGB(255, 26, 77, 28),
                            //     fontSize: 28,
                            //   ),
                            // ),
                            SizedBox(
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryCard(
                        icon: Icons.person,
                        label: "Your Profile",
                        color: Colors.green,
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const YourProfilePage();
                          }));
                        },
                      ),
                      _buildCategoryCard(
                        icon: Icons.favorite,
                        label: "Your Wishlist",
                        color: Colors.green,
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const WishListPage();
                          }));
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryCard(
                        icon: Icons.shopping_cart,
                        label: "Your Basket",
                        color: Colors.green,
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return BasketPage();
                          }));
                          setState(() {});
                        },
                      ),
                      _buildCategoryCard(
                        icon: Icons.shopping_bag,
                        label: "Your Orders",
                        color: Colors.green,
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const YourOrderPage();
                          }));
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( 'Your Orders'),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? 'Your Orders' , style:const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 29, 114, 32),
                                fontSize: 20,
                              ),);
              },
            ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                orderProductCards.isEmpty
                    ?  Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: 
                           FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( "Your order list is empty."),
              builder: (context, snapshot) {
                return Text(snapshot.data ??"Your order list is empty.", style:const TextStyle(
                                // fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 18,
                              ),);
              },
            ),
                          // Text(
                          //   "Your order list is empty.",
                          //   style: TextStyle(fontSize: 18, color: Colors.grey),
                          // ),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: orderProductCards.map((product) {
                              return Container(
                                margin: const EdgeInsets.only(right: 10.0),
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.green)),
                                      //clipBehavior: Clip.antiAlias,
                                      child: product.isBasketItem ? 
                                      Image.asset(
                                        product.image!,
                                        fit: BoxFit.contain,
                                      ) :
                                      Image.network(
                                        product.image!,
                                        fit: BoxFit.contain,
                                      )
                                    ),
                                    const SizedBox(height: 5),
                                     FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( product.proName),
              builder: (context, snapshot) {
                return Text(snapshot.data ??product.proName,maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                );
              },
            ),
                                    // Text(
                                    //   product.proName,
                                    //   maxLines: 2,
                                    //   overflow: TextOverflow.ellipsis,
                                    //   style: const TextStyle(
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( "₹${product.proPrice}${product.measureUnit}"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "₹${product.proPrice}${product.measureUnit}",
                                      // overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                );
              },
            ),
                                        // Text(
                                        //   "₹${product.proPrice}${product.measureUnit}",
                                        //   style: const TextStyle(
                                        //       fontWeight: FontWeight.bold),
                                        // ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            addToBasket(product);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: 
                                                FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText(   '${product.proName} added to basket!'),
              builder: (context, snapshot) {
                return Text(snapshot.data ??   '${product.proName} added to basket!',
                                      // overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                );
              },
            ),
                                                // Text(
                                                //     '${product.proName} added to basket!'),
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
                                            child:  Center(
                                              child:  FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( "Add"),
              builder: (context, snapshot) {
                return Text(snapshot.data ??  "Add",
                                      // overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                         color: Colors.red,
                                          fontWeight: FontWeight.bold),
                );
              },
            ),
                                              // child: Text(
                                              //   "Add",
                                              //   style: TextStyle(
                                              //       color: Colors.red,
                                              //       fontWeight:
                                              //           FontWeight.bold),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                // Add divider here
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Divider(
                    color: Colors.green,
                    thickness: 2.0,
                  ),
                ),
              ],
            ),
          ),
          SliverList.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                         FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( "Your Wishlist"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Your Wishlist",
                                      // overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                         color:  Color.fromARGB(255, 29, 114, 32),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                );
              },
            ),
                        // Text(
                        //   "Your Wishlist",
                        //   style: TextStyle(
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.bold,
                        //       color: Color.fromARGB(255, 29, 114, 32)),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    wishlistProductCards.isEmpty
                        ?  Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(
                              child: FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( "Your Wishlist is empty"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Your Wishlist is empty",
                                      // overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                         color:  Colors.grey,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 18),
                );
              },
            ),
                            ),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: wishlistProductCards.map((product) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 10.0),
                                    width: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.green)),
                                          clipBehavior: Clip.antiAlias,
                                          child:  product.isBasketItem ? 
                                      Image.asset(
                                        product.image!,
                                        fit: BoxFit.contain,
                                      ) :
                                      Image.network(
                                        product.image!,
                                        fit: BoxFit.contain,
                                      )
                                        ),
                                        const SizedBox(height: 5),
                                        FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText(product.proName),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? product.proName,
                                      overflow: TextOverflow.ellipsis,maxLines: 2,
                                      style: const TextStyle(
                                        //  color:  Color.fromARGB(255, 29, 114, 32),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                );
              },
            ),
                                        // Text(
                                        //   product.proName,
                                        //   maxLines: 2,
                                        //   overflow: TextOverflow.ellipsis,
                                        //   style: const TextStyle(
                                        //       fontWeight: FontWeight.bold),
                                        // ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText(  "₹${product.proPrice}${product.measureUnit}"),
              builder: (context, snapshot) {
                return Text(snapshot.data ??  "₹${product.proPrice}${product.measureUnit}",
                                      overflow: TextOverflow.ellipsis,maxLines: 2,
                                      style: const TextStyle(
                                        //  color:  Color.fromARGB(255, 29, 114, 32),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                );
              },
            ),
                                            // Text(
                                            //   "₹${product.proPrice}${product.measureUnit}",
                                            //   style: const TextStyle(
                                            //       fontWeight: FontWeight.bold),
                                            // ),
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
                                                      width: 1,
                                                      color: Colors.red),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                ),
                                                child:  Center(
                                                  child:   FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText(    "Add"),
              builder: (context, snapshot) {
                return Text(snapshot.data ??    "Add",
                                      // overflow: TextOverflow.ellipsis,maxLines: 2,
                                      style: const TextStyle(
                                         color:  Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                );
              },
            ),
                                        
                                                  // child: Text(
                                                  //   "Add",
                                                  //   style: TextStyle(
                                                  //       color: Colors.red,
                                                  //       fontWeight:
                                                  //           FontWeight.bold),
                                                  // ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Divider(
                        color: Colors.green,
                        thickness: 2.0,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SliverList.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( 'Your Cart'),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? 'Your Cart' , style:const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 29, 114, 32),
                                fontSize: 20,
                              ),);
              },
            ),
                        // Text(
                        //   "Your Cart",
                        //   style: TextStyle(
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.bold,
                        //       color: Color.fromARGB(255, 29, 114, 32)),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    basketProductCards.isEmpty
                        ?  Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(
                              child:
                               FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( "Your basket list is empty."),
              builder: (context, snapshot) {
                return Text(snapshot.data ??  "Your basket list is empty.",
                                      // overflow: TextOverflow.ellipsis,maxLines: 2,
                                      style: const TextStyle(
                                         color:  Colors.grey,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 18),
                );
              },
            )
                              //  Text(
                              //   "Your basket list is empty.",
                              //   style:
                              //       TextStyle(fontSize: 18, color: Colors.grey),
                              // ),
                            ),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: basketProductCards.map((product) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 10.0),
                                    width: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.green)),
                                          clipBehavior: Clip.antiAlias,
                                          child:  product.isBasketItem ? 
                                      Image.asset(
                                        product.image!,
                                        fit: BoxFit.contain,
                                      ) :
                                      Image.network(
                                        product.image!,
                                        fit: BoxFit.contain,
                                      )
                                        ),
                                        const SizedBox(height: 5),
                                        FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText(product.proName),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? product.proName,
                                      overflow: TextOverflow.ellipsis,maxLines: 2,
                                      style: const TextStyle(
                                        //  color:  Color.fromARGB(255, 29, 114, 32),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                );
              },
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
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Divider(
                        color: Colors.green,
                        thickness: 2.0,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SliverList.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                         FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Recently Viewed"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Recently Viewed",
                                      // overflow: TextOverflow.ellipsis,maxLines: 2,
                                      style: const TextStyle(
                                         color:  Color.fromARGB(255, 29, 114, 32),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                );
              },
            )
                        // Text(
                        //   "Recently Viewed",
                        //   style: TextStyle(
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.bold,
                        //       color: Color.fromARGB(255, 29, 114, 32)),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: recentlyProductCards.map((product) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              width: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.green)),
                                    clipBehavior: Clip.antiAlias,
                                    child:  product.isBasketItem ? 
                                      Image.asset(
                                        product.image!,
                                        fit: BoxFit.contain,
                                      ) :
                                      Image.network(
                                        product.image!,
                                        fit: BoxFit.contain,
                                      )
                                  ),
                                  const SizedBox(height: 5),
                                  FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText(product.proName),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? product.proName,
                                      overflow: TextOverflow.ellipsis,maxLines: 2,
                                      style: const TextStyle(
                                        //  color:  Color.fromARGB(255, 29, 114, 32),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                );
              },
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
                                          child:  Center(
                                            child:  FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText(    "Add"),
              builder: (context, snapshot) {
                return Text(snapshot.data ??    "Add",
                                      // overflow: TextOverflow.ellipsis,maxLines: 2,
                                      style: const TextStyle(
                                         color:  Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                );
              },
            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
