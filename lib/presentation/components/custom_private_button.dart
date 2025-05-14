import 'package:flutter/material.dart';

class CustomPrivateButton extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;
  const CustomPrivateButton({super.key, required this.onTap, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 144,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(13),
          border: value == 'private' ? Border.all(width: 1, color: Color(0xffFF0000)) : Border.all(width: 1, color: Color(0xffE4E4E4))
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: value == 'private' ? Color(0xffFF0000) : Color(0xffE4E4E4),
            fontFamily: 'Pretendard',
            fontSize: 15,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}
