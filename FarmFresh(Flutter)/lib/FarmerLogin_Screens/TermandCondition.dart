import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/PreOrder.dart';
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
      home: TermsandconditionsPage(),
    );
  }
}

class TermsandconditionsPage extends StatefulWidget {
  const TermsandconditionsPage({super.key});

  @override
  State<TermsandconditionsPage> createState() => _TermsandconditionsPageState();
}

class _TermsandconditionsPageState extends State<TermsandconditionsPage> {
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
        title:FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Terms and Conditions"),
              builder: (context, snapshot) {
                return Text(snapshot.data ??"Terms and Conditions", style:const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 26, 77, 28)),
                );
              },
            ),
        // title: const Text(
        //   "Terms and Conditions",
        //   style: TextStyle(
        //     fontSize: 23,
        //     fontWeight: FontWeight.bold,
        //     color: Color.fromARGB(255, 26, 77, 28),
        //   ),
        // ),
      ),
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("Terms and Conditions for farmer"),
              builder: (context, snapshot) {
                return Text(snapshot.data ??"Terms and Conditions for farmer", style:const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green),
                );
              },
            ),
                // Text(
                //   "Terms and Conditions for Farmers",
                //   style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.green),
                // ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Welcome to our Farmer Marketplace App. Please carefully read these Terms and Conditions before using the platform. By registering as a farmer and listing your products for sale, you agree to comply with these terms.",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "1. Acceptance of Terms",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const Text(
                  "By using this app, you agree to these Terms and Conditions in full. If you disagree with any part of these terms, you should not use the platform.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    //color: Colors.green
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "2. Farmer Eligibility",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const Text(
                  "Farmers must be at least 18 years old and comply with any legal or regulatory requirements applicable to the sale of agricultural products in their region.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    //color: Colors.green
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "3. Account Registration",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const Text(
                  "Farmers must provide accurate information during registration, including their name, contact information, and any required verification documents. Misrepresentation or inaccurate information may result in account suspension or termination.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    //color: Colors.green
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "4. Product Listing and Pricing",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const Text(
                  "Farmers can list their products for sale, set prices, and manage inventory through the app.All product listings must be accurate, honest, and comply with quality standards. Misleading descriptions or counterfeit items are strictly prohibited.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    //color: Colors.green
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "5. Negotiation and Communication with Buyers",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const Text(
                  "The app includes a negotiation feature that allows buyers to submit offers for products. Farmers can accept, decline, or counter these offers.Farmers are responsible for responding promptly to negotiation requests and ensuring clear communication with buyers.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    //color: Colors.green
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "6. Sales Commission and Service Fee",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const Text(
                  "A service fee of X% (replace with the actual percentage) is deducted from each successful sale transaction made through the app. This fee covers platform maintenance, customer support, and other operational costs.The net amount after the service fee deduction will be credited to the farmer's account as per the payment schedule outlined in Section 7.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    //color: Colors.green
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "7. Payment Processing",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const Text(
                  "Payment for each sale, minus the service fee, will be processed and transferred to the farmer’s registered bank account within Y days (replace with the actual number of days) after the successful completion of the sale.It is the farmer’s responsibility to ensure that the payment details provided are accurate and up-to-date. The app is not liable for failed transfers due to incorrect information.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    //color: Colors.green
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "8. Refunds and Cancellations",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const Text(
                  "In cases where a buyer requests a refund or cancels an order, farmers must comply with the app’s refund policies. If a product fails to meet quality or description standards, farmers may be liable for refunding the buyer.The app reserves the right to deduct additional charges for refunds, returns, or disputes as necessary.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    //color: Colors.green
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "9. Leaderboard and Ranking System",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const Text(
                  "The app features a leaderboard ranking system based on customer feedback, sales performance, and responsiveness. This system is designed to reward high-performing farmers, but the app does not guarantee any specific ranking or increase in visibility.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    //color: Colors.green
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "10. Contact Information",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const Text(
                  "For questions, support, or further information regarding these Terms and Conditions, please reach out to us at [support email or contact info].",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    //color: Colors.green
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}