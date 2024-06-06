import 'package:flutter/material.dart';

class AppBarNotifier extends ChangeNotifier {
  static const int _startYear = 2024;
  int currentYear = _startYear;

  void updateAppBarDate(int index) {
    int newYear = _startYear + index ~/ 6;
    if (currentYear != newYear) {
      Future.delayed(const Duration(milliseconds: 150), () {
        if (currentYear != newYear) {
          currentYear = newYear;
          notifyListeners();
        }
      });
    }
  }
}