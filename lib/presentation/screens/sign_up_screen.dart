import 'package:flutter/material.dart';
import 'package:walking/data/repositories/auth_repository.dart';
import 'package:walking/presentation/components/custom_submit_button.dart';
import 'package:walking/presentation/components/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  void _signUp(BuildContext context) async {
    final AuthRepository authRepository = AuthRepository();

    await authRepository.signUp(
      _nameController.text,
      _passwordController.text,
      _confirmController.text,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hintText: '이름',
            isSecure: false,
            controller: _nameController,
          ),
          SizedBox(height: 10),
          CustomTextField(
            hintText: '비밀번호',
            isSecure: true,
            controller: _passwordController,
          ),
          SizedBox(height: 10),
          CustomTextField(
            hintText: '비밀번호 확인',
            isSecure: true,
            controller: _confirmController,
          ),
          SizedBox(height: 30),
          CustomSubmitButton(onTap: () {
            _signUp(context);
          }, title: '회원가입'),
        ],
      ),
    );
  }
}
