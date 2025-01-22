import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_page/FarmerLogin_Screens/leaderboard_individual_page.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';

class Farmer {
  final String name;
  final double rating;
  final int deliveries;
  final String imagePath;

  Farmer({
    required this.name,
    required this.rating,
    required this.deliveries,
    required this.imagePath,
  });
}

int leaderIndex = 0;
final List<Farmer> farmers = [
  Farmer(
      name: "Shoba Rao",
      rating: 4.9,
      deliveries: 30,
      imagePath: "assets/farmers/image1.jpg"),
  Farmer(
      name: "Rani Sharma",
      rating: 4.2,
      deliveries: 25,
      imagePath: "assets/farmers/image2.webp"),
  Farmer(
      name: "Raunika doe",
      rating: 3.8,
      deliveries: 20,
      imagePath: "assets/farmers/image3.jpg"),
  Farmer(
      name: "Vikas Dole",
      rating: 4.7,
      deliveries: 32,
      imagePath: "assets/farmers/image4.jpg"),
  Farmer(
      name: "Priya Joshi",
      rating: 4.5,
      deliveries: 28,
      imagePath: "assets/farmers/image5.jpg"),
  Farmer(
      name: "Rohit Mehta",
      rating: 3.5,
      deliveries: 18,
      imagePath: "assets/farmers/image6.jpg"),
  Farmer(
      name: "Nisha Kaur",
      rating: 4.6,
      deliveries: 29,
      imagePath: "assets/farmers/image7.jpg"),
  Farmer(
      name: "Anisha Veer",
      rating: 4.0,
      deliveries: 22,
      imagePath: "assets/farmers/image8.jpg"),
  Farmer(
      name: "Manoj Kaur",
      rating: 4.3,
      deliveries: 26,
      imagePath: "assets/farmers/image9.jpg"),
  Farmer(
      name: "Manoj Veer",
      rating: 3.9,
      deliveries: 21,
      imagePath: "assets/farmers/image10.jpg"),
];

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  void initState() {
    super.initState();
    // Sort the list by rating in ascending order
    farmers.sort((a, b) => b.rating.compareTo(a.rating));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          title: FutureBuilder<String>(
            future:
                context.read<LanguageProvider>().translateText("LeaderBoard"),
            builder: (context, snapshot) {
              return Text(
                snapshot.data ?? "LeaderBoard ",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 26, 77, 28),
                ),
              );
            },
          ),

          // title: Text(
          //   "Leaderboard",
          //   style: GoogleFonts.inter(
          //     fontSize: 24,
          //     fontWeight: FontWeight.bold,
          //     color: const Color.fromARGB(255, 26, 77, 28),
          //   ),
          // ),
          centerTitle: true,
          elevation: 4,
          shadowColor: Colors.greenAccent.withOpacity(0.4),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemCount: farmers.length,
        itemBuilder: (context, index) {
          final farmer = farmers[index];
          return GestureDetector(
            onTap: () {
              leaderIndex = index;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LeaderboardIndividualPage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.green.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            farmer.imagePath,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                FutureBuilder<String>(
                                  future: context
                                      .read<LanguageProvider>()
                                      .translateText("Farmer Name: "),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ?? "Farmer Name: ",
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    );
                                  },
                                ),
                                // Text(
                                //   "Farmer Name: ",
                                //   style: GoogleFonts.inter(
                                //     fontSize: 14,
                                //     fontWeight: FontWeight.bold,
                                //     color: Colors.black87,
                                //   ),
                                // ),
                                FutureBuilder<String>(
                                  future: context
                                      .read<LanguageProvider>()
                                      .translateText(farmer.name),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ?? farmer.name,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    );
                                  },
                                ),
                                // Text(
                                //   farmer.name,
                                //   style: GoogleFonts.inter(
                                //     fontSize: 14,
                                //     fontWeight: FontWeight.w500,
                                //     color: Colors.black87,
                                //   ),
                                // ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                FutureBuilder<String>(
                                  future: context
                                      .read<LanguageProvider>()
                                      .translateText("Product Quality:"),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ?? "Product Quality:",
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    );
                                  },
                                ),
                                // Text(
                                //   "Product Quality: ",
                                //   style: GoogleFonts.inter(
                                //     fontSize: 14,
                                //     fontWeight: FontWeight.bold,
                                //     color: Colors.black54,
                                //   ),
                                // ),
                                Text(
                                  farmer.rating.toString(),
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.amber.shade700,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                FutureBuilder<String>(
                                  future: context
                                      .read<LanguageProvider>()
                                      .translateText("Average Sale:"),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ?? "Average Sale:",
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    );
                                  },
                                ),
                                FutureBuilder<String>(
                                  future: context
                                      .read<LanguageProvider>()
                                      .translateText(
                                          "${farmer.deliveries} Deliveries"),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ??
                                          "${farmer.deliveries} Deliveries",
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    );
                                  },
                                ),
                                // Text(
                                //   "${farmer.deliveries} Deliveries",
                                //   style: GoogleFonts.inter(
                                //     fontSize: 14,
                                //     fontWeight: FontWeight.w500,
                                //     color: Colors.black87,
                                //   ),
                                // ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                ...List.generate(
                                  farmer.rating.floor(),
                                  (starIndex) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                ),
                                if (farmer.rating - farmer.rating.floor() > 0)
                                  const Icon(
                                    Icons.star_half,
                                    color: Colors.amber,
                                    size: 20,
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
            ),
          );
        },
      ),
    );
  }
}
