import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Getdata extends StatefulWidget {
  const Getdata({super.key});

  @override
  State<Getdata> createState() => _GetdataState();
}

class _GetdataState extends State<Getdata> {
  List StudentData=[];

  void initState(){
    super.initState();
    fetchdata();
  }

  void fetchdata() async{
    QuerySnapshot response=await FirebaseFirestore.instance.collection("c2w_Student_Data").get();
    StudentData=response.docs;
    log("response $response");
    setState(() {
       });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("c2w Student Data"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body:ListView.builder(
        itemCount: StudentData.length,
        itemBuilder: (context, index){
          return  Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: (){
                FirebaseFirestore.instance.collection("c2w_Student_Data")
                .doc(StudentData[index].id).delete();
                StudentData.removeAt(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("student data deleted")));
                    setState(() {
                      
                    });
              },
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Text("name: ${StudentData[index]['name']}"),
                    Text("college name:  ${StudentData[index]['clg']}"),
                    Text("courses:  ${StudentData[index]['course']}"),
                    const Padding(padding: EdgeInsets.only(bottom:10)),
                  ],
                ),
              ),
            ),
            
            );
        },
        )
      
    );
  }
  }