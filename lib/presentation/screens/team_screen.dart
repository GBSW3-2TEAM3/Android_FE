import 'package:flutter/material.dart';
import 'package:walking_go/common/color.dart';

import 'create_team_screen.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
