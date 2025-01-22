import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:language_page/FarmerLogin_Screens/ProfileDetail.dart';
import 'package:language_page/FarmerLogin_Screens/ProfilePage.dart';
import 'package:language_page/FarmerLogin_Screens/farmer_homepage.dart';
import 'package:language_page/FarmerLogin_Screens/LeaderBoard.dart';
import 'package:language_page/FarmerLogin_Screens/uploadPage.dart';
import 'package:language_page/Login_Signup_Screen/LoginPageFarmer.dart';

import 'NewsPage.dart';

class HomePageFarmer extends StatefulWidget {
  const HomePageFarmer({super.key});

  @override
  _HomePageFarmerState createState() => _HomePageFarmerState();
}

class _HomePageFarmerState extends State<HomePageFarmer> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        color: Colors.green,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.military_tech,
                  size: 25,
                ),
                label: 'LeaderBoard'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.upload,
                  size: 25,
                ),
                label: 'Upload'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.newspaper,
                  size: 25,
                ),
                label: "News"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25,
                ),
                label: 'Profile'),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: const Color.fromARGB(255, 26, 77, 28),

          unselectedItemColor: Colors.white54,
          selectedIconTheme: const IconThemeData(
            color: Color.fromARGB(255, 26, 77, 28),
          ),
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green, // Background color of the navbar
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const FarmerHomePage();
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const LeaderBoard();
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const UploadPage();
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return const NewsPage();
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyProfilePage();
  }
}
