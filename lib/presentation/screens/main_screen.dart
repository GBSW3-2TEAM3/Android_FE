import 'package:flutter/material.dart';
import 'package:walking/presentation/screens/rank_screen.dart';

import 'home_screen.dart';
import 'my_page_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _screens = [RankScreen(), HomeScreen(), MyPageScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: '순위'),
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이'),
        ],
      ),
    );
  }
}
