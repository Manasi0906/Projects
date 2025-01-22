import 'dart:convert';

import 'package:apibinding_app/deleteData.dart';
import 'package:apibinding_app/devicePage.dart';
import 'package:apibinding_app/postData.dart';
import 'package:apibinding_app/updateData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIBinding extends StatefulWidget {
  const APIBinding({super.key});

  @override
  State<APIBinding> createState() => _APIBindingState();
}

class _APIBindingState extends State<APIBinding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Binding",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: getData,
                      child: Container(
                      height: 70,
                      width: 250,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 197, 210),
                        border: Border.all(color: Colors.pink, width: 2),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child:const Center(
                        child: const Text("Get Data",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  GestureDetector(
                    onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return const PostData();
                      }));
                      },
                    
                    child:Container(
                      height: 70,
                      width: 250,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 197, 210),
                        border: Border.all(color: Colors.pink, width: 2),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child:const Center(
                        child: const Text("Post Data",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
        
              const SizedBox(height: 40,),
        
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return const UpdateData();
                      }));
                      },
                    child: Container(
                      height: 70,
                      width: 250,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 197, 210),
                        border: Border.all(color: Colors.pink, width: 2),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child:const Center(
                        child: const Text("Update Data",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  GestureDetector(
                    onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return const DeleteData();
                      }));
                      },
                    
                    child: Container(
                      height: 70,
                      width: 250,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 197, 210),
                        border: Border.all(color: Colors.pink, width: 2),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child:const Center(
                        child: const Text("Delete Data",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }

  void getData()async{
    Uri url= Uri.parse("https://api.restful-api.dev/objects");
    http.Response response =await http.get(url);
    List<dynamic> jsonData = json.decode(response.body);
    deviceList = jsonData;
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DevicePage()));

  }
}