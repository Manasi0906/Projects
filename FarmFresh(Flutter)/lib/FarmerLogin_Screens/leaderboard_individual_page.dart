import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_page/FarmerLogin_Screens/LeaderBoard.dart';
import 'package:language_page/FarmerLogin_Screens/YourProducts.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LeaderboardIndividualPage(),
    );
  }
}

class LeaderboardIndividualPage extends StatefulWidget {
  const LeaderboardIndividualPage({super.key});

  @override
  State<LeaderboardIndividualPage> createState() =>
      _LeaderboardIndividualPageState();
}

class _LeaderboardIndividualPageState extends State<LeaderboardIndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Farmer Details",
      //     style: GoogleFonts.quicksand(
      //         fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.green,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Changed to max to avoid layout issues
        children: [
          Stack(
            children: [
              Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
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
                                width: 40,
                              ),
                              FutureBuilder<String>(
                                future: context
                                    .read<LanguageProvider>()
                                    .translateText("Farmer Details"),
                                builder: (context, snapshot) {
                                  return Text(
                                    snapshot.data ?? "Farmer Details",
                                    style: GoogleFonts.inter(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromARGB(255, 26, 77, 28),
                                    ),
                                  );
                                },
                              ),
                              // Text(
                              //   "Farmer Details",
                              //   style: GoogleFonts.quicksand(
                              //     fontSize: 25,
                              //     fontWeight: FontWeight.bold,
                              //     color: Color.fromARGB(255, 26, 77, 28),
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Positioned(
                            bottom: 30,
                            left: 135,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  farmers[leaderIndex].imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Positioned(
                            bottom: 5,
                            left: 140,
                            child: Text(
                              farmers[leaderIndex].name,
                              style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          Center(
            child: FutureBuilder<String>(
              future: context
                  .read<LanguageProvider>()
                  .translateText("Farmer Details"),
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? "Farmer Details",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                );
              },
            ),
            // child: Text(
            //   "Total Sales Of Months",
            //   style: GoogleFonts.inter(
            //       fontSize: 15,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 250, // Fixed height for the BarChart
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 6,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          if (value.isNaN || value.isInfinite) {
                            return const Text(''); // Handle invalid values
                          }
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(color: Colors.black),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          if (value.isNaN || value.isInfinite) {
                            return const Text(''); // Handle invalid values
                          }
                          switch (value.toInt()) {
                            case 0:
                              return const Text('Jan',
                                  style: TextStyle(color: Colors.black));
                            case 1:
                              return const Text('Feb',
                                  style: TextStyle(color: Colors.black));
                            case 2:
                              return const Text('Mar',
                                  style: TextStyle(color: Colors.black));
                            case 3:
                              return const Text('Apr',
                                  style: TextStyle(color: Colors.black));
                            case 4:
                              return const Text('May',
                                  style: TextStyle(color: Colors.black));
                            case 5:
                              return const Text('Jun',
                                  style: TextStyle(color: Colors.black));
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(color: Color(0xff37434d), width: 4),
                      left: BorderSide(color: Color(0xff37434d), width: 4),
                    ),
                  ),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(toY: 5, color: Colors.blue, width: 20)
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(toY: 3, color: Colors.blue, width: 20)
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(toY: 4, color: Colors.blue, width: 20)
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(toY: 2, color: Colors.blue, width: 20)
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(toY: 6, color: Colors.blue, width: 20)
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(toY: 5, color: Colors.blue, width: 20)
                    ]),
                  ],
                ),
              ),
            ),
          ),

          // Space between the header and chart
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              FutureBuilder<String>(
                future: context
                    .read<LanguageProvider>()
                    .translateText("Top Selling Products:"),
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data ?? "Top Selling Products:",
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  );
                },
              ),
              // Text(
              //   "Top Selling Products:",
              //   style: GoogleFonts.inter(
              //       fontSize: 16,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.grey),
              // ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 20),
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        height: 140,
                        width: 340,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(blurRadius: 10, color: Colors.green)
                          ],
                          // color: Colors.amber,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      //color: Colors.pink,
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.network(
                                      products[index]['Image'],
                                      fit: BoxFit.cover,
                                    ),
                                    // child: Image.asset("assets/images/images.jpg",
                                    //     fit: BoxFit.cover),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FutureBuilder<String>(
                                    future: context
                                        .read<LanguageProvider>()
                                        .translateText("Mumbai"),
                                    builder: (context, snapshot) {
                                      return Text(
                                        snapshot.data ?? "Mumbai",
                                        style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                FutureBuilder<String>(
                                  future: context
                                      .read<LanguageProvider>()
                                      .translateText("Ordered By : Vikas Dole"),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ?? "Ordered By :Vikas Dole",
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.grey),
                                      ),
                                    );
                                  },
                                ),
                                // Text(
                                //   "Ordered By : Sumit Katkar",
                                //   style: GoogleFonts.inter(
                                //       fontSize: 13,
                                //       fontWeight: FontWeight.bold),
                                // ),
                                FutureBuilder<String>(
                                  future: context
                                      .read<LanguageProvider>()
                                      .translateText("Order No. : 101"),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ?? "Order No. : 101",
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.grey),
                                      ),
                                    );
                                  },
                                ),
                                // Text(
                                //   "Order No. : 101",
                                //   style: GoogleFonts.inter(
                                //       fontSize: 13,
                                //       fontWeight: FontWeight.bold),
                                // ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    FutureBuilder<String>(
                                      future: context
                                          .read<LanguageProvider>()
                                          .translateText("Qty"),
                                      builder: (context, snapshot) {
                                        return Text(
                                          snapshot.data ?? "Qty",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.grey),
                                          ),
                                        );
                                      },
                                    ),
                                    // Text(
                                    //   "Qty:",
                                    //   style: GoogleFonts.inter(
                                    //       fontSize: 12,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    FutureBuilder<String>(
                                      future: context
                                          .read<LanguageProvider>()
                                          .translateText("Amount"),
                                      builder: (context, snapshot) {
                                        return Text(
                                          snapshot.data ?? "Amount",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.grey),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    FutureBuilder<String>(
                                      future: context
                                          .read<LanguageProvider>()
                                          .translateText("Ordered on:"),
                                      builder: (context, snapshot) {
                                        return Text(
                                          snapshot.data ?? "Ordered on:",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.grey),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "2kg",
                                      style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 94, 87, 87)),
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      "70rs",
                                      style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 94, 87, 87)),
                                    ),
                                    const SizedBox(
                                      width: 42,
                                    ),
                                    Text(
                                      "15 Jun 10:45",
                                      style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 94, 87, 87)),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    FutureBuilder<String>(
                                      future: context
                                          .read<LanguageProvider>()
                                          .translateText("Order Status"),
                                      builder: (context, snapshot) {
                                        return Text(
                                          snapshot.data ?? "Order Status",
                                          style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        );
                                      },
                                    ),
                                    // Text(
                                    //   "Order Status",
                                    //   style: GoogleFonts.inter(
                                    //       fontSize: 12,
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Colors.black),
                                    // ),
                                    const SizedBox(
                                      width: 42,
                                    ),
                                    FutureBuilder<String>(
                                      future: context
                                          .read<LanguageProvider>()
                                          .translateText("Delivered On:"),
                                      builder: (context, snapshot) {
                                        return Text(
                                          snapshot.data ?? "Delivered On:",
                                          style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    FutureBuilder<String>(
                                      future: context
                                          .read<LanguageProvider>()
                                          .translateText("Delivered"),
                                      builder: (context, snapshot) {
                                        return Text(
                                            snapshot.data ?? "Delivered",
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 94, 87, 87),
                                            ));
                                      },
                                    ),
                                    // Text(
                                    //   "Delivered",
                                    //   style: GoogleFonts.inter(
                                    //       fontSize: 12,
                                    //       fontWeight: FontWeight.bold,
                                    //       color: const Color.fromARGB(
                                    //           255, 94, 87, 87)),
                                    // ),
                                    const SizedBox(
                                      width: 60,
                                    ),
                                    Text(
                                      "16 June 9.00AM",
                                      style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 94, 87, 87)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
