import 'package:flutter/material.dart';
import 'package:mood_test/res/app_colors.dart';
import 'package:mood_test/res/app_theme.dart';
import 'package:mood_test/res/dimen.dart';

class GeneralTabBarTheme {
  static TabBarTheme getTabBarTheme() {
    final textThemes = getTheme().textTheme;
    return TabBarTheme(
      tabAlignment: TabAlignment.center,
      indicatorSize: TabBarIndicatorSize.tab,
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          return Colors.transparent;
        },
      ),
      dividerColor: Colors.transparent,
      labelColor: Colors.white,
      unselectedLabelColor: AppColors.grey,
      labelStyle: textThemes.headlineSmall
          ?.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: textThemes.headlineSmall
          ?.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
      indicator: BoxDecoration(
        color: AppColors.mandarin,
        borderRadius: BorderRadius.circular(Dimen.radius47),
      ),
    );
  }
}
