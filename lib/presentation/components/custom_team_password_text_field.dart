import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class CustomTeamPasswordTextField extends StatelessWidget {
  const CustomTeamPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(hintText: '비밀번호', isSecure: true),
        SizedBox(
          height: 108,
        ),
      ],
    );
  }
}
