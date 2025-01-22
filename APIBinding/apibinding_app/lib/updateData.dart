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
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             const Text("Update Product",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500,color: Colors.pink),),
              const SizedBox(height: 35,),
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
            const SizedBox(height: 40),
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
                  // border: Border.all(),
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

  Future<void> updateMyData(Map<String,dynamic> postList,String id) async{
    Uri url= Uri.parse("https://api.restful-api.dev/objects/$id");
    Map<String,String> headers= {"Content-Type": "application/json"};

    try{
      http.Response response =await http.patch(
        url,
        headers: headers,
        body: jsonEncode(postList),
      );

      if(response.statusCode==200 || response.statusCode==204){
        proIDController.clear();
        proNameController.clear();
        proPriceController.clear();
        proColorController.clear();
        log("updated data:${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Data Updated Successfully")
        ));

      }
    }
    catch(e){
      log("error: $e");
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text("error: $e")
        ));
    }
    

  }
}
