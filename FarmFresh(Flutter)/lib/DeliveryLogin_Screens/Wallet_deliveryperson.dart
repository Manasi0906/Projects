import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const WalletApp());
}

class WalletApp extends StatelessWidget {
  const WalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WalletPageDeliveryPerson(),
    );
  }
}

class WalletPageDeliveryPerson extends StatefulWidget {
  const WalletPageDeliveryPerson({super.key});

  @override
  State<WalletPageDeliveryPerson> createState() =>
      _WalletPageDeliveryPersonState();
}

class _WalletPageDeliveryPersonState extends State<WalletPageDeliveryPerson> {
  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, String>>> incomeData = {
      'January 2024': [
        {'orderNo': '1001', 'date': '01 Jan', 'amount': '₹200'},
        {'orderNo': '1002', 'date': '12 Jan', 'amount': '₹150'},
        {'orderNo': '1003', 'date': '23 Jan', 'amount': '₹250'},
        {'orderNo': '1004', 'date': '25 Jan', 'amount': '₹250'},
        {'orderNo': '1005', 'date': '29 Jan', 'amount': '₹250'},
      ],
      'February 2024': [
        {'orderNo': '1006', 'date': '05 Feb', 'amount': '₹180'},
        {'orderNo': '1007', 'date': '18 Feb', 'amount': '₹220'},
        {'orderNo': '1008', 'date': '25 Feb', 'amount': '₹260'},
        {'orderNo': '1009', 'date': '27 Feb', 'amount': '₹260'},
      ],
      'March 2024': [
        {'orderNo': '1010', 'date': '02 Mar', 'amount': '₹300'},
        {'orderNo': '1011', 'date': '14 Mar', 'amount': '₹290'},
        {'orderNo': '1012', 'date': '17 Mar', 'amount': '₹340'},
        {'orderNo': '1013', 'date': '19 Mar', 'amount': '₹340'},
        {'orderNo': '1014', 'date': '28 Mar', 'amount': '₹340'},
      ],
      'April 2024': [
        {'orderNo': '1015', 'date': '03 Apr', 'amount': '₹250'},
        {'orderNo': '1016', 'date': '09 Apr', 'amount': '₹200'},
        {'orderNo': '1017', 'date': '12 Apr', 'amount': '₹240'},
        {'orderNo': '1018', 'date': '19 Apr', 'amount': '₹340'},
        {'orderNo': '1019', 'date': '30 Apr', 'amount': '₹240'},
      ],
      'May 2024': [
        {'orderNo': '1020', 'date': '02 May', 'amount': '₹320'},
        {'orderNo': '1021', 'date': '14 May', 'amount': '₹290'},
        {'orderNo': '1022', 'date': '17 May', 'amount': '₹180'},
        {'orderNo': '1023', 'date': '19 May', 'amount': '₹200'},
        {'orderNo': '1024', 'date': '28 May', 'amount': '₹340'},
      ],
    };

    int calculateTotal(Map<String, List<Map<String, String>>> data) {
      return data.values.expand((month) => month).fold(
          0,
          (sum, entry) =>
              sum + int.parse(entry['amount']!.replaceAll('₹', '')));
    }

    final int totalIncome = calculateTotal(incomeData);

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
          child:AppBar(
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
        title: Text(
          "Wallet",
          style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color:const  Color.fromARGB(255, 26, 77, 28),
                    ),
        ),
        centerTitle: true,
      ),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monthly Income Summary',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: incomeData.keys.length,
                itemBuilder: (context, index) {
                  String month = incomeData.keys.elementAt(index);
                  List<Map<String, String>> entries = incomeData[month]!;

                  int monthlyTotal = entries.fold(
                      0,
                      (sum, entry) =>
                          sum +
                          int.parse(entry['amount']!.replaceAll('₹', '')));

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            month,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: entries.map((entry) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Order No: ${entry['orderNo']}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    entry['date']!,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    entry['amount']!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                          const Divider(color: Colors.grey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total:',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '₹$monthlyTotal',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Income',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Text(
                    '₹$totalIncome',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
