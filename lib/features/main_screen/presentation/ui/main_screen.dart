import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_test/features/main_screen/presentation/notifier/main_screen_change_notifier.dart';
import 'package:mood_test/features/main_screen/presentation/res/strings.dart';
import 'package:mood_test/features/main_screen/presentation/ui/datetime_display.dart';
import 'package:mood_test/features/main_screen/presentation/ui/mood_card.dart';
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
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: Dimen.paddingHorizontal20),
              child: Text("ЗДЕСЬ БУДЕТ ЧТО-ТО"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: Dimen.paddingHorizontal20),
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
                  Padding(padding: EdgeInsets.only(left: Dimen.paddingHorizontal20),),
                  MoodCard(text: "1", onPressed: notifier.onMoodChange, isSelected: notifier.mood == "1"),
                  MoodCard(text: "2", onPressed: notifier.onMoodChange, isSelected: notifier.mood == "2"),
                  MoodCard(text: "3", onPressed: notifier.onMoodChange, isSelected: notifier.mood == "3"),
                  MoodCard(text: "4", onPressed: notifier.onMoodChange, isSelected: notifier.mood == "4"),
                  MoodCard(text: "5", onPressed: notifier.onMoodChange, isSelected: notifier.mood == "5"),
                  MoodCard(text: "6", onPressed: notifier.onMoodChange, isSelected: notifier.mood == "6"),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
