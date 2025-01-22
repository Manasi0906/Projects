import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateData extends StatefulWidget {
  const UpdateData({super.key});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  // Controllers for text input fields
  final TextEditingController proNameController = TextEditingController();
  final TextEditingController proIDController = TextEditingController();
  final TextEditingController proPriceController = TextEditingController();
  final TextEditingController proColorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 190, 84, 208),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: proIDController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Product ID",
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: proNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Product Name",
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: proPriceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Product Price",
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: proColorController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Product Color",
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (proIDController.text.trim().isEmpty ||
                    proNameController.text.isEmpty ||
                    proPriceController.text.isEmpty ||
                    proColorController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("All fields are required!")),
                  );
                  return;
                }

                // Create a map with the data to be updated
                Map<String, dynamic> data = {
                  "name": proNameController.text,
                  "data": {
                    "price": proPriceController.text,
                    "color": proColorController.text,
                  },
                };

                
                updateMyData(data, proIDController.text.trim());
              },
              child: Container(
                height: 40,
                width: 120,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 190, 84, 208),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to update data
  Future<void> updateMyData(Map<String, dynamic> postList, String id) async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects/$id");
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    try {
      // Send PATCH request to update data
      http.Response response = await http.patch(
        url,
        headers: headers,
        body: jsonEncode(postList),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        proColorController.clear();
        proIDController.clear();
        proNameController.clear();
        proPriceController.clear();
        log("Data updated successfully: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Data updated successfully!")),
        );
      } 
    } catch (e) {
      log("Error updating data: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error updating data: $e")),
      );
    }
  }

}