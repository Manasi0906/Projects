import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipl_teams/getPlayer_data.dart';
import 'package:ipl_teams/iplTeams.dart';
import 'package:ipl_teams/playerModel.dart';
import 'package:ipl_teams/signupScreen.dart';

class Auth_Inherited extends StatefulWidget {
  const Auth_Inherited({super.key});

  @override
  State<Auth_Inherited> createState() => _Auth_InheritedState();
}

TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  Map<String,dynamic> data={
                      "email":emailController.text,
                      "pass":passController.text,
                    };

class _Auth_InheritedState extends State<Auth_Inherited> {

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              const Center(child: Text("Login",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 22, 110, 182)),)),
              const SizedBox(height: 30,),
              const Text("Email",style: TextStyle(fontSize: 20),),
              const SizedBox(height: 5,),
              TextField(
                controller: emailController,
                decoration:const InputDecoration(border: OutlineInputBorder(),hintText: "Enter your email"),
              ),
              const SizedBox(height: 20,),
              const Text("Password",style: TextStyle(fontSize: 20),),
              const SizedBox(height: 5,),
              TextField(
                controller: passController,
                decoration:const InputDecoration(border: OutlineInputBorder(),hintText: "Enter your Password"),
              ),
              const SizedBox(height: 40,),
              
              const SizedBox(height: 20,),
              Center(
                child:GestureDetector(
                  onTap: ()async{
                    
                    try{
                      if(emailController.text.isNotEmpty && passController.text.isNotEmpty){
                    UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passController.text);
                    log("Authget:$userCredential");
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("User login Successfully")
                        ));

                        QuerySnapshot response = await FirebaseFirestore.instance.collection("IPLTeams").get();
                        Players.clear();
                        for(int i=0;i<response.docs.length;i++){

                           Players.add(Playermodel(playerName:response.docs[i]['name'], jersyno: response.docs[i]['jersyno'], teamName: response.docs[i]['team'],profilepic: response.docs[i]['profilepic']));
                        }
                        log("$Players");
                                  
                      emailController.clear();
                      passController.clear();
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const IPLTeams() ));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Fill all the feilds")
                        ));
                    }
                    } on FirebaseAuthException catch(authObj){
                    ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text("${authObj.message}")
                        ));
                    }
                   
                    // setState(() {  
                    // });
              
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(10)),
                     child:const Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                       child: const Text("Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                     )),
                ),
                ),
                const SizedBox(height: 320,),
                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? ",style: TextStyle(fontSize:16,fontWeight: FontWeight.w400),),
                GestureDetector(
                  onTap: (){
                    emailController.clear();
                    passController.clear();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                  const Signupscreen()
                  ));
                  setState(() {
                    });
                },
                  child:const Text("Sign up",style: TextStyle(fontSize:18,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 22, 110, 182) ),)),
              ],
                         )
            ],
          ),
        ),
      ),
    );
  }
}