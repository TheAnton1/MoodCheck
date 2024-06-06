import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mood_test/features/calendar/presentation/notifier/calendar_notifier.dart';
import 'package:mood_test/res/app_colors.dart';
import 'package:mood_test/res/app_theme.dart';
import 'package:mood_test/res/dimen.dart';
import 'package:provider/provider.dart';

class CalendarCard extends StatefulWidget {
  final String month;
  final List<String> items;
  final bool isCurrentMonth;
  final int currentYear;

  const CalendarCard(
      {Key? key,
      required this.month,
      required this.items,
      required this.isCurrentMonth,
      required this.currentYear})
      : super(key: key);

  @override
  _CalendarCardState createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final textThemes = getTheme().textTheme;
    bool isToday = false;
    final notifier = Provider.of<CalendarNotifier>(context);

    super.build(context);

    return SizedBox(
      height: Dimen.height200,
      child: Card(
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.month,
              style: textThemes.bodySmall
                  ?.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  isToday = widget.isCurrentMonth &&
                      item == DateTime.now().day.toString() &&
                      widget.currentYear == DateTime.now().year;
                  return (isToday)
                      ? Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.peach,
                          ),
                          child: Center(
                            child: Text(
                              "$item",
                              style: textThemes.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 10),
                            ),
                          ),
                        )
                      : Center(
                          child: Text(
                            "$item",
                            style: textThemes.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 10),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
