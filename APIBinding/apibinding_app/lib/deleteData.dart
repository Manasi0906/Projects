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
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Delete Product",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500,color: Colors.pink),),
              const SizedBox(height: 35,),
            TextField(
              controller: proIDController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Product ID",
              ),
            ),
            const SizedBox(height: 40),
            
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
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 244, 46, 112),
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
  Future<void> deleteItemById(String id) async{
   if(proIDController.text.isEmpty){
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter valid ID")
        ));
        return;
   }
   Uri url=Uri.parse('https://api.restful-api.dev/objects/$id');
   try{
    final respose = await http.delete(url);
    if(respose.statusCode == 200){
    proIDController.clear();
     ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text("from id $id product deleted successfully")
        ));
        log("id $id deleted");
    }
   }
   catch(e){
    log("error:$e");
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text("error:$e")
        ));

   }

  }
}