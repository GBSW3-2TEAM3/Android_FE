import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  final Function() onTap;
  final String title;

  const CustomSubmitButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xff2C7BF1),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            fontSize: 15
          ),
        ),
      ),
    );
  }
}
