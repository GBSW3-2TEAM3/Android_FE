import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../components/custom_private_button.dart';
import '../components/custom_public_button.dart';
import '../components/custom_submit_button.dart';
import '../components/custom_team_password_text_field.dart';
import '../components/custom_team_text_field.dart';
import '../components/custom_text_field.dart';
import 'main_screen.dart';

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({super.key});

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {

  Future<void> createTeam() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('accessToken');
    final body = {
      'name': _nameController.text,
      'description': _description.text,
      'isPublic': value == 'public' ? true : false,
    };

    final response = await http.post(
      Uri.parse('/api/groups'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    print(response.statusCode);

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('팀 생성이 완료되었습니다!')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("팀 생성 안되노 이기야")));
    }
  }

  String value = 'public';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff5398FF),
          title: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(currentPage: 0),
                ),
              );
            },
            child: Image.asset('assets/icons/angle-small-left.png', width: 35),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Text(
                    '팀 생성',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Image.network(
                'https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Clipboard.png',
                width: 195,
                height: 195,
              ),
              SizedBox(height: 30),
              CustomTextField(
                hintText: '팀명',
                isSecure: false,
                controller: _nameController,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPublicButton(
                    onTap: () {
                      setState(() {
                        value = 'public';
                      });
                    },
                    title: 'Public',
                    value: value,
                  ),
                  SizedBox(width: 10),
                  CustomPrivateButton(
                    onTap: () {
                      setState(() {
                        value = 'private';
                      });
                    },
                    title: 'Private',
                    value: value,
                  ),
                ],
              ),
              SizedBox(height: 20),
              value == 'public'
                  ? CustomTeamTextField(controller: _description)
                  : CustomTeamPasswordTextField(),
              CustomSubmitButton(
                onTap: () {
                  createTeam();
                },
                title: '생성',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
