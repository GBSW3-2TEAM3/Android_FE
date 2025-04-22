import 'package:flutter/material.dart';
import 'package:walking/common/color.dart';
import 'package:walking/data/repositories/auth_repository.dart';
import 'package:walking/presentation/components/custom_submit_button.dart';
import 'package:walking/presentation/components/custom_text_field.dart';
import 'package:walking/presentation/screens/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn(BuildContext context) async {
    final AuthRepository authRepository = AuthRepository();

    if (_idController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('아이디가 입력되지 않았습니다.')));
      return;
    }

    if (_passwordController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('비밀번호가 입력되지 않았습니다.')));
      return;
    }

    await authRepository.signIn(
      _idController.text.trim(),
      _passwordController.text.trim(),
      _passwordController.text.trim(),
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Group38.png', width: 300),
            SizedBox(height: 35),
            CustomTextField(
              hintText: '아이디',
              isSecure: false,
              controller: _idController,
            ),
            SizedBox(height: 15),
            CustomTextField(
              hintText: '비밀번호',
              isSecure: true,
              controller: _passwordController,
            ),
            SizedBox(height: 30),
            CustomSubmitButton(
              onTap: () {
                _signIn(context);
              },
              title: '로그인',
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '비밀번호 찾기',
                        style: TextStyle(color: Color(0xff8E8E8E)),
                      ),
                      Container(height: 1, width: 80, color: Color(0xff8E8E8E)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          '회원가입 하기',
                          style: TextStyle(color: Color(0xff8E8E8E)),
                        ),
                        Container(
                          height: 1,
                          width: 80,
                          color: Color(0xff8E8E8E),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 1, width: 100, color: Color(0xff636161)),
                SizedBox(width: 20),
                Text(
                  '간편 로그인',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    color: Color(0xff636161),
                  ),
                ),
                SizedBox(width: 20),
                Container(height: 1, width: 100, color: Color(0xff636161)),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/Group 39.png',
                  width: 50,
                  height: 50,
                ),
                Image.asset(
                  'assets/images/Group 40.png',
                  width: 50,
                  height: 50,
                ),
                Image.asset(
                  'assets/images/image 37.png',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
