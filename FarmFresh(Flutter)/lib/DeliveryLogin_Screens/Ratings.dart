import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:language_page/DeliveryLogin_Screens/Graph.dart';
import 'package:language_page/DeliveryLogin_Screens/Notification.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RatingPage(),
    );
  }
}

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final RatingChart ratingChart = RatingChart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            //borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: AppBar(
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
        title:  Text(
          "Rating",
          style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 26, 77, 28),
                    ),
        ),
      
        centerTitle: true,
        actions: [
          // Notification icon with subtle animation effect
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const NotificationPage();
                            }));
                          },
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              const Icon(
                                Icons.notifications_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                              Positioned(
                                right: 4,
                                top: 4,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15,)
                      ],
                    ),
        ],
      ),
        )
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Icon(
                    index < 4 ? Icons.star : Icons.star_border,
                    color: Colors.orange,
                    size: 40,
                  );
                }),
              ),
              const SizedBox(height: 15),
              Container(
                height: 35,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.blueGrey[900],
                ),
                child: const Center(
                  child: Text(
                    "4.0",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Thank you for delivering with us!",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              const Row(
                children: const [
                  Text(
                    "Rating Over Time:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: ratingChart,
              ),
              const SizedBox(height: 30),
              const Row(
                children: const [
                  Text(
                    "Rating Breakdown:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Table(
                border: TableBorder.all(color: Colors.green.shade300),
                children: [
                  _buildTableRow("5 Stars", "120", Colors.lightGreen.shade50),
                  _buildTableRow("4 Stars", "80", Colors.lightGreen.shade50),
                  _buildTableRow("3 Stars", "20", Colors.lightGreen.shade50),
                  _buildTableRow("2 Stars", "5", Colors.lightGreen.shade50),
                  _buildTableRow("1 Star", "3", Colors.lightGreen.shade50),
                ],
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String count, Color backgroundColor) {
    return TableRow(
      children: [
        Container(
          color: backgroundColor,
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.orange, size: 20),
              const SizedBox(width: 5),
              Text(
                label,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
          color: backgroundColor,
          padding: const EdgeInsets.all(12.0),
          child: Text(
            count,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class RatingDetail extends StatelessWidget {
  final String label;
  final String count;

  const RatingDetail({super.key, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(height: 5),
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
