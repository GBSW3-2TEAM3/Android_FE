import 'package:flutter/material.dart';

final SplashProvider splashProvider = SplashProvider();

class SplashProvider extends ChangeNotifier {

  bool isLogoStat = false;

  void animationStart(BuildContext context) async {

    await Future.delayed(Duration(seconds: 1));

    isLogoStat = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));
  }
}