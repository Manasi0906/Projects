import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ipl_teams/Add_Player.dart';
import 'package:ipl_teams/getPlayer_data.dart';
import 'package:ipl_teams/playerModel.dart';

void main(){
    return runApp(const IPLTeams());
}

class IPLTeams extends StatefulWidget {
  const IPLTeams({super.key});

  @override
  State<IPLTeams> createState() => _IPLTeamsState();
}

List<String> ipl=[
    "Mumbai Indians","Kolkata Knight Riders","Chennai Super King","Rajasthan Royals",
    "Royal Challengers Bengaluru","Delhi Capitals","Gujarat Titans","Lucknow Super Giants"
  ];

class _IPLTeamsState extends State<IPLTeams> {

  List PlayerData=[];

  void initState(){
    super.initState();
    // fetchdata();
  }

  void fetchdata() async{
    QuerySnapshot response=await FirebaseFirestore.instance.collection("IPLTeams").get();
    for(var doc in response.docs){
      PlayerData.add(Playermodel(playerName: doc['playerName'], jersyno: doc['jersyNo'], teamName: doc['teamName'],profilepic: doc['profilepic']));
    }
    log("PlayerData: $PlayerData");
  }


  List images=[
    "assets/mi.jpeg",
    "assets/KKR.jpg",
    "assets/CSK.webp",
    "assets/rajastan royals.jpg" ,
    "assets/RCB.jpeg",
    "assets/dc.jpg",
    "assets/gt.jpg",
    "assets/lsg.jpg",
  ];

  final List<LinearGradient> teamGradients =const [
    LinearGradient(colors: [Colors.blue, Color.fromARGB(255, 232, 216, 216)]),
    LinearGradient(colors: [Colors.purple, Colors.orangeAccent]),
    LinearGradient(colors: [Colors.yellow, Colors.orange]),
    LinearGradient(colors: [Color.fromARGB(255, 58, 118, 221), Colors.orangeAccent]),
    LinearGradient(colors: [Colors.red, Colors.black]), // Custom blue gradient
    LinearGradient(colors: [Colors.blue, Colors.red]),
    LinearGradient(colors: [Color.fromARGB(255, 18, 90, 150), Color.fromARGB(255, 234, 220, 220)]),
    LinearGradient(colors: [Color.fromARGB(255, 139, 198, 247), Colors.red]), // Custom light blue gradient
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("IPL Teams"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ipl.length,
              itemBuilder: (context,index){
                return  Padding(
                  padding:const EdgeInsets.all(15),
                  child: GestureDetector(
  onTap: () {
    print("$Players");
    
    // Filter players based on the condition
    List filteredPlayers = Players
        .where((player) => player.teamName == ipl[index])
        .toList();

    // Check if there are filtered players for the selected team
    if (filteredPlayers.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Getdata(
            teamName: ipl[index], 
            players: filteredPlayers,
          ),
        ),
      );
      
      // Log the filtered players for debugging
      log("Filtered Players for team ${ipl[index]}");
      for (var player in filteredPlayers) {
        log(' Team: ${player.teamName}');
      }
    } else {
      // Show a message if no players match the condition
      log("No players found for team ${ipl[index]}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No players found for team ${ipl[index]}')),
      );
    }
  },
                         
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: teamGradients[index]),
                      height: 100,
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              clipBehavior:Clip.antiAlias,
                              decoration:const BoxDecoration(shape: BoxShape.circle,),
                              child: Image.asset(images[index]),
                            ),
                            Text(ipl[index],textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                       
                      ),
                  )
                  );
              },),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return const ipl_Players();
                          })
                        ); 
        },
        backgroundColor: Colors.blue,
        child:const Icon(Icons.add,color: Colors.white,size: 35,),
        ),
    );
  }
}