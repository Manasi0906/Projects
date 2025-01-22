import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQPageDeliveryPerson extends StatelessWidget {
  final List<Map<String, String>> faqData = [
    {
      "question": "What is my role as a delivery person?",
      "answer":
          "As a delivery person, your role is to ensure the timely and safe delivery of products from the seller to the buyer. You'll track orders, update delivery statuses, and maintain customer satisfaction."
    },
    {
      "question": "How do I receive delivery orders?",
      "answer":
          "Orders will be assigned to you via the app. You can view new delivery tasks in the 'Assigned Orders' section, where you can accept or decline the task based on availability."
    },
    {
      "question": "How do I track the orders I need to deliver?",
      "answer":
          "You can track your orders through the 'Order Status' page in the app. This will provide details like the delivery address, order items, and estimated time of arrival."
    },
    {
      "question": "What if I face issues during delivery?",
      "answer":
          "If you encounter issues, such as a delay or difficulty finding the location, you can use the app's messaging feature to contact the buyer or the customer support team for assistance."
    },
    {
      "question": "How do I mark an order as delivered?",
      "answer":
          "After successfully completing a delivery, go to the 'Order Status' page and mark the order as delivered. This will update the system, and the buyer will receive a notification."
    },
    {
      "question": "Can I get feedback for my delivery?",
      "answer":
          "Yes, after each delivery, customers can rate your service. This feedback will be stored in your profile, helping you improve and maintain a good reputation."
    },
    {
      "question": "Is there any option for tips or additional payments?",
      "answer":
          "Depending on the platform's policy and customer satisfaction, you may receive tips or additional payments. The payment details will be available in the 'Payments' section of your profile."
    },
    {
      "question": "How do I update my availability?",
      "answer":
          "You can update your availability by going to the 'Profile' section and selecting your working hours. This will let the system know when you're available for new delivery assignments."
    },
    {
      "question": "Can I change my delivery route during the day?",
      "answer":
          "Yes, you can adjust your route based on customer instructions or if traffic conditions require changes. However, it's important to keep the buyer informed about any delays or changes."
    },
    {
      "question": "How do I handle payments during delivery?",
      "answer":
          "Payments are typically handled electronically via the app. However, in cases where cash on delivery is required, make sure to collect the exact amount from the customer and update the payment status in the app."
    },
    {
      "question": "What should I do if I am unable to complete a delivery?",
      "answer":
          "If you're unable to complete a delivery due to any issues, such as personal emergencies or vehicle breakdowns, notify customer support immediately, and they will assist you in resolving the situation."
    },
    {
      "question": "How can I update my profile information?",
      "answer":
          "Go to your profile settings to update your personal information, vehicle details, availability schedule, and payment preferences."
    },
    {
      "question": "How can I contact support if I face an issue?",
      "answer":
          "If you encounter any problems, contact the support team via the app’s Help section or use the messaging feature to get in touch with a supervisor for further assistance."
    },
  ];

  FAQPageDeliveryPerson({super.key});

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
        title: Text(
          "FAQs",
          style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 26, 77, 28),
                    ),
        ),
        centerTitle: true,
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
