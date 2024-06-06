import 'package:flutter/material.dart';

class MainScreenChangeNotifier extends ChangeNotifier {
  String mood = "";
  String notes = "";
  bool isButtonClickable = false;

  double _stressValue = 0.5;

  double get stressValue => _stressValue;

  set stressValue(value) {
    _stressValue = value;
    notifyListeners();
  }

  double _selfrateValue = 0.5;

  double get selfrateValue => _selfrateValue;

  set selfrateValue(value) {
    _selfrateValue = value;
    notifyListeners();
  }

  void onStressChange(double newValue) {
    stressValue = newValue;
  }

  void onSelfrateChange(double newValue) {
    selfrateValue = newValue;
  }

  void onMoodChange(String text) {
    mood = text;
    checkIfButtonClickable(); 
    notifyListeners();
  }

  void checkIfButtonClickable() {
    isButtonClickable = mood.isNotEmpty && notes.isNotEmpty;
  }
}
