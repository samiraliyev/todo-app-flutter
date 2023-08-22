import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorialProvider extends ChangeNotifier {

  bool isFirstSignIn = false;

  Future<void> saveSignIn() async {
    isFirstSignIn = true;
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool("sign", isFirstSignIn);
    notifyListeners();
  }

  Future<void> readSignIn() async {
    
    final sharedPrefs = await SharedPreferences.getInstance();
    isFirstSignIn = sharedPrefs.getBool("sign") ?? false;
    notifyListeners();
  }
}
