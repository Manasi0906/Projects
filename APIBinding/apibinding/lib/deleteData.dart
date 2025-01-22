import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as  http;

class DeleteData extends StatefulWidget {
  const DeleteData({super.key});

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  final TextEditingController proIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Delete Data",
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
            
            GestureDetector(
              onTap: () {
                final id = proIDController.text.trim();
                deleteItemById(id);
                
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

   Future<void> deleteItemById(String id) async {
    if (id.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid ID.')),
      );
      return;
    }

    final url = Uri.parse('https://api.restful-api.dev/objects/$id'); // Replace with your API URL
    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        proIDController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Item with ID $id deleted successfully!')),
        );
        log("Item with ID $id deleted successfully!");
      } 
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting item: $e')),
      );
    }
  }
}