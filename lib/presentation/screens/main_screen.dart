import 'package:flutter/material.dart';
import 'package:walking_go/presentation/screens/rank_screen.dart';
import 'home_screen.dart';
import 'my_page_screen.dart';

class MainScreen extends StatefulWidget {
  final int currentPage;

  const MainScreen({super.key, required this.currentPage});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentPage;
  }

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
        selectedItemColor: Color(0xff5398FF),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: onTap,
        selectedLabelStyle: TextStyle(
          fontFamily: 'Pretendard'
        ),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ranking.png',
              width: 30,
              height: 30,
              color: _currentIndex == 0 ? Color(0xff5398FF) : Colors.grey,
            ),
            label: '순위',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/homepage.png',
              color: _currentIndex == 1 ? Color(0xff5398FF) : Colors.grey,
              width: 30,
              height: 30,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/user.png',
              width: 30,
              height: 30,
              color: _currentIndex == 2 ? Color(0xff5398FF) : Colors.grey,
            ),
            label: '마이',
          ),
        ],
      ),
    );
  }
}
