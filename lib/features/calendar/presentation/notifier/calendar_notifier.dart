import 'package:flutter/material.dart';

class CalendarNotifier extends ChangeNotifier {
  static const int _startYear = 2024;
  int startYear = 2024;
  DateTime now = DateTime.now();
  int lastDayInPreviousMonth = 0;
  int currentYear = _startYear;

  final List<String> months = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  ];


  DateTime getDaysInMonth(int year, int month) {
    DateTime next = DateTime(year, month + 1, 1);
    DateTime lastDay = next.subtract(const Duration(days: 1));
    return lastDay;
  }

  List<String> getItems(int year, int month) {
    DateTime daysInMonth = getDaysInMonth(year, month + 1);
    List<String> numbers = List<String>.generate(
        daysInMonth.day, (index) => (index + 1).toString());

    DateTime firstDayOfMonth = DateTime(year, month + 1, 1);
    lastDayInPreviousMonth = (firstDayOfMonth.weekday - 1) % 7;

    numbers = insertSpaces(numbers);
    return numbers;
  }

  List<String> insertSpaces(List<String> numbers) {
    return List<String>.filled(lastDayInPreviousMonth, "") + numbers;
  }


}
