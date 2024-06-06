import 'package:flutter/material.dart';
import 'package:mood_test/res/app_theme.dart';
import 'package:mood_test/res/dimen.dart';
import 'package:mood_test/res/app_colors.dart';

class MoodCard extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isSelected;
  final String asset;

  const MoodCard(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.isSelected,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    final textThemes = getTheme().textTheme;

    return GestureDetector(
      onTap: () {
        onPressed.call(text);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: Dimen.paddingHorizontal12),
        child: Container(
          height: Dimen.height118,
          width: Dimen.width83,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimen.radius76),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 10.8,
                spreadRadius: 0,
                offset: Offset(2, 4),
              ),
            ],
            border: Border.all(
                color: isSelected ? AppColors.mandarin : Colors.transparent,
                width: Dimen.width2),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: Dimen.paddingVertical23),
              ),
              Image.asset(
                "assets/$asset",
                height: 53,
                width: 50,
              ),
              Text(text, style: textThemes.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
