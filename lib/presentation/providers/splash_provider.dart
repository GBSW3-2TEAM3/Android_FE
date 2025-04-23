import 'package:flutter/material.dart';
import '../screens/sign_in_screen.dart';

final SplashProvider splashProvider = SplashProvider();

class SplashProvider extends ChangeNotifier {

  bool isLogoStat = false;

  void animationStart(BuildContext context) async {

    await Future.delayed(Duration(seconds: 1));

    isLogoStat = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }
}