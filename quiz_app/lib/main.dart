
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}
class QuizApp extends StatefulWidget{
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
  
}

class _QuizAppState extends State{
  List<Map> question=[
    {"Question":"What is the tallest animal in the world?",
    "options":["Elephant", "Giraffe", "Kangaroo","Zebra"],
    "correctans":1},

     {"Question":"How many legs does a spider have?",
    "options":["8","6","10","12"],
    "correctans":0},

     {"Question":"Which is the fastest land animal?",
    "options":["Lion","Tiger","Cheetah","Horse"],
    "correctans":2},

     {"Question":"Which planet is closest to the Sun?",
    "options":["Earth","Venus","Mercury","Saturn"],
    "correctans":2},

     {"Question":"What is the only bird that can fly backward?",
    "options":["Sparrow","Eagle","Hummingbird","Owl"],
    "correctans":2},

    ];

     int queno=0;
     int selectedans=-1;
     int score=0;
    

    WidgetStateProperty<Color?> checkans(int answeredoption){
      if(selectedans!=-1){
        if(answeredoption==question[queno]["correctans"]){
          return const WidgetStatePropertyAll(Colors.green);
        }else if(selectedans==answeredoption){
          return const WidgetStatePropertyAll(Colors.red);
        }else{
          return const WidgetStatePropertyAll(null);
        }
      }
      else{
        return const WidgetStatePropertyAll(null);
      }
    }

  
  bool quepage=true;

  @override
  Widget build(BuildContext context){
    return isQuestionScreen();
  }

    Scaffold isQuestionScreen(){
      if(quepage==true){
        return Scaffold(
        appBar: AppBar(
        title: const Text("Quiz App",style: TextStyle(
          fontSize: 24,
          fontWeight:FontWeight.w900 ,
        ),),
        backgroundColor:const Color.fromARGB(255, 213, 184, 55),
        centerTitle: true,
      ),
      body:Column(children: [
        const SizedBox(
        height: 50,
        width: 380,

      ),
      Row(children: [
        const SizedBox(
          width: 140,
        ),
           Text("Question : ${queno+1} / ${question.length} ",style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),),
      
      ],),
      const SizedBox(
        height: 50,
      ),
      Text("${question[queno]["Question"]}",style: const TextStyle(fontSize:19,fontWeight:FontWeight.w500,color:Colors.purple)),
      const SizedBox(
        height: 20,
      ),
      const SizedBox(
        height: 20,
      ),

      //option 1

       SizedBox(
        width: 380,
        height: 40,
      child: 
      ElevatedButton(style: ButtonStyle ( backgroundColor : checkans(0),),
      onPressed: (){
        if(selectedans==-1){
          selectedans=0;
          setState(() {}
          );
        }
        if(selectedans==question[queno]["correctans"]){
          score++;
        }
      }, 
      child:Text("1. ${question[queno]["options"][0]}",style: const TextStyle(fontSize:17,fontWeight:FontWeight.w500))
      ),
      ),
      const SizedBox(
        height: 20,
      ),

      //option 2

          SizedBox(
        width: 380,
        height: 40,
      child: 
      ElevatedButton(style: ButtonStyle ( backgroundColor : checkans(1),),
      onPressed: (){
        if(selectedans==-1){
          selectedans=1;
          setState(() {}
          );
        }
        if(selectedans==question[queno]["correctans"]){
          score++;
        }
      }, 
      child:Text("2. ${question[queno]["options"][1]}",style: const TextStyle(fontSize:17,fontWeight:FontWeight.w500))
      ),
      ),
      const SizedBox(
        height: 20,
      ),

      //option 3

      SizedBox(
        width: 380,
        height: 40,
      child: 
      ElevatedButton(style: ButtonStyle ( backgroundColor : checkans(2),),
      onPressed: (){
        if(selectedans==-1){
          selectedans=2;
          setState(() {}
          );
        }
        if(selectedans==question[queno]["correctans"]){
          score++;
        }
      }, 
      child:Text("3. ${question[queno]["options"][2]}",style: const TextStyle(fontSize:17,fontWeight:FontWeight.w500))
      ),
      ),
       const SizedBox(
        height:20,
      ),

      //option 4

          SizedBox(
        width: 380,
        height: 40,
      child: 
      ElevatedButton(style: ButtonStyle ( backgroundColor : checkans(3),),
      onPressed: (){
        if(selectedans==-1){
          selectedans=3;
          setState(() {}
          );
        }
        if(selectedans==question[queno]["correctans"]){
          score++;
        }
      }, 
      child:Text("4. ${question[queno]["options"][3]}",style: const TextStyle(fontSize:17,fontWeight:FontWeight.w500))
      ),
      ),
      ],
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        if(selectedans!=-1){
          if(queno<question.length-1){
          queno++;
        }else{
          quepage=false;
      }
      selectedans=-1;
      setState(() {
        });}
      },
      backgroundColor: Colors.lightGreen,
      child: const Icon(Icons.forward),
      ),
    ); 
  }

  else{
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App",style: TextStyle(
          fontSize: 24,
          fontWeight:FontWeight.w900 ,
        ),),
        backgroundColor:const Color.fromARGB(255, 213, 184, 55),
        centerTitle: true,
      ),
      body: Center(child:Column(children: [
        const SizedBox(
        height: 70,
        ),
       Image.asset("assets/quizimage1.jpg"),
      const SizedBox(
        height: 30,
        ),
        Text("Score : $score / ${question.length}",style:const  TextStyle(
          fontSize: 24,
          fontWeight:FontWeight.w900 ,
        ),
        ),
        const SizedBox(
        height: 30,
        ),
        Image.asset("assets/quizimage2.png",width: 400,height: 100),
      ],
      ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        quepage=true;
        setState(() {
        });
        queno=0;
        score=0;
      },
      backgroundColor: Colors.lightGreen,
      child: const Text("Reset",style: TextStyle(fontSize: 15,fontWeight:FontWeight.w500),),
      ),

      );
  }
    }
}