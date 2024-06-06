import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_test/features/calendar/presentation/notifier/calendar_notifier.dart';
import 'package:mood_test/features/calendar/presentation/res/strings.dart';
import 'package:mood_test/features/calendar/presentation/ui/calendar_card.dart';
import 'package:mood_test/res/app_colors.dart';
import 'package:mood_test/res/app_theme.dart';
import 'package:mood_test/res/dimen.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final textThemes = getTheme().textTheme;
  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<CalendarNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset("assets/cross.svg"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Dimen.paddingHorizontal20),
            child: Text(
              Strings.today,
              style: textThemes.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.grey),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(Dimen.height24),
          child: Consumer<CalendarNotifier>(
            builder: (context, notifier, child) {
              return Text(
                '${notifier.currentYear}',
                textAlign: TextAlign.center,
                style: textThemes.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w800, fontSize: 26),
              );
            },
          ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            int firstVisibleElement = (_scrollController.offset / 210).floor();
            notifier.updateAppBarDate(firstVisibleElement);
          }
          return true;
        },
        child: GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final monthIndex = index % notifier.months.length;
            final yearIndex = index ~/ notifier.months.length;
            final items =
                notifier.getItems(notifier.startYear + yearIndex, monthIndex);
            return Padding(
              padding: const EdgeInsets.only(
                  left: Dimen.paddingHorizontal17,
                  right: Dimen.paddingHorizontal17,
                  bottom: Dimen.paddingVertical36),
              child: GestureDetector(
                child: CalendarCard(
                  month: notifier.months[monthIndex],
                  items: items,
                  isCurrentMonth: DateTime.now().month == monthIndex + 1,
                  currentYear: notifier.currentYear,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
