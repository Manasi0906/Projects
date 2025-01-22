import 'package:flutter/material.dart';

class DeliveryPersonProfile extends StatefulWidget {
  const DeliveryPersonProfile({super.key});

  @override
  State<DeliveryPersonProfile> createState() => _DeliveryPersonProfileState();
}

class _DeliveryPersonProfileState extends State<DeliveryPersonProfile> {
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
          "News",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 26, 77, 28),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          child: const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              "https://tse2.mm.bing.net/th?id=OIP.ENIN8L2HjOG7nogJc7KrvQHaHw&pid=Api&P=0&h=220"), // Add the image URL here
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Manasi Jadhav",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "Delivery Specialist",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Profile Details in Tabular Format
                  ProfileTable(
                    data: {
                      "Contact Number": "123-456-7890",
                      "Email": "john.doe@example.com",
                      "Address": "1234 narhe, pune, Maharastra",
                      "Vehicle Type": "Bike",
                      "Vehicle Number": "MH11 4550",
                      "License Number": "DL123456789",
                      "Years of Experience": "3 years",
                      "Average Rating": "4.0 / 5.0",
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Dedicated and reliable delivery professional with over 3 years of experience in providing excellent customer service and timely deliveries.",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTable extends StatelessWidget {
  final Map<String, String> data;

  const ProfileTable({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(0.7),
        1: FlexColumnWidth(1),
      },
      children: data.entries
          .map(
            (entry) => TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    entry.value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
