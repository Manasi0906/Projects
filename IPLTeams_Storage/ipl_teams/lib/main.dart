import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ipl_teams/frontPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(apiKey: "AIzaSyBwHCeSxDqi5TS7CJtXAoGgtOE0to-9Xj8", appId:"1:818813756874:android:63e44049c61652676adb33",
     messagingSenderId:"818813756874", projectId: "inheritedwidgeting", storageBucket: "inheritedwidgeting.firebasestorage.app")
    
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     home: FrontPage(),
    );
  }
}
