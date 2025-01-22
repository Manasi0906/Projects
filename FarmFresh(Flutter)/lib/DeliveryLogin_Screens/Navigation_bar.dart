import 'package:language_page/DeliveryLogin_Screens/Leaderboard.dart';
import 'package:language_page/DeliveryLogin_Screens/Ratings.dart';
import 'package:language_page/DeliveryLogin_Screens/Wallet_deliveryperson.dart';

import 'package:flutter/material.dart';
import 'package:language_page/DeliveryLogin_Screens/orders.dart';

class HomePageDeliveryPerson extends StatefulWidget {
  const HomePageDeliveryPerson({super.key});

  @override
  _HomePageDeliveryPersonState createState() => _HomePageDeliveryPersonState();
}

class _HomePageDeliveryPersonState extends State<HomePageDeliveryPerson> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4()
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            label: 'Rating',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: const Color.fromARGB(255, 19, 101, 22),
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return DeliveryPerson_HomePage();
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const RatingPage();
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const WalletPageDeliveryPerson();
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeliveryPersonProfilePage();
  }
}
