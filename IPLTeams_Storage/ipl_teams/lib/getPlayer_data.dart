import 'package:flutter/material.dart';
import 'package:ipl_teams/playerModel.dart';

 List<LinearGradient> teamGradients =const [
    LinearGradient(colors: [Colors.blue, Color.fromARGB(255, 232, 216, 216)]),
    LinearGradient(colors: [Colors.purple, Colors.orangeAccent]),
    LinearGradient(colors: [Colors.yellow, Colors.orange]),
    LinearGradient(colors: [Color.fromARGB(255, 58, 118, 221), Colors.orangeAccent]),
    LinearGradient(colors: [Colors.red, Colors.black]), // Custom blue gradient
    LinearGradient(colors: [Colors.blue, Colors.red]),
    LinearGradient(colors: [Color.fromARGB(255, 18, 90, 150), Color.fromARGB(255, 234, 220, 220)]),
    LinearGradient(colors: [Color.fromARGB(255, 139, 198, 247), Colors.red]), // Custom light blue gradient
  ];

List<Playermodel> Players=[];
class Getdata extends StatelessWidget {
  final String teamName;
  final List players;
  const Getdata({super.key,
  required this.teamName,
  required this.players
  });


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const  Text("Team Members"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body:ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index){
          return  Padding(
            padding: const EdgeInsets.all(10),
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 17, 143, 247),width: 1.5),borderRadius: BorderRadius.circular(15),color: const Color.fromARGB(255, 201, 226, 247)),
                  child: Row(
                    children: [
                      const SizedBox(width: 15,),
                      Container(
                        height: 70,
                        width: 70,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all()),
                        child: Image.network(players[index].profilepic,fit: BoxFit.contain,),
                      ),
                      const SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          Text("Name of Player: ${players[index].playerName}",style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          Text("Jersy No of Player:  ${players[index].jersyno}",style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          Text("Team: ${players[index].teamName}",style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          const Padding(padding: EdgeInsets.only(bottom:10)),
                        ],
                      ),
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
