import 'package:flutter/material.dart';
import 'package:mood_test/res/app_colors.dart';
import 'package:mood_test/res/dimen.dart';

class DefaultDecoration {
  static BoxDecoration getAppDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(Dimen.radius13),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: AppColors.shadow,
          blurRadius: Dimen.radius10_8,
          spreadRadius: 0,
          offset: Offset(2, 4),
        ),
      ],
    );
  }
}
