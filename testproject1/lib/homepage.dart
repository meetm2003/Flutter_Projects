import 'package:flutter/material.dart';
import 'package:testproject1/Animal_hospital.dart';
import 'package:testproject1/homescreen.dart';
import 'package:testproject1/profilescreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    const AnimalHospital(),
    const ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // AnnotatedRegion<SystemUiOverlayStyle>(
        //   value: SystemUiOverlayStyle.dark.copyWith(
        //     // statusBarColor: Colors.white, // Set to your desired color
        //   ),
        // child:
        Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _children.elementAt(_currentIndex),
      ),
      bottomNavigationBar: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg-2.png',
              fit: BoxFit.cover,
            ),
          ),
          BottomNavigationBar(
            backgroundColor: Colors.transparent,
            currentIndex: _currentIndex,
            elevation: 0,
            selectedItemColor: Colors.amber[800],
            onTap: onTabTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/003-dog-house-1.png',
                  width: 24,
                  height: 24,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/004-animal-hospital.png',
                  width: 24,
                  height: 24,
                ),
                label: 'Animal Hopsital',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/005-user.png',
                  width: 24,
                  height: 24,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
