
import 'package:flutter/material.dart';
import 'package:ipl_teams/loginScreen.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [

          const SizedBox(height: 250,),
          Image.asset("assets/logo ipl.png"),
          const SizedBox(height: 220,),
          GestureDetector(
            onTap: (){
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return const Auth_Inherited();
                          })
                        );
            },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.blue),
              child:const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 12),
                child: const Text("Get Started >>",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
              ),
              
            ),
          )
        ],
      ),

    );
  }
}