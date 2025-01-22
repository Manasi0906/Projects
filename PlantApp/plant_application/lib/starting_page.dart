import 'package:flutter/material.dart';
import 'package:plant_application/login_page.dart';

void main(){
  return runApp(const plantApp());
}

class plantApp extends StatefulWidget {
  const plantApp({super.key});

  @override
  State<plantApp> createState() => _plantAppState();
}

class _plantAppState extends State<plantApp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        children: [
          Padding(
            padding:const EdgeInsets.only(top: 44),
           child: Container(
            height: 464,
            width: 360,
            child: Image.asset("assets/plant.png"),
            ),  
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: const Column(
              children: [
                Text("Enjoy your",style: TextStyle(fontSize: 34.22,fontWeight:FontWeight.w400),),
                Padding(
                  padding: EdgeInsets.only(right: 59),
                  child: Center(
                    child: Row(
                      children: [
                        Text("          life with ",style: TextStyle(fontSize: 34.22,fontWeight:FontWeight.w400),),
                        Text("Plants",style: TextStyle(fontSize: 34.22,fontWeight:FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
                ],
            ),
          ),
             const  SizedBox(
                height: 30,
              ),
               GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context){
                    return const login();
                  }));
                  setState(() {
                     });
                },
                 child: Container(
                  height:50 ,
                  width: 340,
                  decoration:const  BoxDecoration(gradient: LinearGradient(colors: [Color.fromRGBO(62,102,24,1),Color.fromRGBO(124,180,70,1)]),borderRadius: BorderRadius.all(Radius.circular(15))),
                  child:const Padding(
                    padding:  EdgeInsets.only(top: 15,bottom: 15,left: 52,right: 53),
                    child:  Text("Get Started >",style:TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ),
                 
                               ),
               )
                    ],

      ),
    );
  }
}