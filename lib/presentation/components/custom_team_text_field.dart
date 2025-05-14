import 'package:flutter/material.dart';

class CustomTeamTextField extends StatelessWidget {
  final controller;

  const CustomTeamTextField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          child: TextField(
            maxLines: 4,
            controller: controller,
            decoration: InputDecoration(
              hintText: '팀 소개(100자 이내)',
              hintStyle: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                color: Color(0xff8E8E8E),
              ),
              filled: true,
              fillColor: Color(0xffF8F8F8),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xffE4E4E4)),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
