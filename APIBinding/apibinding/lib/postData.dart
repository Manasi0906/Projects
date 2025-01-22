import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostData(),
    );
  }
}

class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {

  TextEditingController proNameController = TextEditingController();
  TextEditingController proPriceController = TextEditingController();
  TextEditingController proColorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Post Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: proNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Product Name",
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: proPriceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Product Price",
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: proColorController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Product Color",
                ),
              ),
              const SizedBox(height: 20,),

              GestureDetector(
                onTap: (){
                  postData();
                  proNameController.clear();
                  proPriceController.clear();
                  proColorController.clear();
                  setState(() {
                    
                  });
                },
                child: Container(
                  height: 40,
                  width: 120,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink,
                  ),
                  child: const Text("Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                  textAlign:TextAlign.center ,
                  ),
                ),
              )

            ],
          ),
        ),
      );
  }

  void postData() async {
    Uri url= Uri.parse("https://api.restful-api.dev/objects");
     Map data= {
      "name" : proNameController.text,
      "data" : {
        "price" : proPriceController.text,
        "color" : proColorController.text
      }
    };
    http.Response response= await http.post(url, body: json.encode(data), headers: {
      "content-type" : "application/json"
    });
    log("Response body: ${response.body}");
   
   
  }
}