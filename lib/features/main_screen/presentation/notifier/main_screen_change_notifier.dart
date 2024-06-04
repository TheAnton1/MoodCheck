import 'dart:developer';

import 'package:flutter/material.dart';

class MainScreenChangeNotifier extends ChangeNotifier {
  String mood = "";

  void onMoodChange(String text) {
    mood = text;
    log(mood);
    notifyListeners();
  }
}