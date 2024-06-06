import 'package:flutter/material.dart';
import 'package:mood_test/core/themes/default_decoration.dart';
import 'package:mood_test/res/app_colors.dart';
import 'package:mood_test/res/app_theme.dart';
import 'package:mood_test/res/dimen.dart';

class MoodSlider extends StatefulWidget {
  final String first;
  final String second;
  final double sliderValue;
  final Function onChanged;

  const MoodSlider(
      {super.key,
      required this.first,
      required this.second,
      required this.sliderValue,
      required this.onChanged});

  @override
  State<MoodSlider> createState() => _MoodSliderState();
}

class _MoodSliderState extends State<MoodSlider> {
  @override
  Widget build(BuildContext context) {
    final textThemes = getTheme().textTheme;
    double value = widget.sliderValue;

    return Container(
      decoration: DefaultDecoration.getAppDecoration(),
      child: Column(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: Dimen.paddingHorizontal22,
                  right: Dimen.paddingHorizontal22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        6,
                        (index) => Container(
                              color: AppColors.helpGrey,
                              height: Dimen.height8,
                              width: Dimen.width2,
                            )),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: Dimen.paddingHorizontal22,
                  right: Dimen.paddingHorizontal22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.first,
                        style: textThemes.bodySmall
                            ?.copyWith(color: AppColors.sliderText),
                      ),
                      Text(
                        widget.second,
                        style: textThemes.bodySmall
                            ?.copyWith(color: AppColors.sliderText),
                      ),
                    ],
                  ),
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    thumbColor: AppColors.mandarin,
                    activeTrackColor: AppColors.mandarin,
                    inactiveTrackColor: AppColors.helpGrey,
                    trackHeight: Dimen.height6,
                    thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: Dimen.radius9),
                    overlayColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: value,
                    onChanged: (newValue) {
                      setState(() {
                          value = newValue;
                        },
                      );
                      widget.onChanged.call(value);
                    },
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
