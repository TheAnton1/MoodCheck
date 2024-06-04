import 'package:flutter/material.dart';
import 'package:mood_test/res/dimen.dart';
import 'package:mood_test/res/app_colors.dart';

class MoodCard extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isSelected;

  const MoodCard({super.key, required this.text, required this.onPressed, required this.isSelected});

  @override
  Widget build(BuildContext context) {
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
              width: isSelected ? Dimen.width2 : 0.0
            )
          ),
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}
