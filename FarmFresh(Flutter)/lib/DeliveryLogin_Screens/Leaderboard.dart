import 'dart:io';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:language_page/Customer_Login_Screens/YourProfile.dart';
import 'package:language_page/DeliveryLogin_Screens/Availiability_Schedule.dart';
import 'package:language_page/DeliveryLogin_Screens/Current_Rewards.dart';
import 'package:language_page/DeliveryLogin_Screens/DeliveryPersonProfile.dart';
import 'package:language_page/DeliveryLogin_Screens/Emergency_info.dart';
import 'package:language_page/DeliveryLogin_Screens/FAQS.dart';
import 'package:language_page/DeliveryLogin_Screens/Profile_Details.dart';
import 'package:language_page/DeliveryLogin_Screens/TermsandConditionsDeliveryPerson.dart';
import 'package:language_page/DeliveryLogin_Screens/emergencycontact.dart';
import 'package:language_page/DeliveryLogin_Screens/orders.dart';
import 'package:language_page/DeliveryLogin_Screens/vehicleInfo.dart';
import 'package:language_page/FarmerLogin_Screens/BankDetails.dart';
import 'package:language_page/FarmerLogin_Screens/ProfilePage.dart';
import 'package:language_page/Login_Signup_Screen/Asach.dart';
import 'package:language_page/Login_Signup_Screen/LoginPageDeliveryPerson.dart';

class DeliveryPersonProfilePage extends StatefulWidget {
  const DeliveryPersonProfilePage({super.key});

  @override
  State<DeliveryPersonProfilePage> createState() =>
      _MyDeliveryPersonProfilePageState();
}

