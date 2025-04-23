import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final controller;
  final bool isSecure;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    required this.isSecure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: TextField(
        controller: controller,
        obscureText: isSecure,
        decoration: InputDecoration(
          hintText: hintText,
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
    );
  }
}
