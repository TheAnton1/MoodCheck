import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_test/core/ui/default_decoration.dart';
import 'package:mood_test/features/main_screen/presentation/notifier/main_screen_change_notifier.dart';
import 'package:mood_test/features/main_screen/presentation/res/strings.dart';
import 'package:mood_test/features/main_screen/presentation/ui/datetime_display.dart';
import 'package:mood_test/features/main_screen/presentation/ui/mood_card.dart';
import 'package:mood_test/features/main_screen/presentation/ui/mood_slider.dart';
import 'package:mood_test/res/app_colors.dart';
import 'package:mood_test/res/app_theme.dart';
import 'package:mood_test/res/dimen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final textThemes = getTheme().textTheme;

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<MainScreenChangeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        actions: [
          IconButton(
            onPressed: null,
            icon: SvgPicture.asset(
              "assets/calendar.svg",
              colorFilter:
                  const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
            ),
          )
        ],
        centerTitle: true,
        title: DateTimeDisplay(),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: Dimen.paddingHorizontal20),
            child: Text("ЗДЕСЬ БУДЕТ ЧТО-ТО"),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Dimen.paddingHorizontal20,
                bottom: Dimen.paddingVertical20),
            child: Text(
              Strings.feeling,
              style: textThemes.titleLarge,
            ),
          ),
          SizedBox(
            height: Dimen.height118,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: Dimen.paddingHorizontal20),
                ),
                MoodCard(
                  text: Strings.happyness,
                  onPressed: notifier.onMoodChange,
                  isSelected: notifier.mood == Strings.happyness,
                  asset: "happy.png",
                ),
                MoodCard(
                  text: Strings.fear,
                  onPressed: notifier.onMoodChange,
                  isSelected: notifier.mood == Strings.fear,
                  asset: "fear.png",
                ),
                MoodCard(
                  text: Strings.madness,
                  onPressed: notifier.onMoodChange,
                  isSelected: notifier.mood == Strings.madness,
                  asset: "madness.png",
                ),
                MoodCard(
                  text: Strings.sadness,
                  onPressed: notifier.onMoodChange,
                  isSelected: notifier.mood == Strings.sadness,
                  asset: "sadness.png",
                ),
                MoodCard(
                  text: Strings.chill,
                  onPressed: notifier.onMoodChange,
                  isSelected: notifier.mood == Strings.chill,
                  asset: "chill.png",
                ),
                MoodCard(
                  text: Strings.power,
                  onPressed: notifier.onMoodChange,
                  isSelected: notifier.mood == Strings.power,
                  asset: "power.png",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Dimen.paddingHorizontal20,
                top: Dimen.paddingVertical36,
                bottom: Dimen.paddingVertical36),
            child: Text(
              Strings.stressLevel,
              style: textThemes.titleLarge,
            ),
          ),
          MoodSlider(
            first: Strings.low,
            second: Strings.high,
            sliderValue: notifier.stressValue,
            onChanged: notifier.onStressChange,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Dimen.paddingHorizontal20,
                top: Dimen.paddingVertical36,
                bottom: Dimen.paddingVertical36),
            child: Text(
              Strings.selfrate,
              style: textThemes.titleLarge,
            ),
          ),
          MoodSlider(
            first: Strings.unconfidence,
            second: Strings.confidence,
            sliderValue: notifier.selfrateValue,
            onChanged: notifier.onSelfrateChange,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Dimen.paddingHorizontal20,
                top: Dimen.paddingVertical36,
                bottom: Dimen.paddingVertical20),
            child: Text(
              Strings.notes,
              style: textThemes.titleLarge,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimen.paddingHorizontal20),
            decoration: DefaultDecoration.getAppDecoration(),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  notifier.notes = text;
                  notifier.checkIfButtonClickable();
                });
              },
              maxLines: 3,
              style: textThemes.bodyMedium
                  ?.copyWith(color: AppColors.noteBlack, fontSize: 14),
              decoration: InputDecoration(
                labelStyle: textThemes.bodyMedium
                    ?.copyWith(color: AppColors.helpGrey, fontSize: 14),
                labelText: 'Введите заметку',
                border: InputBorder.none,
                alignLabelWithHint: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Dimen.paddingHorizontal20,
                right: Dimen.paddingHorizontal20,
                top: Dimen.paddingVertical20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mandarin,
                disabledBackgroundColor: AppColors.buttonGrey,
              ),
              onPressed: notifier.isButtonClickable
                  ? () {
                      setState(() {
                        log("message");
                      });
                    }
                  : null,
              child: Text(
                "Сохранить",
                style: notifier.isButtonClickable
                    ? textThemes.bodyLarge
                    : textThemes.bodyLarge?.copyWith(color: AppColors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
