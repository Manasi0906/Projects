import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_page/FarmerLogin_Screens/uploadPage.dart';

List<Map<String, dynamic>> products = [
  // {
  //   "productName": myProductsList[0].productName,
  //   "productAddress": "Ratnagiri, India",
  //   "productDiscription": "Premium quality Alphonso mangoes.",
  //   "quantity": "50",
  //   "price": "\$300",
  //   "harvestDate": "26 June 2024",
  //   "expectShelf": "10 days",
  //   "order": "Order No.:23043",
  // },
  // {
  //   "productName": "Alphonso Mango",
  //   "productAddress": "Devgad, India",
  //   "productDiscription": "Naturally ripened Alphonso mangoes.",
  //   "quantity": "40",
  //   "price": "\$500",
  //   "harvestDate": "15 July 2024",
  //   "expectShelf": "12 days",
  //   "order": "Order No.:23044",
  // },
  // {
  //   "productName": "Kesar Mango",
  //   "productAddress": "Junagadh, India",
  //   "productDiscription": "Sweet and flavorful Kesar mangoes.",
  //   "quantity": "60",
  //   "price": "\$400",
  //   "harvestDate": "12 Aug 2024",
  //   "expectShelf": "15 days",
  //   "order": "Order No.:23045",
  // },
];

class YourProductAmount extends StatelessWidget {
  YourProductAmount({super.key});
  // final List<Map<String, String>> products = [
  //   {
  //     "productName": myProductsList[0].productName,
  //     "productAddress": "Ratnagiri, India",
  //     "productDiscription": "Premium quality Alphonso mangoes.",
  //     "quantity": "50",
  //     "price": "\$300",
  //     "harvestDate": "26 June 2024",
  //     "expectShelf": "10 days",
  //     "order": "Order No.:23043",
  //   },
  //   {
  //     "productName": "Alphonso Mango",
  //     "productAddress": "Devgad, India",
  //     "productDiscription": "Naturally ripened Alphonso mangoes.",
  //     "quantity": "40",
  //     "price": "\$500",
  //     "harvestDate": "15 July 2024",
  //     "expectShelf": "12 days",
  //     "order": "Order No.:23044",
  //   },
  //   {
  //     "productName": "Kesar Mango",
  //     "productAddress": "Junagadh, India",
  //     "productDiscription": "Sweet and flavorful Kesar mangoes.",
  //     "quantity": "60",
  //     "price": "\$400",
  //     "harvestDate": "12 Aug 2024",
  //     "expectShelf": "15 days",
  //     "order": "Order No.:23045",
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Color.fromARGB(255, 232, 236, 233),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        title: const Text(
          "Product Details",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 26, 77, 28),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
              elevation: 8,
              color: const Color.fromARGB(255, 228, 251, 229),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(product['Image']),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      product["Product Name"]!,
                      style: GoogleFonts.quicksand(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Product Variety: ${product["Product Variety"]}",
                      style: GoogleFonts.quicksand(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Description: ${product["Product Description"]}",
                      style: GoogleFonts.quicksand(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Quantity: ${product["Quantity Available((kg)(gram)(unit))"]}",
                      style: GoogleFonts.quicksand(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Price: ${product["Price per unit((kg)(gram)(unit))"]}",
                      style: GoogleFonts.quicksand(
                          fontSize: 16, color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Harvest Date: ${product["Harvest Date"]}",
                      style: GoogleFonts.quicksand(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Shelf Life: ${product["Expected Shelf Life"]}",
                      style: GoogleFonts.quicksand(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    // Text(
                    //   "Order: ${product["order"]}",
                    //   style: GoogleFonts.quicksand(
                    //       fontSize: 16, fontWeight: FontWeight.bold),
                    //   textAlign: TextAlign.center,
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
