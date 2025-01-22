import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FAQPage(),
    );
  }
}

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqData = [
    {
      "question": "What is this app about?",
      "answer":
          "This app is a digital marketplace connecting farmers directly with customers and distributors. It allows farmers to list their products, negotiate prices with buyers, and receive ratings and rankings on a leaderboard based on customer feedback."
    },
    {
      "question": "How do I create an account?",
      "answer":
          "Simply download the app and select your role (Farmer, Buyer, or Distributor) on the registration page. Fill in the required details, verify your account, and you're ready to start!"
    },
    {
      "question": "How does the negotiation feature work?",
      "answer":
          "The negotiation feature allows buyers to directly communicate with farmers to discuss pricing. When you are interested in a product, click on the Negotiate button to send your offer to the farmer, who can accept or counter the offer."
    },
    {
      "question": "How does the leaderboard work for farmers?",
      "answer":
          "Farmers are ranked based on factors such as customer ratings, responsiveness, and sales volume. This helps farmers track their performance and reputation, and customers can find reliable sellers based on these ratings."
    },
    {
      "question": "How do I find products I want to buy?",
      "answer":
          "You can browse through the product categories on the home page or use the search function to find specific products. Once you find a product you're interested in, you can view the details, negotiate if desired, or proceed to purchase."
    },
    {
      "question": "Can I communicate directly with the farmers?",
      "answer":
          "Yes, the app has a built-in messaging feature that allows buyers and distributors to communicate directly with farmers for negotiations or general inquiries about the product."
    },
    {
      "question": "Is there a delivery option for the products?",
      "answer":
          "Delivery options depend on the availability and preference of the farmer and distributor. During the purchase process, you can check delivery options and estimated times provided by the seller or coordinate for pickup if available."
    },
    {
      "question": "How is the payment process handled?",
      "answer":
          "Payments can be made through secure methods integrated within the app. Depending on your region, options may include credit/debit cards, online wallets, or cash on delivery where applicable."
    },
    {
      "question": "How do I leave feedback for a farmer?",
      "answer":
          "After a successful purchase, you’ll have an option to rate and review the farmer based on product quality, communication, and overall satisfaction. This rating will contribute to the farmer's leaderboard ranking."
    },
    {
      "question": "Can I track my orders?",
      "answer":
          "Yes, the app provides an order-tracking feature where you can monitor the status of your orders, including shipping updates if delivery is involved."
    },
    {
      "question": "How can I change my profile information?",
      "answer":
          "Go to your profile settings, where you can edit details like your name, contact information, address, and payment preferences."
    },
    {
      "question": "What should I do if I have a problem with an order?",
      "answer":
          "If you encounter any issues, you can contact the farmer directly through the app’s messaging feature. For additional support, you can also reach out to our customer support team under the Help section."
    },
  ];

  FAQPage({super.key});

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
          "FAQs",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 26, 77, 28),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: faqData.length,
        itemBuilder: (context, index) {
          return FAQTile(
            question: faqData[index]["question"]!,
            answer: faqData[index]["answer"]!,
          );
        },
      ),
    );
  }
}

class FAQTile extends StatefulWidget {
  final String question;
  final String answer;

  const FAQTile({super.key, required this.question, required this.answer});

  @override
  _FAQTileState createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(widget.question),
        trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.answer),
          ),
        ],
      ),
    );
  }
}
