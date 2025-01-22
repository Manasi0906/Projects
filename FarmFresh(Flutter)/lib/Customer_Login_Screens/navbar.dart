import 'package:flutter/material.dart';

import 'package:language_page/Customer_Login_Screens/Basket.dart';
import 'package:language_page/Customer_Login_Screens/ProfilePage.dart';
import 'package:language_page/Customer_Login_Screens/category_home_page.dart';
import 'package:language_page/Customer_Login_Screens/home_customer.dart';

class NavBarPage extends StatefulWidget {
  final int initialIndex;

  const NavBarPage({super.key, this.initialIndex = 0});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  late int _selectedIndex;

  final List<Widget> _screens = [
    const PageForNavbarOne(),
    const PageForNavbarTwo(),
    const PageForNavbarThree(),
    const PageForNavbarFour(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    profileBasket=false;
  }

  void _onItemTapped(int index) {
    setState(() {
      profileBasket=false;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_sharp),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Basket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 19, 101, 22),
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PageForNavbarOne extends StatelessWidget {
  const PageForNavbarOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePageApp();
  }
}

class PageForNavbarTwo extends StatelessWidget {
  const PageForNavbarTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryHomePage();
  }
}

class PageForNavbarThree extends StatelessWidget {
  const PageForNavbarThree({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BasketPage();
  }
}

class PageForNavbarFour extends StatelessWidget {
  const PageForNavbarFour({super.key});

  @override
  Widget build(BuildContext context) {
    return  ProfilePage();
  }
}
