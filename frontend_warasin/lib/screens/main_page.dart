import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:warasin/screens/ai_screen.dart';
import 'package:warasin/screens/education_screen.dart';
import 'package:warasin/screens/home_screen.dart';
import 'package:warasin/screens/konselor_screen.dart';
import 'package:warasin/screens/profile_screen.dart';
import 'package:warasin/theme.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  List screens = [
    HomeScreen(),
    AiScreen(),
    KonselorScreen(),
    EducationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget bottomNavigationBar() {
      return CurvedNavigationBar(
        buttonBackgroundColor: primaryColor,
        index: _index,
        onTap: (index) => setState(() {
          _index = index;
        }),
        color: primaryColor,
        animationCurve: Curves.easeOutQuart,
        backgroundColor: Colors.transparent,
        items: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/icon_home.png',
              fit: BoxFit.cover,
              width: 22,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/icon_ai.png',
              fit: BoxFit.cover,
              width: 22,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/icon_konselor.png',
              width: 22,
              fit: BoxFit.cover,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/icon_lamp.png',
              fit: BoxFit.cover,
              width: 22,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/icon_profile.png',
              fit: BoxFit.cover,
              width: 22,
              color: Colors.white,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      extendBody: true,
      body: screens[_index],
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
