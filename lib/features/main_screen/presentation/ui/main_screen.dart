import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_test/core/themes/default_decoration.dart';
import 'package:mood_test/features/main_screen/presentation/notifier/main_notifier.dart';
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

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final textThemes = getTheme().textTheme;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<MainScreenChangeNotifier>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, "/calendar"),
              icon: SvgPicture.asset(
                "assets/calendar.svg",
                colorFilter:
                    const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(Dimen.height30),
            child: Stack(
              children: [
                Container(
                  height: Dimen.height30,
                  decoration: BoxDecoration(
                    color: AppColors.buttonGrey,
                    borderRadius: BorderRadius.circular(Dimen.radius47),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    // isScrollable: true,
                    tabs: [
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/book.svg"),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: Dimen.paddingHorizontal6),
                            ),
                            const Text("Дневник настроения"),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/stats.svg"),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: Dimen.paddingHorizontal6),
                            ),
                            const Text("Статистика"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          title: const DateTimeDisplay(),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: Dimen.paddingHorizontal20,
                      bottom: Dimen.paddingVertical20,
                      top: Dimen.paddingVertical30),
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
                        padding:
                            EdgeInsets.only(left: Dimen.paddingHorizontal20),
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
                      labelText: Strings.typeNote,
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
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    content: Text(
                                      Strings.dataSaved,
                                      style: textThemes.titleLarge,
                                    ),
                                    actions: [
                                      TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: AppColors.mandarin,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            Strings.ok,
                                            style: textThemes.bodyMedium
                                                ?.copyWith(color: Colors.white),
                                          ))
                                    ],
                                  );
                                });
                          }
                        : null,
                    child: Text(
                      Strings.save,
                      style: notifier.isButtonClickable
                          ? textThemes.bodyLarge
                          : textThemes.bodyLarge
                              ?.copyWith(color: AppColors.grey),
                    ),
                  ),
                )
              ],
            ),
            const Center(
              child: Text(
                "Когда-нибудь здесь будет статистика",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
