import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_application/starting_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey:"AIzaSyBD5tqkOfcDbpdIRiSSTfsIjNyla9tzPg4" ,
   appId: "1:1012569642095:android:5ee5d43651f929bae9699a",
    messagingSenderId: "1012569642095", 
    projectId: "plantsapp-f4e65"));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: plantApp()
        );
  }
}
