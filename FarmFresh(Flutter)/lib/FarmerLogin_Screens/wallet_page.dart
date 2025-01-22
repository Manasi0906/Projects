import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Wallet_Page());
}

class Wallet_Page extends StatelessWidget {
  const Wallet_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wallet_Page_Amount(),
    );
  }
}

class Wallet_Page_Amount extends StatefulWidget {
  const Wallet_Page_Amount({super.key});

  @override
  State<Wallet_Page_Amount> createState() => _Wallet_Page_AmountState();
}

class _Wallet_Page_AmountState extends State<Wallet_Page_Amount> {
  List<Map<String, String>> items = [
    {
      "title": "Apples",
      "price": "₹200",
      "order": "Order No.:23043",
      "date": "26 June 2024"
    },
    {
      "title": "Alphonso Mango",
      "price": "₹500",
      "order": "Order No.:23044",
      "date": "15 July 2024"
    },
    {
      "title": "Kesar Mango",
      "price": "₹400",
      "order": "Order No.:23045",
      "date": "12 Aug 2024"
    },
    // Add more items as needed
  ];

  List<Map<String, String>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items; // Initially display all items
  }

  void filterSearchResults(String query) {
    List<Map<String, String>> results = [];
    if (query.isEmpty) {
      results = items;
    } else {
      results = items
          .where((item) =>
              item["title"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wallet",
          style: GoogleFonts.quicksand(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 34, 109, 36)),
        ),
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
        centerTitle: true,
        // backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
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
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 20,
                    child: Container(
                      width: 320,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextField(
                        onChanged: filterSearchResults,
                        decoration: InputDecoration(
                          hintText: "Search here",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: 100,
                      width: 380,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.lightGreen[100]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal,
                            color: Colors.green,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          ClipOval(
                            child: Image.asset(
                              "assets/MyPhotoValid.jpg",
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      item["title"]!,
                                      style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    const Spacer(),
                                    Text(
                                      item["price"]!,
                                      style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                    const SizedBox(width: 20),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(item["order"]!,
                                        style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(item["date"]!,
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.green,
        child: Center(
          child: Text("TotalAmount : ₹600",
              style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
