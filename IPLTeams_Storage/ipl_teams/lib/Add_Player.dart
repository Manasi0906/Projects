import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ipl_teams/getPlayer_data.dart';
import 'package:ipl_teams/iplTeams.dart';
import 'package:ipl_teams/playerModel.dart';

void main(){
    return runApp(const ipl_Players());
}

class ipl_Players extends StatefulWidget {
  const ipl_Players({super.key});

  @override
  State<ipl_Players> createState() => _ipl_PlayersState();
}

class _ipl_PlayersState extends State<ipl_Players> {

  TextEditingController nameController=TextEditingController();
  TextEditingController jersyNoController=TextEditingController();
  TextEditingController teamNameController=TextEditingController();

   XFile? selectedimg;
   String? selectedTeam;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Add Players"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: ()async{
                      ImagePicker imagePicker=ImagePicker();
                       selectedimg = await imagePicker.pickImage(source: ImageSource.gallery);
                       log("image: ${selectedimg!.name}");
                       print("hellooooo");
                       log(selectedimg!.path);
                       setState(() {                   
                       });
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration:const BoxDecoration(color:Colors.grey,shape: BoxShape.circle,),
                      child: selectedimg==null? Image.asset("assets/profile.webp"):
                      Image.file(File(selectedimg!.path)), 
                      ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text("Player Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(
                  height: 10,
                ),
                 TextField(
                  controller: nameController,
                  decoration:const InputDecoration(border: OutlineInputBorder(),hintText: "Enter Player Name"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Player jersy No.:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(
                  height: 10,
                ),
                 TextField(
                  controller: jersyNoController,
                  keyboardType:const TextInputType.numberWithOptions(),
                  decoration:const InputDecoration(border: OutlineInputBorder(),hintText: "Enter Player Jersy No."),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Player Team Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(
                  height: 10,
                ),
                //  TextField(
                //   controller: teamNameController,
                //   decoration:const InputDecoration(border: OutlineInputBorder(),hintText: "Enter Player Team Name"),
                // ),
                DropdownButtonFormField<String>(
                  value: selectedTeam,
                  items: ipl.map((team) {
                    return DropdownMenuItem<String>(
                      value: team,
                      child: Text(team),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTeam = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Select Team",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async{
                        if(nameController.text.isNotEmpty && jersyNoController.text.isNotEmpty && selectedTeam != null){
                          await FirebaseStorage.instance.ref().child("$selectedTeam/${nameController.text}")
                          .putFile(File(selectedimg!.path));
                           String Url=await FirebaseStorage.instance.ref().child("$selectedTeam/${nameController.text}").getDownloadURL();
                           log("Url: $Url");

                           Map<String,dynamic> data={
                            "name":nameController.text,
                            "jersyno":jersyNoController.text,
                            "team":selectedTeam,
                            "profilepic":Url
                           };
                           log("data: $data");

                           await FirebaseFirestore.instance.collection("IPLTeams").add(data);
                           nameController.clear();
                          jersyNoController.clear();
                          selectedimg=null;
                          selectedTeam = null;
                           
                          setState(() {
                             });

                        }
                        
                      }, 
                      style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll( Colors.blue)),
                      child: const Text("Add Player",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.black),),
                      ),
                      ElevatedButton(
                      onPressed: ()async{
                        QuerySnapshot response = await FirebaseFirestore.instance.collection("IPLTeams").get();
                        Players.clear();
                        for(int i=0;i<response.docs.length;i++){

                           Players.add(Playermodel(playerName:response.docs[i]['name'], jersyno: response.docs[i]['jersyno'], teamName: response.docs[i]['team'],profilepic: response.docs[i]['profilepic']));
                        }
                        log("$Players");
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return const IPLTeams();
                          })
                        );
                      }, 
                      style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll( Colors.blue)),
                      child: const Text("Teams",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.black),),
                      )
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}