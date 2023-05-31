import 'package:flutter/material.dart';
import 'package:my_app/knocksense/explore.dart';
import 'package:my_app/knocksense/home_screen.dart';
import 'package:my_app/knocksense/knockoff.dart';
import 'package:my_app/knocksense/more.dart';
import 'package:my_app/knocksense/my_digest.dart';

class AppKnockSense extends StatefulWidget {
  const AppKnockSense({super.key});

  @override
  State<AppKnockSense> createState() => _AppKnockSenseState();
}

class _AppKnockSenseState extends State<AppKnockSense> {
  int selectedIndex = 0;
  final List<Widget> screen = [
    const Homescreen(),
    const Explore(),
    const ExpansionTileCardDemo(),
    const KnockOff(),
    const More(),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Colors.black,
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 11, 153, 175),
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/explore.png'),
            label: "Explore",
            activeIcon: Image.asset(
              'assets/icons/explore.png',
              color: const Color.fromARGB(255, 11, 153, 175),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/My Digest.png'),
            label: "My Digest",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Knockoff.png'),
            label: "Knoxkoff",
            activeIcon: Image.asset(
              'assets/icons/Knockoff.png',
              color: const Color.fromARGB(255, 11, 153, 175),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/More.png'),
            label: "more",
            activeIcon: Image.asset(
              'assets/icons/More.png',
              color: const Color.fromARGB(255, 11, 153, 175),
            ),
          ),
        ],
      ),
    );
  }
}
