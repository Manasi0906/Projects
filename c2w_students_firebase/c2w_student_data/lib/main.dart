import 'dart:developer';
import 'package:c2w_student_data/getData.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(apiKey: "AIzaSyBI7UeTyD4sC43whAeX4IMrDX-_PdMsCC8", appId: "1:169046416908:android:999c4da97dae1a2c3ed829",
     messagingSenderId: "169046416908", projectId: "c2wstudents-cb055")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: C2w_students(),
    );
  }
}

class C2w_students extends StatefulWidget {
  const C2w_students({super.key});

  @override
  State<C2w_students> createState() => _C2w_studentsState();
}

class _C2w_studentsState extends State<C2w_students> {

  TextEditingController nameController=TextEditingController();
  TextEditingController clgController=TextEditingController();
  TextEditingController courseController=TextEditingController();

  Map couseData={};
  bool isoffline=true;
  List studData=[];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Core2Web Student Data",style: TextStyle(color: Colors.red),),
        centerTitle: true,
        backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Name:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                TextField(
                  controller: nameController,
                  decoration:const InputDecoration(border: OutlineInputBorder(),hintText: "Enter Your Name:"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Collage Name:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                TextField(
                  controller: clgController,
                  decoration:const InputDecoration(border: OutlineInputBorder(),hintText: "Enter Your Collage Name:"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 0,
                  child: Text("Enrolled Courses: $couseData",style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                  ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Courses:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                TextField(
                  controller: courseController,
                  decoration:const InputDecoration(border: OutlineInputBorder(),hintText: "Enter Couse Name:"),
                ),
                const SizedBox(
                  height: 20,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      ElevatedButton(
                        onPressed: (){
                          isoffline=true;
                          setState(() {
                            
                          });
                        },
                       style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(
                          isoffline==true ?const Color.fromARGB(255, 248, 227, 165):Colors.white,
                       )),
                       child:const Text("Offline")
                       ),
                        ElevatedButton(
                        onPressed: (){
                          isoffline=false;
                          setState(() {
                            
                          });
                        },
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(
                          isoffline==false ?const Color.fromARGB(255, 248, 227, 165):Colors.white,
                       )),
                       child:const Text("Online")),
                       
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: (){
                      if(courseController.text.isNotEmpty){
                        String mode="";
                        if(isoffline){
                          mode="offline";
                        }else{
                          mode="online";
                        }
                        couseData[courseController.text]=mode;
                        courseController.clear();
                        setState(() {
                          
                        });
                        print("add");
                      }
                    }, 
                    child:const Text("Add Course")),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: ()async{
                        if(nameController.text.isNotEmpty && clgController.text.isNotEmpty && 
                        couseData.isNotEmpty){
                        Map<String,dynamic> data={
                          "name":nameController.text,
                          "clg":clgController.text,
                          "course":couseData,
                        };

                         DocumentReference docref=await FirebaseFirestore.instance
                        .collection("c2w_Student_Data").add(data);
                        
                        nameController.clear();
                        clgController.clear();
                        couseData.clear();
                        
                        setState(() {
                          
                        });
                        log("DocRef: $docref");
                        }
                      },
    
                       child: const Text("Add Data")),
                    ElevatedButton(
                      onPressed: ()async{
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return const Getdata();
                          })
                        );
                       
                        },
                      
                       child: const Text("Get Data"))

                  ],
                  )
          
              ],
            ),
          ),
        ),
    );
  }
}