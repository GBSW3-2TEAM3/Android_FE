import 'package:flutter/material.dart';

import 'create_team_screen.dart';

class RankScreen extends StatelessWidget {
  const RankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff5398FF),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset('assets/icons/search.png', width: 20)),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateTeamScreen()));
              },
              child: Image.asset('assets/icons/plus.png', width: 20)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}