class _MyDeliveryPersonProfilePageState
    extends State<DeliveryPersonProfilePage> {
  final ImagePicker imagePicker = ImagePicker();
  XFile? photo;

  Future<void> pickImage() async {
    photo = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  void initState() {
    orderDetails.length;
    pastOrders.length;
    super.initState();
    Future.delayed(Duration.zero, () async {
      await check("sham@gmail.com");
      setState(() {});
    });
    // loadDeliveryPersonProfile();
  }

  // void loadDeliveryPersonProfile() async {
  //   await check("sham@gmail.com");
  // }

  double pendingOrders = 40;

  double delivered = 15;
  double incompleted = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 1000,
          width: 300,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                height: 170,
                width: 300,
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
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/MyPhotoValid.jpg"),
                      radius: 40,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      signup_deliveryperson[0].Name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _buildDrawerOption(
                context,
                icon: Icons.person_outlined,
                label: "Profile Details",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeliveryPersonProfile1()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildDrawerOption(
                context,
                icon: Icons.account_balance,
                label: "Bank Details",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BankDetailsScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildDrawerOption(
                context,
                icon: Icons.schedule,
                label: "Availability Schedule",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AvailabilitySchedulePage()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildDrawerOption(
                context,
                icon: Icons.card_giftcard,
                label: "Incentives & Bonuses",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IncentivesBonusesPage()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildDrawerOption(
                context,
                icon: Icons.report,
                label: "Incident Report",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IncidentReportPage()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildDrawerOption(
                context,
                icon: Icons.report,
                label: "Vehicle Information",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VehicleInfoScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildDrawerOption(
                context,
                icon: Icons.report,
                label: "Emergency Contact",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmergencyContactScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildDrawerOption(
                context,
                icon: Icons.assignment,
                label: "Terms And Conditions",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsandconditionsPageDp()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildDrawerOption(
                context,
                icon: Icons.help_outline,
                label: "FAQs",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FAQPageDeliveryPerson()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildDrawerOption(
                context,
                icon: Icons.settings,
                label: "Setting",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                },
              ),
              const SizedBox(height: 40),
              // const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPageDeliveryPerson()),
                      (route) => false);
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: GestureDetector(
                  onTap: () {
                    const MyProfilePage().switchBottomSheet(context);
                  },
                  child: Container(
                    height: 35,
                    width: 150,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: const Text(
                      "Switch Account",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // onPressed: () {
      //         //     const MyProfilePage().switchBottomSheet(context);
      //   },
      appBar: AppBar(
        title: Text(
          "Delivery Profile",
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 26, 77, 28),
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.grey[300],
          ),
          Positioned(
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      GestureDetector(
                        onTap: pickImage,
                        child: CircleAvatar(
                          backgroundColor: Colors.blueGrey[50],
                          radius: 50,
                          backgroundImage: photo != null
                              ? FileImage(File(photo!.path))
                              : null,
                          child: photo == null
                              ? const Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                  size: 55,
                                )
                              : null,
                        ),
                      ),
                      Positioned(
                        right: 4,
                        bottom: 4,
                        child: GestureDetector(
                          onTap: pickImage,
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.black54,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    // "Manasi Jadhav",
                    signup_deliveryperson[0].Name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Orders Statistics',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "+10 since last week",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  //const SizedBox(height: 10),
                  // PieChart container with a fixed height
                  SizedBox(
                    height: 280, // Set a fixed height for the PieChart
                    child: PieChart(
                      PieChartData(
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 0,
                        centerSpaceRadius: 30,
                        sections: [
                          PieChartSectionData(
                            color: Colors.blue,
                            value: pendingOrders,
                            title: '$pendingOrders%',
                            radius: 80,
                            titleStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          PieChartSectionData(
                            color: Colors.yellow,
                            value: delivered,
                            title: '$delivered%',
                            radius: 80,
                            titleStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          // PieChartSectionData(
                          //   color: Colors.red,
                          //   value: (pastOrders.length).toDouble(),
                          //   title: '$delivered%',
                          //   radius: 80,
                          //   titleStyle: const TextStyle(
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.white,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.blue,
                            ),
                            SizedBox(width: 5),
                            Text("Active Orders")
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.yellow,
                            ),
                            SizedBox(width: 5),
                            Text("Past Orders")
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // const Row(
                  //   children: [
                  //     SizedBox(
                  //       width: 100,
                  //     ),
                  //     SizedBox(
                  //       child: Row(
                  //         children: [
                  //           CircleAvatar(
                  //             radius: 5,
                  //             backgroundColor: Colors.red,
                  //           ),
                  //           SizedBox(width: 5),
                  //           Text("Incomplete")
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   top: 480,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 30),
          //     child: Center(
          //       child: Container(
          //         height: 100,
          //         width: 350,
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(15),
          //         ),
          //         child: const Column(
          //           children: [
          //             SizedBox(height: 10),
          //             Text(
          //               "Available Orders",
          //               style: TextStyle(
          //                 fontSize: 15,
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.green,
          //               ),
          //             ),
          //             SingleChildScrollView(
          //               scrollDirection: Axis.vertical,
          //               child: Expanded(
          //                 child: OrderList(),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildDrawerOption(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 2, color: Colors.green)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            children: [
              Icon(icon, color: Colors.black),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomProgressIndicator extends StatelessWidget {
  final double userScore;
  final double maxScore = 100;

  const CustomProgressIndicator({super.key, required this.userScore});

  @override
  Widget build(BuildContext context) {
    double progress = userScore / maxScore;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CustomPaint(
            painter: ArcPainter(progress),
          ),
        ),
        Text(
          '${userScore.toInt()}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ArcPainter extends CustomPainter {
  final double progress;

  ArcPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    double angle = 2 * pi * progress;

    Paint baseArcPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    Paint progressArcPaint = Paint()
      ..color = const Color(0xFF1F2E58)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;

    canvas.drawCircle(center, radius, baseArcPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      angle,
      false,
      progressArcPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class DeliveryStatusIndicator extends StatelessWidget {
  final String label;
  final Color color;

  const DeliveryStatusIndicator(
      {super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        const SizedBox(width: 5),
        Text(label),
      ],
    );
  }
}

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder widget to simulate a list of available orders.
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        child: Text(
          "Order #12345\nOrder #12346",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
