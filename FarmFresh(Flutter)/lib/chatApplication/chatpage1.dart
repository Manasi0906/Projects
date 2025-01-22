import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/Product_individual.dart';
import 'package:language_page/Customer_Login_Screens/apple.dart';

bool isCustomer = true;
bool negotiationDone = false;

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final messageController = TextEditingController();
  final confirmPriceController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  String? errorMessage;

  void sendMessage() async {
    String message = messageController.text.trim();

    // Check if the message is empty
    if (message.isEmpty) {
      setState(() {
        errorMessage = 'Message cannot be empty.';
      });
      return;
    }

    // Validate message (must be "Yes", "No", or a numeric value)
    if (message.toLowerCase() != 'yes' &&
        message.toLowerCase() != 'no' &&
        double.tryParse(message) == null) {
      setState(() {
        errorMessage = 'You can only send "Yes", "No", or numeric values.';
      });
      return;
    }
    negotiationDone = false;

    setState(() {
      errorMessage = null;
    });

    final user = FirebaseAuth.instance.currentUser!;
    await _firestore.collection('messages').add({
      'text': message,
      'sender': user.email,
      'timestamp': FieldValue.serverTimestamp(),
    });

    messageController.clear();
  }

  void fillConfirmPrice() {
    // Get the price entered in the text field
    String enteredPrice = confirmPriceController.text.trim();

    // Check if the price is empty
    if (enteredPrice.isEmpty) {
      setState(() {
        errorMessage = 'Price cannot be empty.';
      });
      return;
    }

    // Attempt to parse the price as a double
    double? parsedPrice = double.tryParse(enteredPrice);

    if (parsedPrice == null) {
      setState(() {
        errorMessage = 'Invalid price. Please enter a numeric value.';
      });
      return;
    }

    // Store the parsed price in finalPrice and negotiatedPrice
    String finalPrice = enteredPrice; // Store as string for reference if needed
    negotiatedPrice = parsedPrice; // Store as double
    negotiationDone = true;

    setState(() {
      errorMessage = null; // Clear error message
    });

    // Clear the controller for further inputs
    confirmPriceController.clear();
    //Navigator.of(context).pop();

    // Optionally log the values
    print("Final Price: $finalPrice");
    print("Negotiated Price: $negotiatedPrice");
  }

  void showConfirmPriceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Price"),
          content: TextField(
            cursorColor: Colors.green,
            controller: confirmPriceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: 'Enter confirm price',
                errorText: errorMessage,
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                fillConfirmPrice();
                negotiationDone = true;
                Navigator.of(context).pop();
              },
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent, // Make AppBar transparent
              elevation: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
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
                        width: 8,
                      ),
                      const Text(
                        "Negotiate",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 26, 77, 28),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('messages')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final messages = snapshot.data!.docs;

                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final text = message.get('text') ??
                          'No message'; // Fetch 'text' field
                      final sender = message.get('sender') ??
                          'Unknown sender'; // Fetch 'sender' field
                      final user = FirebaseAuth.instance.currentUser;
                      final isMe = user != null &&
                          sender == user.email; // Null check for user

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: isMe
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 151, 221, 153),
                              ),
                              child: Center(
                                child: Text(
                                  text,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: isMe ? Colors.blue : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              sender,
                              style: TextStyle(
                                fontSize: 12,
                                color: isMe ? Colors.blue : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            if (isCustomer == false)
              GestureDetector(
                onTap: () {
                  showConfirmPriceDialog();
                },
                child: Container(
                  height: 40,
                  width: 120,
                  padding: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Confirm Price",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: TextFormField(
                cursorColor: Colors.green,
                controller: messageController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.red),
                  ),
                  hintText: 'Enter "Yes" / "No" or price',
                  focusColor: Colors.green,
                  errorText: errorMessage,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        sendMessage();
                      },
                      child: const Icon(Icons.send)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
